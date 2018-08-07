pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- scumm-8 game template
-- paul nicholas

-- [debug flags]
-- show_debuginfo = true
-- show_collision = true
-- show_pathfinding = true
-- show_depth = true

-- [game flags]
enable_diag_squeeze = false	-- allow squeeze through diag gap?


-- game verbs (used in room definitions and ui)
verbs = {
	--{verb = verb_ref_name}, text = display_name
	{ { open = "open" }, text = "open" },
	{ { close = "close" }, text = "close" },
	{ { give = "give" }, text = "give" },
	{ { pickup = "pickup" }, text = "pick-up" },
	{ { lookat = "lookat" }, text = "look-at" },
	{ { talkto = "talkto" }, text = "talk-to" },
	{ { push = "push" }, text = "push" },
	{ { pull = "pull" }, text = "pull"},
	{ { use = "use" }, text = "use"}
}
-- verb to use when just clicking aroung (e.g. move actor)
verb_default = {
	{ walkto = "walkto" }, text = "walk to"
} 
-- index of the verb to use when clicking items in inventory (e.g. look-at)
verb_default_inventory_index = 5


function reset_ui()
	verb_maincol = 12  -- main color (lt blue)
	verb_hovcol = 7    -- hover color (white)
	verb_shadcol = 1   -- shadow (dk blue)
	verb_defcol = 10   -- default action (yellow)
 ui_cursorspr = 96  -- default cursor sprite
 ui_uparrowspr = 80 -- default up arrow sprite
 ui_dnarrowspr = 112-- default up arrow sprite
 -- default cols to use when animating cursor
 ui_cursor_cols = {7,12,13,13,12,7}
end
-- initial ui setup
reset_ui()


-- 
-- room & object definitions
-- 

-- [ ground floor ]
	-- hall
		-- objects
			obj_front_door_inside = {		
				data = [[
					name = front door
					state = state_closed
					x=8
					y=16
					z=1
					w=1
					h=4
					state_closed=79
					classes = {class_openable,class_door}
					use_pos = pos_right
					use_dir = face_left
				]],
				init = function(me)  
					me.target_door = obj_front_door
				end
			}

			obj_hall_door_library = {		
				data = [[
					name=library
					state=state_open
					x=136
					y=16
					w=1
					h=3
					use_dir = face_back
				]],
				verbs = {
					walkto = function(me)
						come_out_door(me, obj_library_door_hall)
					end
				}
			}

			obj_hall_door_kitchen = {		
				data = [[
					name = kitchen
					state = state_open
					x=176
					y=16
					w=1
					h=4
					use_pos = pos_left
					use_dir = face_right
				]],
				verbs = {
					walkto = function(me)
						come_out_door(me, obj_kitchen_door_hall)
					end
				}
			}

		
			obj_spinning_top = {		
				data = [[
					name=spinning top
					x=42
					y=50
					w=1
					h=1
					state=1
					states={158,174,190}
					col_replace={12,7}
					trans_col=15
				]],
				scripts = {
					spin_top = function()
						dir=-1				
						while true do	
							for x=1,3 do					
								for f=1,3 do
									obj_spinning_top.state = f
									break_time(4)
								end
								-- move top
								obj_spinning_top.x -= dir					
							end	
							dir *= -1
						end				
					end,
				},
				verbs = {
					use = function(me)
						if script_running(me.scripts.spin_top) then
							stop_script(me.scripts.spin_top)
							me.state = 1
						else
							start_script(me.scripts.spin_top)
						end
					end
				}
			}



		rm_hall = {
			data = [[
				map = {32,24,55,31}
				col_replace = {5,2}
			]],
			objects = {
				obj_spinning_top,
				obj_front_door_inside,
				obj_hall_door_library,
				obj_hall_door_kitchen,
			},
			enter = function(me)
				if not me.done_intro then
					-- don't do this again
					me.done_intro = true
					-- set which actor the player controls by default
					selected_actor = main_actor
					-- init actor
					put_at(selected_actor, 30, 55, rm_hall)
					-- make camera follow player
					-- (setting now, will be re-instated after cutscene)
					camera_follow(selected_actor)
				end
				-- animate clock
				start_script(me.scripts.anim_clock, true) -- bg script
			end,
			exit = function(me)
				-- pause clock while not in room
				stop_script(me.scripts.anim_clock)
			end,
			scripts = {
			}
		}

	



-- "the void" (room)
-- a place to put objects/actors when not in a room	
	-- objects

	rm_void = {
		data = [[
			map = {0,0}
		]],
		objects = {
		},
	}




-- 
-- active rooms list
-- 
rooms = {
	rm_void,
	rm_hall,
}



--
-- actor definitions
-- 

	-- initialize the player's actor object
	main_actor = { 	
		data = [[
			name = humanoid
			w = 1
			h = 4
			idle = { 193, 197, 199, 197 }
			talk = { 218, 219, 220, 219 }
			walk_anim_side = { 196, 197, 198, 197 }
			walk_anim_front = { 194, 193, 195, 193 }
			walk_anim_back = { 200, 199, 201, 199 }
			col = 12
			trans_col = 11
			walk_speed = 0.6
			frame_delay = 5
			classes = {class_actor}
			face_dir = face_front
		]],
		-- sprites for directions (front, left, back, right) - note: right=left-flipped
		inventory = {
			obj_switch_tent
		},
		verbs = {
			use = function(me)
				selected_actor = me
				camera_follow(me)
			end
		}
	}


-- 
-- active actors list
-- 
actors = {
	main_actor,
	-- purp_tentacle,
	-- mi_actor
}


-- 
-- scripts
-- 

-- this script is execute once on game startup
function startup_script()	
	-- set ui colors
	reset_ui()

	-- set which room to start the game in 
	-- (e.g. could be a "pseudo" room for title screen!)
	change_room(rm_hall, 1) -- iris fade
end


-- (end of customisable game content)





























-- ==============================
-- scumm-8 public api functions
-- 
-- (you should not need to modify anything below here!)


function shake(bp) if bp then
bq=1 end br=bp end function bs(bt) local bu=nil if has_flag(bt.classes,"class_talkable") then
bu="talkto"elseif has_flag(bt.classes,"class_openable") then if bt.state=="state_closed"then
bu="open"else bu="close"end else bu="lookat"end for bv in all(verbs) do bw=get_verb(bv) if bw[2]==bu then bu=bv break end
end return bu end function bx(by,bz,ca) local cb=has_flag(bz.classes,"class_actor") if by=="walkto"then
return elseif by=="pickup"then if cb then
say_line"i don't need them"else say_line"i don't need that"end elseif by=="use"then if cb then
say_line"i can't just *use* someone"end if ca then
if has_flag(ca.classes,class_actor) then
say_line"i can't use that on someone!"else say_line"that doesn't work"end end elseif by=="give"then if cb then
say_line"i don't think i should be giving this away"else say_line"i can't do that"end elseif by=="lookat"then if cb then
say_line"i think it's alive"else say_line"looks pretty ordinary"end elseif by=="open"then if cb then
say_line"they don't seem to open"else say_line"it doesn't seem to open"end elseif by=="close"then if cb then
say_line"they don't seem to close"else say_line"it doesn't seem to close"end elseif by=="push"or by=="pull"then if cb then
say_line"moving them would accomplish nothing"else say_line"it won't budge!"end elseif by=="talkto"then if cb then
say_line"erm... i don't think they want to talk"else say_line"i am not talking to that!"end else say_line"hmm. no."end end function camera_at(cc) cam_x=ce(cc) cf=nil cg=nil end function camera_follow(ch) stop_script(ci) cg=ch cf=nil ci=function() while cg do if cg.in_room==room_curr then
cam_x=ce(cg) end yield() end end start_script(ci,true) if cg.in_room!=room_curr then
change_room(cg.in_room,1) end end function camera_pan_to(cc) cf=ce(cc) cg=nil ci=function() while(true) do if cam_x==cf then
cf=nil return elseif cf>cam_x then cam_x+=0.5 else cam_x-=0.5 end yield() end end start_script(ci,true) end function wait_for_camera() while script_running(ci) do yield() end end function cutscene(type,cj,ck) cl={cm=type,cn=cocreate(cj),co=ck,cp=cg} add(cq,cl) cr=cl break_time() end function dialog_set(cs) for msg in all(cs) do dialog_add(msg) end end function dialog_add(msg) if not ct then ct={cu={},cv=false} end
cw=cx(msg,32) cy=cz(cw) da={num=#ct.cu+1,msg=msg,cw=cw,db=cy} add(ct.cu,da) end function dialog_start(col,dc) ct.col=col ct.dc=dc ct.cv=true selected_sentence=nil end function dialog_hide() ct.cv=false end function dialog_clear() ct.cu={} selected_sentence=nil end function dialog_end() ct=nil end function get_use_pos(bt) local dd=bt.use_pos local x=bt.x local y=bt.y if type(dd)=="table"then
x=dd[1] y=dd[2] elseif dd=="pos_left"then if bt.de then
x-=(bt.w*8+4) y+=1 else x-=2 y+=((bt.h*8)-2) end elseif dd=="pos_right"then x+=(bt.w*8) y+=((bt.h*8)-2) elseif dd=="pos_above"then x+=((bt.w*8)/2)-4 y-=2 elseif dd=="pos_center"then x+=((bt.w*8)/2) y+=((bt.h*8)/2)-4 elseif dd=="pos_infront"or dd==nil then x+=((bt.w*8)/2)-4 y+=(bt.h*8)+2 end return{x=x,y=y} end function do_anim(df,dg,dh) if dg=="face_towards"then
di={"face_front","face_left","face_back","face_right"} if type(dh)=="table"then
dj=atan2(df.x-dh.x,dh.y-df.y) dk=93*(3.1415/180) dj=dk-dj dl=dj*360 dl=dl%360 if dl<0 then dl+=360 end
dh=4-flr(dl/90) dh=di[dh] end face_dir=dm[df.face_dir] dh=dm[dh] while face_dir!=dh do if face_dir<dh then
face_dir+=1 else face_dir-=1 end df.face_dir=di[face_dir] df.flip=(df.face_dir=="face_left") break_time(10) end else df.dn=dg df.dp=1 df.dq=1 end end function open_door(dr,ds) if dr.state=="state_open"then
say_line"it's already open"else dr.state="state_open"if ds then ds.state="state_open"end
end end function close_door(dr,ds) if dr.state=="state_closed"then
say_line"it's already closed"else dr.state="state_closed"if ds then ds.state="state_closed"end
end end function come_out_door(dt,du,dv) if du==nil then
dw("target door does not exist") return end if dt.state=="state_open"then
dx=du.in_room if dx!=room_curr then
change_room(dx,dv) end local dy=get_use_pos(du) put_at(selected_actor,dy.x,dy.y,dx) dz={face_front="face_back",face_left="face_right",face_back="face_front",face_right="face_left"} if du.use_dir then
ea=dz[du.use_dir] else ea=1 end selected_actor.face_dir=ea selected_actor.flip=(selected_actor.face_dir=="face_left") else say_line("the door is closed") end end function fades(eb,bc) if bc==1 then
ec=0 else ec=50 end while true do ec+=bc*2 if ec>50
or ec<0 then return end if eb==1 then
ed=min(ec,32) end yield() end end function change_room(dx,eb) if dx==nil then
dw("room does not exist") return end stop_script(ee) if eb and room_curr then
fades(eb,1) end if room_curr and room_curr.exit then
room_curr.exit(room_curr) end ef={} eg() room_curr=dx if not cg
or cg.in_room!=room_curr then cam_x=0 end stop_talking() if eb then
ee=function() fades(eb,-1) end start_script(ee,true) else ed=0 end if room_curr.enter then
room_curr.enter(room_curr) end end function valid_verb(by,eh) if not eh
or not eh.verbs then return false end if type(by)=="table"then
if eh.verbs[by[1]] then return true end
else if eh.verbs[by] then return true end
end return false end function pickup_obj(bt,ch) ch=ch or selected_actor add(ch.bn,bt) bt.owner=ch del(bt.in_room.objects,bt) end function start_script(ei,ej,ek,el) local cn=cocreate(ei) local scripts=ef if ej then
scripts=em end add(scripts,{ei,cn,ek,el}) end function script_running(ei) for en in all({ef,em}) do for eo,ep in pairs(en) do if ep[1]==ei then
return ep end end end return false end function stop_script(ei) ep=script_running(ei) if ep then
del(ef,ep) del(em,ep) end end function break_time(eq) eq=eq or 1 for x=1,eq do yield() end end function wait_for_message() while er!=nil do yield() end end function say_line(ch,msg,es,et) if type(ch)=="string"then
msg=ch ch=selected_actor end eu=ch.y-(ch.h)*8+4 ev=ch print_line(msg,ch.x,eu,ch.col,1,es,et) end function stop_talking() er,ev=nil,nil end function print_line(msg,x,y,col,ew,es,et) local col=col or 7 local ew=ew or 0 if ew==1 then
ex=min(x-cam_x,127-(x-cam_x)) else ex=127-(x-cam_x) end local ey=max(flr(ex/2),16) local ez=""for fa=1,#msg do local fb=sub(msg,fa,fa) if fb==":"then
ez=sub(msg,fa+1) msg=sub(msg,1,fa-1) break end end local cw=cx(msg,ey) local cy=cz(cw) fc=x-cam_x if ew==1 then
fc-=((cy*4)/2) end fc=max(2,fc) eu=max(18,y) fc=min(fc,127-(cy*4)-1) er={fd=cw,x=fc,y=eu,col=col,ew=ew,fe=et or(#msg)*8,db=cy,es=es} if#ez>0 then
ff=ev wait_for_message() ev=ff print_line(ez,x,y,col,ew,es) end wait_for_message() end function put_at(bt,x,y,fg) if fg then
if not has_flag(bt.classes,"class_actor") then
if bt.in_room then del(bt.in_room.objects,bt) end
add(fg.objects,bt) bt.owner=nil end bt.in_room=fg end bt.x,bt.y=x,y end function stop_actor(ch) ch.fh=0 ch.dn=nil eg() end function walk_to(ch,x,y) local fi=fj(ch) local fk=flr(x/8)+room_curr.map[1] local fl=flr(y/8)+room_curr.map[2] local fm={fk,fl} local fn=fo(fi,fm,{x,y}) ch.fh=1 for fp=1,#fn do fq=fn[fp] local fr=ch.walk_speed*(ch.scale or ch.fs) local ft,fu ft=(fq[1]-room_curr.map[1])*8+4 fu=(fq[2]-room_curr.map[2])*8+4 if fp==#fn then
if x>=ft-4 and x<=ft+4
and y>=fu-4 and y<=fu+4 then ft=x fu=y end end local fv=sqrt((ft-ch.x)^2+(fu-ch.y)^2) local fw=fr*(ft-ch.x)/fv local fx=fr*(fu-ch.y)/fv if ch.fh==0 then
return end if fv>0 then
for fa=0,fv/fr-1 do ch.flip=(fw<0) if abs(fw)<fr/2 then
if fx>0 then
ch.dn=ch.walk_anim_front ch.face_dir="face_front"else ch.dn=ch.walk_anim_back ch.face_dir="face_back"end else ch.dn=ch.walk_anim_side ch.face_dir="face_right"if ch.flip then ch.face_dir="face_left"end
end ch.x+=fw ch.y+=fx yield() end end end ch.fh=2 ch.dn=nil end function wait_for_actor(ch) ch=ch or selected_actor while ch.fh!=2 do yield() end end function proximity(bz,ca) if bz.in_room==ca.in_room then
local fv=sqrt((bz.x-ca.x)^2+(bz.y-ca.y)^2) return fv else return 1000 end end fy=16 cam_x,cf,ci,bq=0,nil,nil,0 fz,ga,gb,gc=63.5,63.5,0,1 gd={{spr=ui_uparrowspr,x=75,y=fy+60},{spr=ui_dnarrowspr,x=75,y=fy+72}} dm={face_front=1,face_left=2,face_back=3,face_right=4} function ge(bt) local gf={} for eo,bv in pairs(bt) do add(gf,eo) end return gf end function get_verb(bt) local by={} local gf=ge(bt[1]) add(by,gf[1]) add(by,bt[1][gf[1]]) add(by,bt.text) return by end function eg() gg=get_verb(verb_default) gh,gi,n,gj,gk=nil,nil,nil,false,""end eg() er=nil ct=nil cr=nil ev=nil em={} ef={} cq={} gl={} ed,ed=0,0 gm=0 function _init() poke(0x5f2d,1) gn() start_script(startup_script,true) end function _update60() go() end function _draw() gp() end function go() if selected_actor and selected_actor.cn
and not coresume(selected_actor.cn) then selected_actor.cn=nil end gq(em) if cr then
if cr.cn
and not coresume(cr.cn) then if cr.cm!=3
and cr.cp then camera_follow(cr.cp) selected_actor=cr.cp end del(cq,cr) if#cq>0 then
cr=cq[#cq] else if cr.cm!=2 then
gm=3 end cr=nil end end else gq(ef) end gr() gs() gt,gu=1.5-rnd(3),1.5-rnd(3) gt=flr(gt*bq) gu=flr(gu*bq) if not br then
bq*=0.90 if bq<0.05 then bq=0 end
end end function gp() rectfill(0,0,127,127,0) camera(cam_x+gt,0+gu) clip(0+ed-gt,fy+ed-gu,128-ed*2-gt,64-ed*2) gv() camera(0,0) clip() if show_debuginfo then
print("cpu: "..flr(100*stat(1)).."%",0,fy-16,8) print("mem: "..flr(stat(0)/1024*100).."%",0,fy-8,8) print("x: "..flr(fz+cam_x).." y:"..ga-fy,80,fy-8,8) end gw() if ct
and ct.cv then gx() gy() return end if gm>0 then
gm-=1 return end if not cr then
gz() end if(not cr
or cr.cm==2) and gm==0 then ha() end if not cr then
gy() end end function hb() if stat(34)>0 then
if not hc then
hc=true end else hc=false end end function gr() if er and not hc then
if(btnp(4) or stat(34)==1) then
er.fe=0 hc=true return end end if cr then
if(btnp(5) or stat(34)==2)
and cr.co then cr.cn=cocreate(cr.co) cr.co=nil return end hb() return end if btn(0) then fz-=1 end
if btn(1) then fz+=1 end
if btn(2) then ga-=1 end
if btn(3) then ga+=1 end
if btnp(4) then hd(1) end
if btnp(5) then hd(2) end
he,hf=stat(32)-1,stat(33)-1 if he!=hg then fz=he end
if hf!=hh then ga=hf end
if stat(34)>0 and not hc then
hd(stat(34)) end hg=he hh=hf hb() end fz=mid(0,fz,127) ga=mid(0,ga,127) function hd(hi) local hj=gg if not selected_actor then
return end if ct and ct.cv then
if hk then
selected_sentence=hk end return end if hl then
gg=get_verb(hl) gh=nil gi=nil elseif hm then if hi==1 then
if gh then
gi=hm else gh=hm end if(gg[2]==get_verb(verb_default)[2]
and hm.owner) then gg=get_verb(verbs[verb_default_inventory_index]) end elseif hn then gg=get_verb(hn) gh=hm ge(gh) gz() end elseif ho then if ho==gd[1] then
if selected_actor.hp>0 then
selected_actor.hp-=1 end else if selected_actor.hp+2<flr(#selected_actor.bn/4) then
selected_actor.hp+=1 end end return end if gh!=nil
then if gg[2]=="use"or gg[2]=="give"then
if gi then
elseif gh.use_with and gh.owner==selected_actor then return end end gj=true selected_actor.cn=cocreate(function() if(not gh.owner
and(not has_flag(gh.classes,"class_actor") or gg[2]!="use")) or gi then hq=gi or gh hr=get_use_pos(hq) walk_to(selected_actor,hr.x,hr.y) if selected_actor.fh!=2 then return end
use_dir=hq if hq.use_dir then use_dir=hq.use_dir end
do_anim(selected_actor,"face_towards",use_dir) end if valid_verb(gg,gh) then
start_script(gh.verbs[gg[1]],false,gh,gi) else if has_flag(gh.classes,"class_door") then
if gg[2]=="walkto"then
come_out_door(gh,gh.target_door) elseif gg[2]=="open"then open_door(gh,gh.target_door) elseif gg[2]=="close"then close_door(gh,gh.target_door) end else bx(gg[2],gh,gi) end end eg() end) coresume(selected_actor.cn) elseif ga>fy and ga<fy+64 then gj=true selected_actor.cn=cocreate(function() walk_to(selected_actor,fz+cam_x,ga-fy) eg() end) coresume(selected_actor.cn) end end function gs() if not room_curr then
return end hl,hn,hm,hk,ho=nil,nil,nil,nil,nil if ct
and ct.cv then for en in all(ct.cu) do if hs(en) then
hk=en end end return end ht() for bt in all(room_curr.objects) do if(not bt.classes
or(bt.classes and not has_flag(bt.classes,"class_untouchable"))) and(not bt.dependent_on or bt.dependent_on.state==bt.dependent_on_state) then hu(bt,bt.w*8,bt.h*8,cam_x,hv) else bt.hw=nil end if hs(bt) then
if not hm
or(not bt.z and hm.z<0) or(bt.z and hm.z and bt.z>hm.z) then hm=bt end end hx(bt) end for eo,ch in pairs(actors) do if ch.in_room==room_curr then
hu(ch,ch.w*8,ch.h*8,cam_x,hv) hx(ch) if hs(ch)
and ch!=selected_actor then hm=ch end end end if selected_actor then
for bv in all(verbs) do if hs(bv) then
hl=bv end end for hy in all(gd) do if hs(hy) then
ho=hy end end for eo,bt in pairs(selected_actor.bn) do if hs(bt) then
hm=bt if gg[2]=="pickup"and hm.owner then
gg=nil end end if bt.owner!=selected_actor then
del(selected_actor.bn,bt) end end if gg==nil then
gg=get_verb(verb_default) end if hm then
hn=bs(hm) end end end function ht() gl={} for x=-64,64 do gl[x]={} end end function hx(bt) eu=-1 if bt.hz then
eu=bt.y else eu=bt.y+(bt.h*8) end ia=flr(eu) if bt.z then
ia=bt.z end add(gl[ia],bt) end function gv() if not room_curr then
print("-error-  no current room set",5+cam_x,5+fy,8,0) return end rectfill(0,fy,127,fy+64,room_curr.ib or 0) for z=-64,64 do if z==0 then
ic(room_curr) if room_curr.trans_col then
palt(0,false) palt(room_curr.trans_col,true) end map(room_curr.map[1],room_curr.map[2],0,fy,room_curr.id,room_curr.ie) pal() else ia=gl[z] for bt in all(ia) do if not has_flag(bt.classes,"class_actor") then
if bt.states
or(bt.state and bt[bt.state] and bt[bt.state]>0) and(not bt.dependent_on or bt.dependent_on.state==bt.dependent_on_state) and not bt.owner or bt.draw or bt.dn then ig(bt) end else if bt.in_room==room_curr then
ih(bt) end end end end end end function ic(bt) if bt.col_replace then
fp=bt.col_replace pal(fp[1],fp[2]) end if bt.lighting then
ii(bt.lighting) elseif bt.in_room and bt.in_room.lighting then ii(bt.in_room.lighting) end end function ig(bt) local ij=0 ic(bt) if bt.draw then
bt.draw(bt) else if bt.dn then
ik(bt) ij=bt.dn[bt.dp] end il=1 if bt.repeat_x then il=bt.repeat_x end
for h=0,il-1 do if bt.states then
ij=bt.states[bt.state] elseif ij==0 then ij=bt[bt.state] end im(ij,bt.x+(h*(bt.w*8)),bt.y,bt.w,bt.h,bt.trans_col,bt.flip_x,bt.scale) end end pal() end function ih(ch) io=dm[ch.face_dir] if ch.dn
and(ch.fh==1 or type(ch.dn)=="table") then ik(ch) ij=ch.dn[ch.dp] else ij=ch.idle[io] end ic(ch) local ip=(ch.y-room_curr.autodepth_pos[1])/(room_curr.autodepth_pos[2]-room_curr.autodepth_pos[1]) ip=room_curr.autodepth_scale[1]+(room_curr.autodepth_scale[2]-room_curr.autodepth_scale[1])*ip ch.fs=mid(room_curr.autodepth_scale[1],ip,room_curr.autodepth_scale[2]) local scale=ch.scale or ch.fs local iq=(8*ch.h) local ir=(8*ch.w) local is=iq-(iq*scale) local it=ir-(ir*scale) local iu=ch.de+flr(it/2) local iv=ch.hz+is im(ij,iu,iv,ch.w,ch.h,ch.trans_col,ch.flip,false,scale) if ev
and ev==ch and ev.talk then if ch.iw<7 then
im(ch.talk[io],iu+(ch.talk[5] or 0),iv+flr((ch.talk[6] or 8)*scale),(ch.talk[7] or 1),(ch.talk[8] or 1),ch.trans_col,ch.flip,false,scale) end ch.iw+=1 if ch.iw>14 then ch.iw=1 end
end pal() end function gz() ix=""iy=verb_maincol iz=gg[2] if gg then
ix=gg[3] end if gh then
ix=ix.." "..gh.name if iz=="use"and(not gj or gi) then
ix=ix.." with"elseif iz=="give"then ix=ix.." to"end end if gi then
ix=ix.." "..gi.name elseif hm and hm.name!=""and(not gh or(gh!=hm)) and not gj then if hm.owner
and iz==get_verb(verb_default)[2] then ix="look-at"end ix=ix.." "..hm.name end gk=ix if gj then
ix=gk iy=verb_hovcol end print(ja(ix),jb(ix),fy+66,iy) end function gw() if er then
jc=0 for jd in all(er.fd) do je=0 if er.ew==1 then
je=((er.db*4)-(#jd*4))/2 end outline_text(jd,er.x+je,er.y+jc,er.col,0,er.es) jc+=6 end er.fe-=1 if er.fe<=0 then
stop_talking() end end end function ha() fc,eu,jf=0,75,0 for bv in all(verbs) do jg=verb_maincol if hn
and bv==hn then jg=verb_defcol end if bv==hl then jg=verb_hovcol end
bw=get_verb(bv) print(bw[3],fc,eu+fy+1,verb_shadcol) print(bw[3],fc,eu+fy,jg) bv.x=fc bv.y=eu hu(bv,#bw[3]*4,5,0,0) if#bw[3]>jf then jf=#bw[3] end
eu+=8 if eu>=95 then
eu=75 fc+=(jf+1.0)*4 jf=0 end end if selected_actor then
fc,eu=86,76 jh=selected_actor.hp*4 ji=min(jh+8,#selected_actor.bn) for jj=1,8 do rectfill(fc-1,fy+eu-1,fc+8,fy+eu+8,verb_shadcol) bt=selected_actor.bn[jh+jj] if bt then
bt.x,bt.y=fc,eu ig(bt) hu(bt,bt.w*8,bt.h*8,0,0) end fc+=11 if fc>=125 then
eu+=12 fc=86 end jj+=1 end for fa=1,2 do jk=gd[fa] if ho==jk then
pal(7,verb_hovcol) else pal(7,verb_maincol) end pal(5,verb_shadcol) im(jk.spr,jk.x,jk.y,1,1,0) hu(jk,8,7,0,0) pal() end end end function gx() fc,eu=0,70 for en in all(ct.cu) do if en.db>0 then
en.x,en.y=fc,eu hu(en,en.db*4,#en.cw*5,0,0) jg=ct.col if en==hk then jg=ct.dc end
for jd in all(en.cw) do print(ja(jd),fc,eu+fy,jg) eu+=5 end eu+=2 end end end function gy() col=ui_cursor_cols[gc] pal(7,col) spr(ui_cursorspr,fz-4,ga-3,1,1,0) pal() gb+=1 if gb>7 then
gb=1 gc+=1 if gc>#ui_cursor_cols then gc=1 end
end end function im(jl,x,y,w,h,jm,flip_x,jn,scale) set_trans_col(jm,true) jl=jl or 0 local jo=8*(jl%16) local jp=8*flr(jl/16) local jq=8*w local jr=8*h local js=scale or 1 local jt=jq*js local ju=jr*js sspr(jo,jp,jq,jr,x,fy+y,jt,ju,flip_x,jn) end function set_trans_col(jm,bp) palt(0,false) palt(jm,true) if jm and jm>0 then
palt(0,false) end end function gn() for fg in all(rooms) do jv(fg) if(#fg.map>2) then
fg.id=fg.map[3]-fg.map[1]+1 fg.ie=fg.map[4]-fg.map[2]+1 else fg.id=16 fg.ie=8 end fg.autodepth_pos=fg.autodepth_pos or{9,50} fg.autodepth_scale=fg.autodepth_scale or{0.25,1} for bt in all(fg.objects) do jv(bt) bt.in_room=fg bt.h=bt.h or 0 if bt.init then
bt.init(bt) end end end for jw,ch in pairs(actors) do jv(ch) ch.fh=2 ch.dq=1 ch.iw=1 ch.dp=1 ch.bn={} ch.hp=0 end end function gq(scripts) for ep in all(scripts) do if ep[2] and not coresume(ep[2],ep[3],ep[4]) then
del(scripts,ep) ep=nil end end end function ii(jx) if jx then jx=1-jx end
local fq=flr(mid(0,jx,1)*100) local jy={0,1,1,2,1,13,6,4,4,9,3,13,1,13,14} for jz=1,15 do col=jz ka=(fq+(jz*1.46))/22 for eo=1,ka do col=jy[col] end pal(jz,col) end end function ce(cc) if type(cc)=="table"then
cc=cc.x end return mid(0,cc-64,(room_curr.id*8)-128) end function fj(bt) local fk=flr(bt.x/8)+room_curr.map[1] local fl=flr(bt.y/8)+room_curr.map[2] return{fk,fl} end function kb(fk,fl) local kc=mget(fk,fl) local kd=fget(kc,0) return kd end function cx(msg,ey) local cw={} local ke=""local kf=""local fb=""local kg=function(kh) if#kf+#ke>kh then
add(cw,ke) ke=""end ke=ke..kf kf=""end for fa=1,#msg do fb=sub(msg,fa,fa) kf=kf..fb if fb==" "
or#kf>ey-1 then kg(ey) elseif#kf>ey-1 then kf=kf.."-"kg(ey) elseif fb==";"then ke=ke..sub(kf,1,#kf-1) kf=""kg(0) end end kg(ey) if ke!=""then
add(cw,ke) end return cw end function cz(cw) cy=0 for jd in all(cw) do if#jd>cy then cy=#jd end
end return cy end function has_flag(bt,ki) for kj in all(bt) do if kj==ki then
return true end end return false end function hu(bt,w,h,kk,kl) x=bt.x y=bt.y if has_flag(bt.classes,"class_actor") then
bt.de=x-(bt.w*8)/2 bt.hz=y-(bt.h*8)+1 x=bt.de y=bt.hz end bt.hw={x=x,y=y+fy,km=x+w-1,kn=y+h+fy-1,kk=kk,kl=kl} end function fo(ko,kp) local kq,kr,ks,kt,ku={},{},{},nil,nil kv(kq,ko,0) kr[kw(ko)]=nil ks[kw(ko)]=0 while#kq>0 and#kq<1000 do local kx=kq[#kq] del(kq,kq[#kq]) ky=kx[1] if kw(ky)==kw(kp) then
break end local kz={} for x=-1,1 do for y=-1,1 do if x==0 and y==0 then
else local la=ky[1]+x local lb=ky[2]+y if abs(x)!=abs(y) then lc=1 else lc=1.4 end
if la>=room_curr.map[1] and la<=room_curr.map[1]+room_curr.id
and lb>=room_curr.map[2] and lb<=room_curr.map[2]+room_curr.ie and kb(la,lb) and((abs(x)!=abs(y)) or kb(la,ky[2]) or kb(la-x,lb) or enable_diag_squeeze) then add(kz,{la,lb,lc}) end end end end for ld in all(kz) do local le=kw(ld) local lf=ks[kw(ky)]+ld[3] if not ks[le]
or lf<ks[le] then ks[le]=lf local h=max(abs(kp[1]-ld[1]),abs(kp[2]-ld[2])) local lg=lf+h kv(kq,ld,lg) kr[le]=ky if not kt
or h<kt then kt=h ku=le lh=ld end end end end local fn={} ky=kr[kw(kp)] if ky then
add(fn,kp) elseif ku then ky=kr[ku] add(fn,lh) end if ky then
local li=kw(ky) local lj=kw(ko) while li!=lj do add(fn,ky) ky=kr[li] li=kw(ky) end for fa=1,#fn/2 do local lk=fn[fa] local ll=#fn-(fa-1) fn[fa]=fn[ll] fn[ll]=lk end end return fn end function kv(lm,cc,fq) if#lm>=1 then
add(lm,{}) for fa=(#lm),2,-1 do local ld=lm[fa-1] if fq<ld[2] then
lm[fa]={cc,fq} return else lm[fa]=ld end end lm[1]={cc,fq} else add(lm,{cc,fq}) end end function kw(ln) return((ln[1]+1)*16)+ln[2] end function ik(bt) bt.dq+=1 if bt.dq>bt.frame_delay then
bt.dq=1 bt.dp+=1 if bt.dp>#bt.dn then bt.dp=1 end
end end function dw(msg) print_line("-error-;"..msg,5+cam_x,5,8,0) end function jv(bt) local cw=lo(bt.data,"\n") for jd in all(cw) do local pairs=lo(jd,"=") if#pairs==2 then
bt[pairs[1]]=lp(pairs[2]) else printh(" > invalid data: ["..pairs[1].."]") end end end function lo(en,lq) local lr={} local jh=0 local lt=0 for fa=1,#en do local lu=sub(en,fa,fa) if lu==lq then
add(lr,sub(en,jh,lt)) jh=0 lt=0 elseif lu!=" "and lu!="\t"then lt=fa if jh==0 then jh=fa end
end end if jh+lt>0 then
add(lr,sub(en,jh,lt)) end return lr end function lp(lv) local lw=sub(lv,1,1) local lr=nil if lv=="true"then
lr=true elseif lv=="false"then lr=false elseif lx(lw) then if lw=="-"then
lr=sub(lv,2,#lv)*-1 else lr=lv+0 end elseif lw=="{"then local lk=sub(lv,2,#lv-1) lr=lo(lk,",") ly={} for cc in all(lr) do cc=lp(cc) add(ly,cc) end lr=ly else lr=lv end return lr end function lx(fp) for lz=1,13 do if fp==sub("0123456789.-+",lz,lz) then
return true end end end function outline_text(ma,x,y,mb,mc,es) if not es then ma=ja(ma) end
for md=-1,1 do for me=-1,1 do print(ma,x+md,y+me,mc) end end print(ma,x,y,mb) end function jb(en) return 63.5-flr((#en*4)/2) end function mf(en) return 61 end function hs(bt) if not bt.hw
or cr then return false end hw=bt.hw if(fz+hw.kk>hw.km or fz+hw.kk<hw.x)
or(ga>hw.kn or ga<hw.y) then return false else return true end end function ja(en) local lz=""local jd,fp,lm=false,false for fa=1,#en do local hy=sub(en,fa,fa) if hy=="^"then
if fp then lz=lz..hy end
fp=not fp elseif hy=="~"then if lm then lz=lz..hy end
lm,jd=not lm,not jd else if fp==jd and hy>="a"and hy<="z"then
for jz=1,26 do if hy==sub("abcdefghijklmnopqrstuvwxyz",jz,jz) then
hy=sub("\65\66\67\68\69\70\71\72\73\74\75\76\77\78\79\80\81\82\83\84\85\86\87\88\89\90\91\92",jz,jz) break end end end lz=lz..hy fp,lm=false,false end end return lz end



__gfx__
0000000000000000000000000000000044444444440000004444444477777777f9e9f9f9ddd5ddd5bbbbbbbb5500000010101010000000000000000000000000
00000000000000000000000000000000444444404400000044444444777777779eee9f9fdd5ddd5dbbbbbbbb5555000001010101000000000000000000000000
00800800000000000000000000000000aaaaaa00aaaa000005aaaaaa77777777feeef9f9d5ddd5ddbbbbbbbb5555550010101010000000000000000000000000
0008800055555555ddddddddeeeeeeee999990009999000005999999777777779fef9fef5ddd5dddbbbbbbbb5555555501010101000000000000000000000000
0008800055555555ddddddddeeeeeeee44440000444444000005444477777777f9f9feeeddd5ddd5bbbbbbbb5555555510101010000000000000000000000000
0080080055555555ddddddddeeeeeeee444000004444440000054444777777779f9f9eeedd5ddd5dbbbbbbbb5555555501010101000000000000000000000000
0000000055555555ddddddddeeeeeeeeaa000000aaaaaaaa000005aa77777777f9f9feeed5ddd5ddbbbbbbbb5555555510101010000000000000000000000000
0000000055555555ddddddddeeeeeeee900000009999999900000599777777779f9f9fef5ddd5dddbbbbbbbb5555555501010101000000000000000000000000
0000000077777755666666ddbbbbbbee888888553333333313131344666666665888858866666666cbcbcbcb0000005510101044999999990000000088845888
00000000777755556666ddddbbbbeeee88888855333333333131314466666666588885881c1c1c1cbcbcbcbc0000555501010144444444440000000088845888
000010007755555566ddddddbbeeeeee88887777333333331313aaaa6666666655555555c1c1c1c1cbcbcbcb005555551010aaaa000450000000000088845888
0000c00055555555ddddddddeeeeeeee88886666333333333131999966666666888588881c1c1c1cbcbcbcbc5555555501019999000450000000000088845888
001c7c1055555555ddddddddeeeeeeee8855555533333333134444446666666688858888c1c1c1c1cbcbcbcb5555555510444444000450000000000088845888
0000c00055555555ddddddddeeeeeeee88555555333333333144444466666666555555551c1c1c1cbcbcbcbc5555555501444444000450000000000088845888
0000100055555555ddddddddeeeeeeee7777777733333333aaaaaaaa6666666658888588c1c1c1c1cbcbcbcb55555555aaaaaaaa000450000000000088845888
0000000055555555ddddddddeeeeeeee66666666333333339999999966666666588885887c7c7c7cbcbcbcbc5555555599999999000450000000000088845888
0000000055777777dd666666eebbbbbb558888885555555544444444777777777777777755555555444444454444444444444445000450008888888999999999
0000000055557777dddd6666eeeebbbb5588888855553333444444447777777777777777555555554444445c4444444444444458000450008888889444444444
0000000055555577dddddd66eeeeeebb7777888855333333aaaaaaaa777777777777777755555555444445cbaaaaaa4444444588000450008888894888845888
000c000055555555ddddddddeeeeeeee66668888533333339999999977777777777777775555555544445cbc9999994444445888000450008888948888845888
0000000055555555ddddddddeeeeeeee5555558853333333444444447777775555777777555555554445cbcb4444444444458888000450008889488888845888
0000000055555555ddddddddeeeeeeee555555885533333344444444777755555555777755555555445cbcbc4444444444588888000450008894588888845888
0000000055555555ddddddddeeeeeeee7777777755553333aaaaaaaa77555555555555770000000045cbcbcbaa44444445888888999999998944588888845888
0000000055555555ddddddddeeeeeeee6666666655555555999999995555555555555555000000005cbcbcbc9944444458888888555555559484588888845888
0000000055555555ddddddddbbbbbbbb555555555555555544444444cccccccc5555555677777777c77777776555555533333336633333338884588988845888
0000000055555555ddddddddbbbbbbbb555555553333555544444444cccccccc555555677777777ccc7777777655555533333367763333338884589488845888
0000000055555555ddddddddbbbbbbbb7777777733333355aaaaaa50cccccccc55555677777777ccccc777777765555533333677776333338884594488845888
0000000055555555ddddddddbbbbbbbb666666663333333599999950cccccccc5555677777777ccccccc77777776555533336777777633338884944488845888
0000000055555555ddddddddbbbbbbbb555555553333333544445000cccccccc555677777777ccccccccc7777777655533367777777763338889444488845888
0000000055555555ddddddddbbbbbbbb555555553333335544445000cccccccc55677777777ccccccccccc777777765533677777777776338894444488845888
0b03000055555555ddddddddbbbbbbbb7777777733335555aa500000cccccccc5677777777ccccccccccccc77777776536777777777777638944444499999999
b00030b055555555ddddddddbbbbbbbb666666665555555599500000cccccccc677777777ccccccccccccccc7777777667777777777777769444444455555555
00000000000000000000000000000000777777777777777777555555555555770000000000000000000000000000000000000000d00000004444444444444444
00000000000000000000000000000000700000077000000770700000000007079f00d70000000000000000000000000000000000d50000004ffffff44ffffff4
00000000000000000000000000000000700000077000000770070000000070079f2ed72800000000000000000000000000000000d51000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600079f2ed72800000000000000000000000000000000d51000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600079f2ed72800000000000000000000000000000000d51000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600079f2ed72800000000000000000000000000000000d51000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600079f2ed72800000000000000000000000000000000d51000004f4444944f444494
00000000000000000000000000000000777777777777777777776000000677774444444400000000000000000000000000000000d51000004f4444944f444494
00077000000000000000000000000000700000677600000770066000000660070000000000000000000000000000000000000000d51000004f4444944f444494
0075570000000000000a0000000000007000060770600007706060000006060700cd006500000000000000000000000000000000d51000004f9999944f444494
0750057000000000000000000000000070000507705000077050600000060507b3cd826500000000000000000000000000000000d5100000444444444f449994
7770077700a0a000000aa000000a0a0070000007700000077000600000060007b3cd826500000000000000000000000000000000d5100000444444444f994444
0070070000aaaa0000aaaa0000aaa00070000007700000077005000000005007b3cd826500000000000000000000000000000000d510000049a4444444444444
0070070000a9aa0000a99a0000aa9a0070000007700000077050000000000507b3cd826500000000000000000000000000000000d51000004994444444444444
0077770000a99a0000a99a0000a99a0077777777777777777500000000000077b3cd826500000000000000000000000000000000d51000004444444449a44444
00555500004444000044440000444400555555555555555555555555555555554444444400000000000000000000000000000000d51000004ffffff449944444
00070000777777777777777777777777700000077776000077777777777777779999999900000000000000000000000000000000d51000004f44449444444444
00070000555555555555555555555555700000077776000055555555555555555555555500000000000000000000000000000000d51000004f4444944444fff4
000700001dd6dd6dd6dd6dd6d6dd6d51700000077776000044444444444444444444444400000000000000000000000000000000d51000004f4444944fff4494
777077701dd6dd6dd6dd6dd6d6dd6d517000000766665555444ffffffffff444ffff4fff00000000000000000000000000000000d51000004f4444944f444494
00070000166666666666666666666651700000070000777644494444444494444449494400000000000000000000000000000000d51000004f4444944f444494
000700001d6dd6dd6dd6dd6ddd6dd65170000007000077764449444aa44494444449494400000000000000000000000000000000d51111114f4444944f444494
000700001d6dd6dd6dd6dd6ddd6dd651777777770000777644494444444494444449494400000000000000000000000000000000d55555554ffffff44f444494
00000000166666666666666666666651555555555555666644499999999994444449494400000000000000000000000000000000dddddddd444444444f444494
007777001dd6dd600000000056dd6d516dd6dd6d0000000044494444444494444449494400000000000000000000000000000000000000004f4444944f444494
007557001dd6dd650000000056dd6d51666666660000000044494444444494444449494400000000000000000000000000000000000000004f4444944f444994
00700700166666650000000056666651d6dd6dd60000000044494444444494444449494400000000000000000000000000000000000000004f4444944f499444
777007771d6dd6d5000000005d6dd651d6dd6dd60000000044494444444494444449494400000000000000000000000000000000000000004f4444944f944444
575005751d6dd6d5000000005d6dd651666666660000000044494444444494444449494400000000000000000000000000000000000000004f44449444444400
057007501666666500000000566666516dd6dd6d0000000044494444444494444449494400000000000000000000000000000000000000004f44449444440000
005775001dd6dd650000000056dd6d516dd6dd6d0000000044499999999994449999499900000000000000000000000000000000000000004f44449444000000
000550001dd6dd650000000056dd6d51666666660000000044444444444444444444444400000000000000000000000000000000000000004f44449400000000
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccffffffff
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccf666677f
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000cccccccc7cccccc7
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccaaccccd776666d
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caaaccccf676650f
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccaaaaacf676650f
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccaaaaacf676650f
aaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccff7665ff
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000fff76fffffffffff
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000fff76ffff666677f
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000fbbbbccf75555557
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000bbbcccc8d776666d
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000fccccc8ff676650f
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000000000000000000000fccc888ff676650f
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000fff22fff000000000000000000000000fff00ffff676650f
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ff0020ff000000000000000000000000fff00fffff7665ff
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ff2302ffff2302ff0000000000007aa0fff76fff00000094
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ffb33bffffb33bff00000000000070a0fff76fff00000944
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ff2bb2ffff2bb2ff000000000000aaa0f8888bbf00009440
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ff2222ffff2222ff00000000000a4440888bbbbc00094400
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000ff2bb2ffff2bb2ff0000000000a40000fbbbbbcf00044000
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000f2b33b2ff2b33b2f000000000a400000fbbbcccf00400000
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000f22bb22ff2b33b2f0000000074a90000fff00fff94000000
aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000f222222ff22bb22f00000000007a0000fff00fff44000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000f222222f00000000000000000066060bfff76fffcccccccc
00000000000000000000000000000000000000000000000000000000000000000000000000000000f22bb22f000000000000000000660600fff76fffc000000c
00000000000000000000000000000000000000000000000000000000000000000000000000000000f2b33b2f000000000000000000666600fcccc88fc0c00c0c
0000000000000000000000000000000000000000000000000000000000000000000000000000000022b33b22000000000000000000000000ccc8888bc00cc00c
00000000000000000000000000000000000000000000000000000000000000000000000000000000222bb222000000000000000007777770f88888bfc00cc00c
0000000000000000000000000000000000000000000000000000000000000000000000000000000022222222000000000000000007777770f888bbbfc0c00c0c
0000000000000000000000000000000000000000000000000000000000000000000000000000000022222222000000000000000007777770fff00fffc000000c
00000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbb000000000000000008888880fff00fffcccccccc
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000000000
00000000b444449bb444449bb444449bb494449bb494449bb494449bb999449bb999449bb999449b000000000000000000000000000000000000000000000000
00000000444044494440444944404449494444494944444949444449944444499444444994444449000000000000000000000000000000000000000000000000
00000000404000044040000440400004494400044944000449440004944444449444444494444444000000000000000000000000000000000000000000000000
0000000004ffff0004ffff0004ffff000440fffb0440fffb0440fffb444444444444444444444444000000000000000000000000000000000000000000000000
000000000f9ff9f00f9ff9f00f9ff9f004f0f9fb04f0f9fb04f0f9fb444444444444444444444444000000000000000000000000000000000000000000000000
000000000f5ff5f00f5ff5f00f5ff5f000fff5fb00fff5fb00fff5fb4444444044444440444444400f5ff5f000fff5fb44444440000000000000000000000000
000000004ffffff44ffffff44ffffff440ffffff40ffffff40ffffff0444444404444444044444444ffffff440ffffff04444444000000000000000000000000
00000000bff44ffbbff44ffbbff44ffbb0fffff4b0fffff4b0fffff4b044444bb044444bb044444bbff44ffbb0fffff4b044444b000000000000000000000000
00000000b6ffff6bb6ffff6bb6ffff6bb6fffffbb6fffffbb6fffffbb044444bb044444bb044444bb6ffff6bb6fffffbb044444b000000000000000000000000
00000000bbfddfbbbbfddfbbbbfddfbbbb6fffdbbb6fffdbbb6fffdbbb0000bbbb0000bbbb0000bbbbf00fbbbb6ff00bbb0000bb000000000000000000000000
00000000bbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbf00fbbbbbff00bbbbffbbb000000000000000000000000
00000000bdc55cdbbdc55cdbbdc55cdbbbddcbbbbbbddbbbbbddcbbbbddddddbbddddddbbddddddbbbbffbbbbbbbbffbbddddddb000000000000000000000000
00000000dcc55ccddcc55ccddcc55ccdb1ccdcbbbb1ccdbbb1ccdcbbdccccccddccccccddccccccdbbbbbbbbbbbbbbbbdccccccd000000000000000000000000
00000000c1c66c1cc1c66c1dd1c66c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1cc1cccc1dd1cccc1c000000000000000000000000000000000000000000000000
00000000c1c55c1cc1c55c1dd1c55c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1cc1cccc1dd1cccc1c000000000000000000000000000000000000000000000000
00000000c1c55c1ccc155c1dd1c551ccb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1ccc1ccc1dd1ccc1cc000000000000000000000000000000000000000000000000
00000000c1c55c1ccc155c1dd1c551ccb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1ccc1ccc1dd1ccc1cc000000000000000000000000000000000000000000000000
00000000d1cddc1dbc1ddcdbbdcdd1cbb1dddcbbbb1dddbbb1dddcbbd1cccc1dbc1cccdbbdccc1cb000000000000000000000000000000000000000000000000
00000000fe1111efbfe1112bb2111efbbbff11bbbb2ff1bbbbff11bbfe1111efbfe1112bb2111efb000000000000000000000000000000000000000000000000
00000000bf1111fbbff111ebbe111ffbbbfe11bbbb2fe1bbbbfe11bbbf1111fbbff111ebbe111ffb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbbb2111bbbb2111bbbb2111bbbb1211bbbb1211bbbb1211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbbb1111bbbb2111bbbb2111bbbb1211bbbb1211bbbb1211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbbb1111bbbb2111bbbb2111bbbb1211bbbb1211bbbb1211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbbb1112bbbb2111bbbb21111bbb1211bbbb1211bbbb1211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbbb1112bbbb2111bbbb22111bbb1211bbbb1211bbbb1211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbb111122bbb2111bbb222111bbb1211bbbb121cbbbbc211bb000000000000000000000000000000000000000000000000
00000000bb1121bbbb1121bbbb1121bbc111222bbb2111bbb22211ccbb1211bbbb12cc7bb7cc11bb000000000000000000000000000000000000000000000000
00000000bbccccbbbb77c77bb77c77bb7ccc222bbbccccbbb222cc77bbccccbbbbcc677bb776ccbb000000000000000000000000000000000000000000000000
00000000b776677bbbbb677bb776bbbbb7776666bb6777bbb66677bbb776677bbb77bbbbbbbb77bb000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777777777777777777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777777777777777777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777774444444477777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777774ffffff477777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777774f44449477777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777774f44449477777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777774f44449477777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777774f44449477777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777774f44449477777777cbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcb
777777774f44449477777777bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc
777777774f4444947777777799999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
777777774f4444947777777722222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
777777774f4499947777777744444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
777777774f99444477777777fff444449fff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fffffff4fff
77777777444444447777777744444044494949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
77777777444444447777777744404000044949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
7777777749a44444777777774404ffff004949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774994444477777777440f9ff9f04949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774444444477777777440f5ff5f04949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774444fff477777777444ffffff44949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774fff449477777777444ff44ff44949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774f444494777777774446ffff644949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774f444494777777774449fddf444949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774f4444947777777744494ff4444949444449494444494944444949444449494444494944444949444449494444494944444949444449494444494944
777777774f44449477777777999dc55cd99949999999499999994999999949999999499999994999999949999999499999994999999949999999499999994999
777777774f4444947777777744dcc55ccd4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
777777774f4444947777772222c1c66c1c2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
777777774f4449947777222222c1c55c1c22222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
777777774f4994447722222222c1c55c1c22222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
777777774f9444442222222222c1c55c1c22222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
77777777444444222222222222d1cddc1d22222222222222222222ccc2ccc2222222222222222222222222222222222222222222222222222222222222222222
77777777444422222222222222fe1111ef22222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
777777774422222222222222222f1111f222222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
777777772222222222222222222211212222222222222222222222222c2222222222222222222222222222222222222222222222222222222222222222222222
77777722222222222222222222221121222222222222222222222222222222223333333333333333333333333333333333333333333333333333333322222222
77772222222222222222222222221121222222222222222222222222222233333333333333333333333333333333333333333333333333333333333333332222
77222222222222222222222222221121222222222222276222222222223333333333333333333333333333333333333333333333333333333333333333333322
22222222222222222222222222221121222222222222276222222222233333333333333333333333333333333333333333333333333333333333333333333332
2222222222222222222222222222112122222222222bbbb772222222233333333333333333333333333333333333333333333333333333333333333333333332
222222222222222222222222222211212222222222bbb77778222222223333333333333333333333333333333333333333333333333333333333333333333322
2222222222222222222222222222cccc222222222227777782222222222233333333333333333333333333333333333333333333333333333333333333332222
22222222222222222222222222277667722222222227778882222222222222223333333333333333333333333333333333333333333333333333333322222222
22222222222222222222222222222222222222222222200222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222200222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000c0c0ccc0c000c0c00000ccc00cc0000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000c0c0c0c0c000cc0000000c00c0c0000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000ccc0ccc0c000c0c000000c00c0c0000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000ccc0c0c0ccc0c0c000000c00cc00000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cc0ccc0ccc0cc0000000000ccc0ccc00cc0c0c00000c0c0ccc00000ccc0c0c00cc0c0c000000000000001111111111011111111110111111111101111111111
c1c0c1c0c110c1c000000000c1c01c10c110c0c00000c0c0c1c00000c1c0c0c0c110c0c0000000cc000001111111111011111111110111111111101111111111
c0c0ccc0cc00c0c000000000ccc00c00c000cc10ccc0c0c0ccc00000ccc0c0c0ccc0ccc000000c11c00001111111111011111111110111111111101111111111
c0c0c110c100c0c000000000c1100c00c000c1c01110c0c0c1100000c110c0c011c0c1c00000c1001c0001111111111011111111110111111111101111111111
cc10c000ccc0c0c000000000c000ccc01cc0c0c000001cc0c0000000c0001cc0cc10c0c0000ccc00ccc001111111111011111111110111111111101111111111
11001000111010100000000010001110011010100000011010000000100001101100101000000c00c00001111111111011111111110111111111101111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000c00c00001111111111011111111110111111111101111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000cccc00001111111111011111111110111111111101111111111
0cc0c0000cc00cc0ccc00000c0000cc00cc0c0c00000ccc0ccc00000ccc0c0c0c000c00000000111100001111111111011111111110111111111101111111111
c110c000c1c0c110c1100000c000c1c0c1c0c0c00000c1c01c100000c1c0c0c0c000c00000000000000001111111111011111111110111111111101111111111
c000c000c0c0ccc0cc000000c000c0c0c0c0cc10ccc0ccc00c000000ccc0c0c0c000c00000000000000000000000000000000000000000000000000000000000
c000c000c0c011c0c1000000c000c0c0c0c0c1c01110c1c00c000000c110c0c0c000c00000000000000000000000000000000000000000000000000000000000
1cc0ccc0cc10cc10ccc00000ccc0cc10cc10c0c00000c0c00c000000c0001cc0ccc0ccc000000000000001111111111011111111110111111111101111111111
01101110110011001110000011101100110010100000101001000000100001101110111000000cccc00001111111111011111111110111111111101111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000c11c00001111111111011111111110111111111101111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000c00c00001111111111011111111110111111111101111111111
0cc0ccc0c0c0ccc000000000ccc0ccc0c000c0c00000ccc00cc00000c0c00cc0ccc00000000ccc00ccc001111111111011111111110111111111101111111111
c1101c10c0c0c110000000001c10c1c0c000c0c000001c10c1c00000c0c0c110c11000000001c1001c1001111111111011111111110111111111101111111111
c0000c00c0c0cc00000000000c00ccc0c000cc10ccc00c00c0c00000c0c0ccc0cc00000000001c00c10001111111111011111111110111111111101111111111
c0c00c00ccc0c100000000000c00c1c0c000c1c011100c00c0c00000c0c011c0c1000000000001cc100001111111111011111111110111111111101111111111
ccc0ccc01c10ccc0000000000c00c0c0ccc0c0c000000c00cc1000001cc0cc10ccc0000000000011000001111111111011111111110111111111101111111111
11101110010011100000000001001010111010100000010011000000011011001110000000000000000001111111111011111111110111111111101111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0001010101010100000000010000000000010101010101000000000101000000000101010101010101010101000000000001010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717
0707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0701113131313131313131313121010717021232323232323232323232220217070111313131313131313131312101071702123232323232323232323222021707011131313131313131313131210107170212323232323232323232322202170701113131313131313131313121010717021232323232323232323232220217
1131313131313131313131313131312112323232323232323232323232323222113131313131313131313131313131211232323232323232323232323232322211313131313131313131313131313121123232323232323232323232323232221131313131313131313131313131312112323232323232323232323232323222
3131313131313131313131313131313132323232323232323232323232323232313131313131313131313131313131313232323232323232323232323232323231313131313131313131313131313131323232323232323232323232323232323131313131313131313131313131313132323232323232323232323232323232
1717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707
1717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707
1700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1702123232323232323232323222021707011131313131313131313131210107170212323232323232323232322202170701113131313131313131313121010717021232323232323232323232220217070111313131313131313131312101071702123232323232323232323222021707011131313131313131313131210107
1232323232323232323232323232322211313131313131313131313131313121123232323232323232323232323232221131313131313131313131313131312112323232323232323232323232323222113131313131313131313131313131211232323232323232323232323232322211313131313131313131313131313121
3232323232323232323232323232323231313131313131313131313131313131323232323232323232323232323232323131313131313131313131313131313132323232323232323232323232323232313131313131313131313131313131313232323232323232323232323232323231313131313131313131313131313131
0707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717
0707071717171717171717171707070717171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707171717080808080808080808081717170707071717171717171717171707070717171708080808080808080808171717
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0700071717171717171717171707000717001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007170017080808080808080808081700170700071717171717171717171707000717001708080808080808080808170017
0701113131313131313131313121010717021232323232323232323232220217070111313131313131313131312101071702123232323232323232323222021707011131313131313131313131210107170212323232323232323232322202170701113131313131313131313121010717021232323232323232323232220217
1131313131313131313131313131312112323232323232323232323232323222113131313131313131313131313131211232323232323232323232323232322211313131313131313131313131313121123232323232323232323232323232221131313131313131313131313131312112323232323232323232323232323222
3131313131313131313131313131313132323232323232323232323232323232313131313131313131313131313131313232323232323232323232323232323231313131313131313131313131313131323232323232323232323232323232323131313131313131313131313131313132323232323232323232323232323232
17171708080808080808080808171717070707171717171717171717170707070707071a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a070707000000000000000017171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707
17171708080808080808080808171717070707171717171717171717170707070707071a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a070707000000000000000017171708080808080808080808171717070707171717171717171717170707071717170808080808080808080817171707070717171717171717171717070707
17001708080808080808080808170017070007171717171717171717170700070700071a1a1a1a1a1a1a1a1a1a1a1a1a4e001a1a1a070007000000000000000017001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1700170808080808080808080817001707000717171717171717171717070007070007686868686868686868686868685e00686868070007000000000000000017001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1700170808080808080808080817001707000717171717171717171717070007070007787878787878787878787878786e00787878070007000000000000000017001708080808080808080808170017070007171717171717171717170700071700170808080808080808080817001707000717171717171717171717070007
1702123232323232323232323222021707011131313131313131313131210107070111313131313131313131313131313131313131210107000000000000000017021232323232323232323232220217070111313131313131313131312101071702123232323232323232323222021707011131313131313131313131210107
1232323232323232323232323232322211313131313131313131313131313121113131313131312515151515151515353131313131313121000000000000000012323232323232323232323232323222113131313131313131313131313131211232323232323232323232323232322211313131313131313131313131313121
3232323232323232323232323232323231313131313131313131313131313131313131313131313131313131313131313131313131313131000000000000000032323232323232323232323232323232313131313131313131313131313131313232323232323232323232323232323231313131313131313131313131313131
