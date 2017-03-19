pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
a=true b=false c=false d=true e=true f=printh g={{{h="open"},i="open"},{{j="close"},i="close"},{{k="give"},i="give"},{{l="pickup"},i="pick-up"},{{m="lookat"},i="look-at"},{{n="talkto"},i="talk-to"},{{o="push"},i="push"},{{p="pull"},i="pull"},{{q="use"},i="use"}} r={{s="walkto"},i="walk to"} t=12 u=7 v=1 w=10 x={y=1,z=1,ba=1,h=2,bb=2,bc=2} bd=1 be=2 bf=4 bg=8 bh=16 bi=32 bj=1 bk=2 bl=1 bm=2 bn=3 bo=4 bp=1 bq=3 br=2 bs=4 bt=5 bu=1 bv=2 bw={bx={by=0,bz=0,ca={{7,15},},cb=function(cc) cd(cc.ce.cf,true) end,cg=function(cc) ch(cc.ce.cf) end,ci=0,ce={cf=function() while true do for cj=1,3 do ck("fire",cj) cl(8) end end end,cm=function() while true do for cj=1,3 do ck("spinning top",cj) cl(8) end end end},cn={co={cp="fire",cq=1,cr=8*8,cs=4*8,x={145,146,147},ct=1,cu=1,cv=bn,cw=bp,cx="front door",cy=x.y,g={m=function() cz("it's a nice, warm fire...") da() cl(10) db(dc,bv,bl) cz("ouch! it's hot!;*stupid fire*") da() end,n=function() cz("'hi fire...'") da() cl(10) db(dc,bv,bl) cz("the fire didn't say hello back;burn!!") da() end,l=function(cc) dd(cc) end,}},de={cp="front door",df=bh,cq=x.y,cr=1*8,cs=2*8,dg=-10,x={143,0},ct=1,cu=4,cw=bs,cv=bm,g={s=function(cc) if dh(cc)==x.h then
di(bw.dj.cn.de) else cz("the door is closed") end end,h=function(cc) dk(cc,bw.dj.cn.de) end,j=function(cc) dl(cc,bw.dj.cn.de) end}},dm={cp="kitchen",cq=x.h,cr=14*8,cs=2*8,ct=1,cu=4,cw=br,cv=bo,g={s=function() di(bw.dn.cn.dp) end}},dq={cp="bucket",df=be,cq=x.h,cr=13*8,cs=6*8,ct=1,cu=1,x={207,223},dr=15,g={m=function(cc) if ds(cc)==dc then
cz("it is a bucket in my pocket") else cz("it is a bucket") end end,l=function(cc) dd(cc) end,k=function(cc,dt) if dt==du.dv then
cz("Can you fill this up for me?") da() cz(du.dv,"Sure") da() cc.dw=du.dv cl(10) cz(du.dv,"Here ya go...") da() cc.cq=x.y dd(cc) else cz("I might need this") end end}},dx={cp="spinning top",cq=1,cr=2*8,cs=6*8,x={192,193,194},ca={{12,7}},dr=15,ct=1,cu=1,g={o=function(cc) if dy(dz.ce.cm) then
ch(dz.ce.cm) ck(cc,1) else cd(dz.ce.cm) end end,p=function(cc) ch(dz.ce.cm) ck(cc,1) end}},ea={cp="window",df=bh,cq=x.y,cv=bn,cw={cr=5*8,cs=(7*8)+1},cr=4*8,cs=1*8,ct=2,cu=2,x={132,134},g={h=function(cc) if not cc.eb then
ec(bj+bk,function() cc.eb=true ed("*creak*",40,20,8,1) da() ee(bw.dn) dc=du.dv ef(dc,dc.cr+10,dc.cs) cz("what was that?!") da() cz("i'd better check...") da() ef(dc,dc.cr-10,dc.cs) ee(bw.bx) cl(50) dc.cr=115 dc.cs=44 dc.eg=bw.bx ef(dc,dc.cr-10,dc.cs) cz("intruder!!!") da() end,function() ee(bw.bx) du.dv.eg=bw.bx du.dv.cr=105 du.dv.cs=44 eh() end) end end}}}},dn={by=16,bz=0,ei=39,ej=7,cb=function() end,cg=function() end,ce={},cn={dp={cp="hall",cq=x.h,cr=1*8,cs=2*8,ct=1,cu=4,cw=bs,cv=bm,g={s=function() di(bw.bx.cn.dm) end}},ek={cp="back door",df=bh,cq=x.y,cr=22*8,cs=2*8,dg=-10,x={143,0},el=true,ct=1,cu=4,cw=br,cv=bo,g={s=function(cc) if dh(cc)==x.h then
di(bw.bx.cn.de) else cz("the door is closed") end end,h=function(cc) dk(cc,bw.bx.cn.de) end,j=function(cc) dl(cc,bw.bx.cn.de) end}},},},dj={by=16,bz=8,ei=47,ej=15,cb=function(cc) end,cg=function(cc) end,ce={},cn={em={df=bd,cr=10*8,cs=3*8,cq=1,x={111},ct=1,cu=2,en=8},eo={df=bd,cr=22*8,cs=3*8,cq=1,x={111},ct=1,cu=2,en=8},de={cp="front door",df=bh,cq=x.y,cr=19*8,cs=1*8,x={142,0},el=true,ct=1,cu=3,cw=bp,cv=bn,g={s=function(cc) if dh(cc)==x.h then
di(bw.bx.cn.de) else cz("the door is closed") end end,h=function(cc) dk(cc,bw.bx.cn.de) end,j=function(cc) dl(cc,bw.bx.cn.de) end}},},}} ep=bw.dj du={eq={df=bi,cr=127/2+80,cs=127/2-24,ct=1,cu=4,er=bl,es={1,3,5,3},et={6,22,21,22},eu={2,3,4,3},ev=12,dr=11,ew=0.6,},dv={cp="purple tentacle",df=bf+bi,cr=127/2-24,cs=127/2-16,ct=1,cu=3,er=bl,es={30,30,30,30},et={47,47,47,47},ev=13,dr=15,ew=0.25,cw=br,eg=bw.dn,g={m=function() cz("it's a weird looking tentacle, thing!") end,n=function(cc) ec(bj,function() cz(cc,"what do you want?") da() end) while(true) do ex("where am i?") ex("who are you?") ex("how much wood would a wood-chuck chuck, if a wood-chuck could chuck wood?") ex("nevermind") ey(dc.ev,7) while not ez.fa do cl() end fb=ez.fa fc() ec(bj,function() cz(fb.fd) da() if fb.fe==1 then
cz(cc,"you are in paul's game") da() elseif fb.fe==2 then cz(cc,"it's complicated...") da() elseif fb.fe==3 then cz(cc,"a wood-chuck would chuck no amount of wood, coz a wood-chuck can't chuck wood!") da() elseif fb.fe==4 then cz(cc,"ok bye!") da() ff() return end end) fg() end end}}} dc=du.eq function fh(fi) local fj=nil if fk(fi.df,bf) then
fj="talkto"elseif fk(fi.df,bh) then if fi.cq==x.y then
fj="open"else fj="close"end else fj="lookat"end for fl in all(g) do fm=fn(fl) if(fm[2]==fj) then fj=fl break end
end return fj end function fo(fp,fq,fr) f("verb:"..fp.." , obj:"..fq.cp) if fp=="walkto"then
return elseif fp=="pickup"then if fk(fq.df,bi) then
cz("i don't need them") else cz("i don't need that") end elseif fp=="use"then if fk(fq.df,bi) then
cz("i can't just *use* someone") end if fr then
if fk(fr.df,bi) then
cz("i can't use that on someone!") else cz("that doesn't work") end end elseif fp=="give"then if fk(fq.df,bi) then
cz("i don't think i should be giving this away") else cz("i can't do that") end elseif fp=="lookat"then if fk(fq.df,bi) then
cz("i think it's alive") else cz("looks pretty ordinary") end elseif fp=="open"then if fk(fq.df,bi) then
cz("they don't seem to open") else cz("it doesn't seem to open") end elseif fp=="close"then if fk(fq.df,bi) then
cz(fs"they don't seem to close") else cz("it doesn't seem to close") end elseif fp=="push"or fp=="pull"then if fk(fq.df,bi) then
cz("moving them would accomplish nothing") else cz("it won't budge!") end elseif fp=="talkto"then if fk(fq.df,bi) then
cz("erm... i don't think they want to talk") else cz("i am not talking to that!") end else cz("hmm. no.") end end ft=127 fu=127 fv=16 fw=(dc.cu-1)*8 fx=0 fy=0 fz=0 ga=0 gb=dc gc=ft/2 gd=fu/2 ge=1 gf=0 gg={7,12,13,13,12,7} gh=1 gi={{spr=16,cr=75,cs=fv+60},{spr=48,cr=75,cs=fv+72}} gj=0 gk=0 gl=false dz=nil gm=nil gn=nil go=nil gp=""gq=false gr=nil ez=nil gs=nil gt=nil gu={} gv={} gw={} gx={} function _init() if(e) then poke(0x5f2d,1) end
dc.eg=ep gy() ee(ep) end function _update60() gz() end function _draw() ha() end function gz() if dc.hb and not coresume(dc.hb) then
dc.hb=nil end hc(gu) if gs then
if gs.hb and not coresume(gs.hb) then
if(dz!=gs.hd) then ee(gs.hd) end
dc=gs.he ga=gs.hf gb=gs.hg del(gw,gs) gs=nil if(#gw>0) then
gs=gw[#gw] end end else hc(gv) end hh() hi() end function ha() rectfill(0,0,ft,fu,0) if ga==0 then
fx=mid(0,dc.cr-64,(dz.hj*8)-ft-1) end camera(fx,0) clip(0,fv,ft+1,64) hk() camera(0,0) clip() if(d) then
print("cpu: "..flr(100*stat(1)).."%",0,fv-16,8) print("mem: "..flr(stat(0)/1024*100).."%",0,fv-8,8) end if(a) then print("x: "..gc.." y:"..gd-fv,80,fv-8,8) end
hl() if ez and ez.hm then
hn() ho() return end if(hp==gs) then
else hp=gs return end if not gs then
hq() end if(not gs
or not fk(gs.hr,bj)) and(hp==gs) then hs() else end hp=gs if not gs
then ho() end end function hh() if gs then
if((btnp(4) and btnp(5)) or(e and stat(34)==2))
and gs.ht then gs.hb=cocreate(gs.ht) gs.ht=nil if(e) then gl=true end
return end return end if(btn(0)) then gc=gc-1 end
if(btn(1)) then gc=gc+1 end
if(btn(2)) then gd=gc-1 end
if(btn(3)) then gd=gc+1 end
if(btnp(4)) then hu(1) end
if(btnp(5)) then hu(2) end
if(e) then
if(stat(32)-1!=gj) then gc=stat(32)-1 end
if(stat(33)-1!=gk) then gd=stat(33)-1 end
if(stat(34)>0) then
if(not gl) then
hu(stat(34)) gl=true end else gl=false end gj=stat(32)-1 gk=stat(33)-1 end gc=max(gc,0) gc=min(gc,127) gd=max(gd,0) gd=min(gd,127) end function hu(hv) local hw=gm if ez and ez.hm then
if hx then
ez.fa=hx end return end if hy then
gm=fn(hy) f("verb = "..gm[2]) elseif hz then if hv==1 then
if(gm[2]=="use"or gm[2]=="give")
and gn then go=hz f("noun2_curr = "..go.cp) else gn=hz f("noun1_curr = "..gn.cp) end elseif ia then gm=fn(ia) gn=hz ib(gn) hq() end elseif ic then if ic==gi[1] then
if dc.id>0 then
dc.id-=1 end else if dc.id+2<flr(#dc.ie/4) then
dc.id+=1 end end return else end if(gn!=nil) then
if gm[2]=="use"or gm[2]=="give"then
if go then
else return end end gq=true dc.hb=cocreate(function(ig,fi,fp,dt) if not fi.dw then
f("obj x="..fi.cr..",y="..fi.cs) f("obj w="..fi.ct..",h="..fi.cu) ih=ii(fi) f("dest_pos x="..ih.cr..",y="..ih.cs) if(fi.ij) then f("offset x="..fi.ij..",y="..fi.ik) end
ef(dc,ih.cr,ih.cs) f(".moving="..dc.il) if dc.il!=2 then return end
cv=dc.er if(fi.cv and(fp!=r)) then cv=fi.cv end
db(dc,bv,cv) end if im(fp,fi) then
f("verb_obj_script!") f("verb = "..fp[2]) f("obj = "..fi.cp) cd(fi.g[fp[1]],false,fi,dt) else fo(fp[2],fi,dt) end io() end) coresume(dc.hb,dc,gn,gm,go) elseif(gd>fv and gd<fv+64) then gq=true dc.hb=cocreate(function(cr,cs) ef(dc,cr,cs) io() end) coresume(dc.hb,gc,gd-fv) end f("--------------------------------") end function hi() hy=nil ia=nil hz=nil hx=nil ic=nil if ez and ez.hm then
for fs in all(ez.ip) do if iq(fs) then
hx=fs end end return end ir() for is,fi in pairs(dz.cn) do if(not fi.df
or(fi.df and fi.df!=bd)) and(not fi.cx or it(fi.cx).cq==fi.cy) then iu(fi,fi.ct*8,fi.cu*8,fx,iv) else fi.iw=nil end if iq(fi) then
hz=fi end ix(fi) end for is,ig in pairs(du) do if(ig.eg==dz) then
iu(ig,ig.ct*8,ig.cu*8,fx,iv) ix(ig) if iq(ig)
and ig!=dc then hz=ig end end end for fl in all(g) do if iq(fl) then
hy=fl end end for iy in all(gi) do if iq(iy) then
ic=iy end end for is,fi in pairs(dc.ie) do if iq(fi) then
hz=fi if gm[2]=="pickup"and hz.dw then
gm=nil end end if fi.dw!=dc then
del(dc.ie,fi) end end if(gm==nil) then
gm=fn(r) end if hz then
ia=fh(hz) end end function ir() gx={} for cr=1,64 do gx[cr]={} end end function ix(fi) iz=-1 if fi.ik then
iz=fi.cs else iz=fi.cs+(fi.cu*8) end ja=flr(iz-fv) if fi.dg then ja+=fi.dg end
add(gx[ja],fi) end function hk() for jb in all(dz.ca) do pal(jb[1],jb[2]) end map(dz.by,dz.bz,0,fv,dz.hj,dz.jc) pal() if c then
jd=je(dc) jf=flr((gc+fx)/8)+dz.by jg=flr((gd-fv)/8)+dz.bz jh={jf,jg} ji=jj(jd,jh) jk=je({cr=(gc+fx),cs=(gd-fv)}) if jl(jk[1],jk[2]) then
add(ji,jk) end for jm in all(ji) do rect((jm[1]-dz.by)*8,fv+(jm[2]-dz.bz)*8,(jm[1]-dz.by)*8+7,fv+(jm[2]-dz.bz)*8+7,11) end end for jn=1,64 do ja=gx[jn] for fi in all(ja) do if not fk(fi.df,bi) then
if(fi.x)
and fi.x[fi.cq] and(fi.x[fi.cq]>0) and(not fi.cx or it(fi.cx).cq==fi.cy) and not fi.dw then jo(fi) end else if(fi.eg==dz) then
jp(fi) end end jq(fi) end end end function jp(ig) if(ig.il==1)
and ig.eu then ig.jr=ig.jr+1 if(ig.jr>5) then
ig.jr=1 ig.js=ig.js+1 if(ig.js>#ig.eu) then ig.js=1 end
end jt=ig.eu[ig.js] else jt=ig.es[ig.er] end for jb in all(ig.ca) do pal(jb[1],jb[2]) end ju(jt,ig.ij,ig.ik,ig.ct,ig.cu,ig.dr,ig.flip,false) if(gt
and gt==ig) then if(ig.jv<7) then
jt=ig.et[ig.er] ju(jt,ig.ij,ig.ik+8,1,1,ig.dr,ig.flip,false) end ig.jv=ig.jv+1 if(ig.jv>14) then ig.jv=1 end
end pal() end function hq() jw=""jx=12 if not gq then
if gm then
jw=gm[3] end if gn then
jw=jw.." "..gn.cp end if gm[2]=="use"
and gn then jw=jw.." with"end if gm[2]=="give"
and gn then jw=jw.." to"end if go then
jw=jw.." "..go.cp elseif hz and hz.cp!=""and(not gn or(gn!=hz)) then jw=jw.." "..hz.cp end gp=jw else jw=gp jx=7 end print(jy(jw),jz(jw),fv+66,jx) end function hl() if gr then
ka=0 for kb in all(gr.kc) do kd=0 if gr.ke==1 then
kd=((gr.kf*4)-(#kb*4))/2 end kg(kb,gr.cr+kd,gr.cs+ka,gr.ev) ka+=6 end gr.kh=gr.kh-1 if(gr.kh<=0) then
eh() end end end function hs() ki=0 iz=75 kj=0 for fl in all(g) do kk=t if ia
and(fl==ia) then kk=w end if(fl==hy) then kk=u end
fm=fn(fl) print(fm[3],ki,iz+fv+1,v) print(fm[3],ki,iz+fv,kk) fl.cr=ki fl.cs=iz iu(fl,#fm[3]*4,5,0,0) jq(fl) if(#fm[3]>kj) then kj=#fm[3] end
iz=iz+8 if iz>=95 then
iz=75 ki=ki+(kj+1.0)*4 kj=0 end end ki=86 iz=76 kl=dc.id*4 km=min(kl+8,#dc.ie) for kn=1,8 do rectfill(ki-1,fv+iz-1,ki+8,fv+iz+8,1) fi=dc.ie[kl+kn] if fi then
fi.cr=ki fi.cs=iz jo(fi) iu(fi,fi.ct*8,fi.cu*8,0,0) jq(fi) end ki=ki+11 if ki>=125 then
iz=iz+12 ki=86 end kn=kn+1 end for ko=1,2 do kp=gi[ko] if ic==kp then pal(t,7) end
ju(kp.spr,kp.cr,kp.cs,1,1,0) iu(kp,8,7,0,0) jq(kp) pal() end end function hn() ki=0 iz=70 for fs in all(ez.ip) do fs.cr=ki fs.cs=iz iu(fs,fs.kf*4,#fs.kq*5,0,0) kk=ez.ev if(fs==hx) then kk=ez.kr end
for kb in all(fs.kq) do print(jy(kb),ki,iz+fv,kk) iz=iz+5 end jq(fs) iz=iz+2 end end function ho() ev=gg[gh] pal(7,ev) spr(32,gc-4,gd-3,1,1,0) pal() gf=gf+1 if(gf>7) then
gf=1 gh=gh+1 if(gh>#gg) then gh=1 end
end end function ju(ks,cr,cs,ct,cu,kt,el,ku) palt(0,false) palt(kt,true) spr(ks,cr,fv+cs,ct,cu,el,ku) palt(kt,false) palt(0,true) end function ec(hr,kv,kw) ge=ge-1 kx={hr=hr,hb=cocreate(kv),ht=kw,hd=dz,he=dc,hf=ga,hg=gb} add(gw,kx) gs=kx ga=1 fx=0 cl() end function ex(fd) if not ez then ez={ip={},hm=false} end
kq=ky(fd,32) kz=la(kq) fb={fe=#ez.ip+1,fd=fd,kq=kq,kf=kz} add(ez.ip,fb) end function ey(ev,kr) ez.ev=ev ez.kr=kr ez.hm=true ez.fa=nil end function fc() ez.hm=false end function fg() ez.ip={} ez.fa=nil end function ff() ez=nil end function ii(fi) lb={} if type(fi.cw)=="table"then
lb.cr=fi.cw.cr-fx lb.cs=fi.cw.cs-fv elseif not fi.cw or(fi.cw==bp) then lb.cr=fi.cr+((fi.ct*8)/2)-fx-4 lb.cs=fi.cs+(fi.cu*8)+2 elseif(fi.cw==br) then if fi.ij then
lb.cr=fi.cr-fx-(fi.ct*8+4) lb.cs=fi.cs+1 else lb.cr=fi.cr-fx lb.cs=fi.cs+((fi.cu*8)-2) end elseif(fi.cw==bs) then lb.cr=fi.cr+(fi.ct*8)-fx lb.cs=fi.cs+((fi.cu*8)-2) end return lb end function db(ig,lc,ld) ig.flip=(ld==bm) if lc==bu then
f(" > anim_face") ig.er=ld elseif lc==bv then f(" > anim_turn") while(ig.er!=ld) do if(ig.er<ld) then
ig.er=ig.er+1 else ig.er=ig.er-1 end cl(10) end end end function dk(le,lf) if dh(le)==x.h then
cz("it's already open") else ck(le,x.h) if lf then ck(lf,x.h) end
end end function dl(le,lf) if dh(le)==x.y then
cz("it's already closed") else ck(le,x.y) if lf then ck(lf,x.y) end
end end function di(lg) lh=lg.eg ee(lh) lb=ii(lg) f("pos x:"..lb.cr..", y:"..lb.cs) dc.cr=lb.cr dc.cs=lb.cs if lg.cv then
li=lg.cv+2 if(li>4) then
li-=4 end else li=1 end db(dc,bu,li) dc.eg=lh end function ee(lh) f("change_room()...") if dz and dz.cg then
dz.cg(dz) end gv={} io() dz=lh if dz.ei then
dz.hj=dz.ei-dz.by+1 dz.jc=dz.ej-dz.bz+1 else dz.hj=16 dz.jc=8 end fx=0 if dz.cb then
f("t2: "..type(dz)) f("scr2:"..type(dz.ce.cf)) dz.cb(dz) end end function im(fp,lj) if not lj then return false end
if not lj.g then return false end
if type(fp)=="table"then
if lj.g[fp[1]] then return true end
else if(lj.g[fp]) then return true end
end return false end function dd(lk) fi=it(lk) if fi
then f("adding to inv") add(dc.ie,fi) fi.dw=dc del(fi.eg.cn,fi) end end function ds(lk) fi=it(lk) if fi then
return fi.dw end end function dh(lk,cq) fi=it(lk) if fi then
return fi.cq end end function ck(lk,cq) fi=it(lk) if fi then
fi.cq=cq end end function it(cp) if(type(cp)=="table") then return cp end
for is,fi in pairs(dz.cn) do if(fi.cp==cp) then return fi end
end end function cd(ll,lm,ln,dt) local hb=cocreate(ll) if lm then
add(gu,{ll,hb,ln,dt}) else add(gv,{ll,hb,ln,dt}) end end function dy(ll) f("script_running()") for is,lo in pairs(gv) do f("...") if(lo[1]==ll) then
f("found!") return true end end for is,lo in pairs(gu) do f("...") if(lo[1]==ll) then
f("found!") return true end end return false end function ch(ll) f("stop_script()") for is,lo in pairs(gv) do f("...") if(lo[1]==ll) then
f("found!") del(gv,lo) f("deleted!") lo=nil end end for is,lo in pairs(gu) do f("...") if(lo[1]==ll) then
f("found!") del(gu,lo) f("deleted!") lo=nil end end end function cl(lp) lp=lp or 1 for cr=1,lp do yield() end end function da() while gr!=nil do yield() end end function cz(ig,fd) if type(ig)=="string"then
fd=ig ig=dc end iz=ig.cs-fw gt=ig f("talking actor set") ed(fd,ig.cr,iz,ig.ev,1) end function eh() gr=nil gt=nil f("talking actor cleared") end function ed(fd,cr,cs,ev,ke) f("print_line") local ev=ev or 7 local ke=ke or 0 f(fd) local kq={} local lq=""local lr=""kz=0 lt=min(cr,ft-cr) lu=max(flr(lt/2),16) lr=""for ko=1,#fd do lq=sub(fd,ko,ko) if lq==";"then
f("msg break!") lr=sub(fd,ko+1) f("msg_left:"..lr) fd=sub(fd,1,ko-1) break end end kq=ky(fd,lu,true) kz=la(kq) if ke==1 then
ki=cr-((kz*4)/2) end ki=max(2,ki) iz=max(18,cs) ki=min(ki,ft-(kz*4)-1) gr={kc=kq,cr=ki,cs=iz,ev=ev,ke=ke,kh=(#fd)*8,kf=kz} if(#lr>0) then
lv=gt da() gt=lv ed(lr,cr,cs,ev,ke) end end function jo(fi) for jb in all(fi.ca) do pal(jb[1],jb[2]) end lw=1 if fi.en then lw=fi.en end
for cu=0,lw-1 do ju(fi.x[fi.cq],fi.cr+(cu*(fi.ct*8)),fi.cs,fi.ct,fi.cu,fi.dr,fi.el) end pal() end function ef(ig,cr,cs) cr=cr+fx jd=je(ig) jf=flr(cr/8)+dz.by jg=flr(cs/8)+dz.bz jh={jf,jg} ji=jj(jd,jh) lx=je({cr=cr,cs=cs}) if jl(lx[1],lx[2]) then
add(ji,lx) end for jm in all(ji) do ly=(jm[1]-dz.by)*8+4 lz=(jm[2]-dz.bz)*8+4 local ma=sqrt((ly-ig.cr)^2+(lz-ig.cs)^2) local mb=ig.ew*(ly-ig.cr)/ma local mc=ig.ew*(lz-ig.cs)/ma ig.il=1 ig.flip=(mb<0) ig.er=bo if(ig.flip) then ig.er=bm end
for ko=0,ma/ig.ew do ig.cr=ig.cr+mb ig.cs=ig.cs+mc yield() end ig.il=2 end end function gy() for md,me in pairs(bw) do for mf,fi in pairs(me.cn) do fi.eg=me end end for mg,ig in pairs(du) do ig.il=2 ig.jr=1 ig.jv=1 ig.js=1 ig.ie={} ig.id=0 end end function jq(fi) if b and fi.iw then
rect(fi.iw.cr,fi.iw.cs,fi.iw.mh,fi.iw.mi,8) end end function hc(ce) for lo in all(ce) do if lo[2] and not coresume(lo[2],lo[3],lo[4]) then
del(ce,lo) lo=nil end end end function mj(cr,cs) jf=flr(cr/8)+dz.by jg=flr(cs/8)+dz.bz mk=jl(jf,jg) return mk end function je(fi) jf=flr(fi.cr/8)+dz.by jg=flr(fi.cs/8)+dz.bz return{jf,jg} end function jl(jf,jg) ml=mget(jf,jg) mk=fget(ml,0) return mk end function ib(fi) mm={} for is,fl in pairs(fi) do add(mm,is) end return mm end function fn(fi) fp={} mm=ib(fi[1]) add(fp,mm[1]) add(fp,fi[1][mm[1]]) add(fp,fi.i) return fp end function ky(fd,lu,mn) local kq={} local mo=""local mp=""local lq=""local mq=function(mr) if#mp+#mo>mr then
add(kq,mo) mo=""end mo=mo..mp mp=""end for ko=1,#fd do lq=sub(fd,ko,ko) mp=mp..lq if(lq==" ")
or(#mp>lu-1) then mq(lu) elseif#mp>lu-1 then mp=mp.."-"mq(lu) elseif lq==","and mn then f("line break!") mo=mo..sub(mp,1,#mp-1) mp=""mq(0) end end mq(lu) if mo!=""then
add(kq,mo) end return kq end function la(kq) kz=0 for kb in all(kq) do if#kb>kz then kz=#kb end
end return kz end function fk(fi,ms) if(band(fi,ms)!=0) then return true end
return false end function io() gm=fn(r) gn=nil go=nil cc=nil gq=false gp=""f("command wiped") end function iu(fi,ct,cu,mt,mu) cr=fi.cr cs=fi.cs if fk(fi.df,bi) then
fi.ij=fi.cr-(fi.ct*8)/2 fi.ik=fi.cs-(fi.cu*8)+1 cr=fi.ij cs=fi.ik end fi.iw={cr=cr,cs=cs+fv,mh=cr+ct-1,mi=cs+cu+fv-1,mt=mt,mu=mu} end function jj(mv,mw) mx={} my(mx,mv,0) mz={} mz[na(mv)]=nil nb={} nb[na(mv)]=0 while(#mx>0 and#mx<1000) do local nc=mx[#mx] del(mx,mx[#mx]) nd=nc[1] if na(nd)==na(mw) then
break end local ne={} for cr=-1,1 do for cs=-1,1 do if cr==0 and cs==0 then
else nf=nd[1]+cr ng=nd[2]+cs if abs(cr)!=abs(cs) then nh=1 else nh=1.4 end
if nf>=dz.by and nf<=dz.by+dz.hj
and ng>=dz.bz and ng<=dz.bz+dz.jc and jl(nf,ng) and((abs(cr)!=abs(cs)) or jl(nf,nd[2]) or jl(nf-cr,ng)) then add(ne,{nf,ng,nh}) end end end end for ni in all(ne) do local nj=na(ni) local nk=nb[na(nd)]+ni[3] if(nb[nj]==nil) or(nk<nb[nj]) then
nb[nj]=nk local nl=nk+max(abs(mw[1]-ni[1]),abs(mw[2]-ni[2])) my(mx,ni,nl) mz[nj]=nd end end end ji={} nd=mz[na(mw)] if nd then
local nm=na(nd) local nn=na(mv) while nm!=nn do add(ji,nd) nd=mz[nm] nm=na(nd) end for ko=1,(#ji/2) do local no=ji[ko] local np=#ji-(ko-1) ji[ko]=ji[np] ji[np]=no end end return ji end function my(nq,nr,jm) if#nq>=1 then
add(nq,{}) for ko=(#nq),2,-1 do local ni=nq[ko-1] if jm<ni[2] then
nq[ko]={nr,jm} return else nq[ko]=ni end end nq[1]={nr,jm} else add(nq,{nr,jm}) end end function na(ns) return((ns[1]+1)*16)+ns[2] end function kg(nt,cr,cs,nu,nv) local nu=nu or 7 local nv=nv or 0 nt=jy(nt) for nw=-1,1 do for nx=-1,1 do print(nt,cr+nw,cs+nx,nv) end end print(nt,cr,cs,nu) end function jz(fs) return(ft/2)-flr((#fs*4)/2) end function ny(fs) return(fu/2)-flr(5/2) end function iq(fi) if not fi.iw then return false end
iw=fi.iw if(gc+iw.mt>iw.mh or gc+iw.mt<iw.cr)
or(gd>iw.mi or gd<iw.cs) then return false else return true end end function jy(fs) local f=""local kb,jb,nq=false,false for ko=1,#fs do local iy=sub(fs,ko,ko) if iy=="^"then
if(jb) then f=f..iy end
jb=not jb elseif iy=="~"then if(nq) then f=f..iy end
nq,kb=not nq,not kb else if jb==kb and iy>="a"and iy<="z"then
for nz=1,26 do if iy==sub("abcdefghijklmnopqrstuvwxyz",nz,nz) then
iy=sub("\65\66\67\68\69\70\71\72\73\74\75\76\77\78\79\80\81\82\83\84\85\86\87\88\89\90\91\92",nz,nz) break end end end f=f..iy jb,nq=false,false end end return f end
__gfx__
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0f5ff5f0000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb4ffffff4000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbff44ffb000000000000000000000000000000000000000000000000000000000000000000000000
00000000b444449bb494449bb494449bb494449bb999449bb6ffff6b000000000000000000000000000000000000000000000000000000000000000000000000
000000004440444949444449494444494944444994444449bbf00fbb000000000000000000000000000000000000000000000000000000000000000000000000
000000004040000449440004494400044944000494444444bbf00fbb000000000000000000000000000000000000000000000000000000000000000000000000
0000000004ffff000440fffb0440fffb0440fffb44444444bbbffbbb000000000000000000000000000000000000000000000000000000000000000000000000
000000000f9ff9f004f0f9fb04f0f9fb04f0f9fb44444444bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000
000cc0000f5ff5f000fff5fb00fff5fb00fff5fb4444444000fff5fb00000000000000000000000000000000000000000000000000000000ffffffff00000000
00c11c004ffffff440ffffff40ffffff40ffffff0444444440ffffff00000000000000000000000000000000000000000000000000000000ffffffff00000000
0c1001c0bff44ffbb0fffff4b0fffff4b0fffff4b044444bb0fffff400000000000000000000000000000000000000000000000000000000ffffffff00000000
ccc00cccb6ffff6bb6fffffbb6fffffbb6fffffbb044444bb6fffffb00000000000000000000000000000000000000000000000000000000ffffffff00000000
00c00c00bbfddfbbbb6fffdbbb6fffdbbb6fffdbbb0000bbbb6ff00b00000000000000000000000000000000000000000000000000000000ffffffff00000000
00c00c00bbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbffbbbbbbff00b00000000000000000000000000000000000000000000000000000000ffffffff00000000
00cccc00bdc55cdbbbddcbbbbbbddbbbbbddcbbbbddddddbbbbbbffb00000000000000000000000000000000000000000000000000000000fff22fff00000000
00111100dcc55ccdb1ccdcbbbb1ccdbbb1ccdcbbdccccccdbbbbbbbb00000000000000000000000000000000000000000000000000000000ff0020ff00000000
00070000c1c66c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1c0000000000000000000000000000000000000000000000000000000000000000ff2302ffff2302ff
00070000c1c55c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1c0000000000000000000000000000000000000000000000000000000000000000ffb33bffffb33bff
00070000c1c55c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1c0000000000000000000000000000000000000000000000000000000000000000ff2bb2ffff2bb2ff
77707770c1c55c1cb1ccdcbbbb1ccdbbb1ccdcbbc1cccc1c0000000000000000000000000000000000000000000000000000000000000000ff2222ffff2222ff
00070000d1cddc1db1dddcbbbb1dddbbb1dddcbbd1cccc1d0000000000000000000000000000000000000000000000000000000000000000ff2bb2ffff2bb2ff
00070000fe1111efbbff11bbbb2ff1bbbbff11bbfe1111ef0000000000000000000000000000000000000000000000000000000000000000f2b33b2ff2b33b2f
00070000bf1111fbbbfe11bbbb2fe1bbbbfe11bbbf1111fb0000000000000000000000000000000000000000000000000000000000000000f22bb22ff2b33b2f
00000000bb1121bbbb2111bbbb2111bbbb2111bbbb1211bb0000000000000000000000000000000000000000000000000000000000000000f222222ff22bb22f
00cccc00bb1121bbbb1111bbbb2111bbbb2111bbbb1211bb0000000000000000000000000000000000000000000000000000000000000000f222222f00000000
00c11c00bb1121bbbb1111bbbb2111bbbb2111bbbb1211bb0000000000000000000000000000000000000000000000000000000000000000f22bb22f00000000
00c00c00bb1121bbbb1112bbbb2111bbbb21111bbb1211bb0000000000000000000000000000000000000000000000000000000000000000f2b33b2f00000000
ccc00cccbb1121bbbb1112bbbb2111bbbb22111bbb1211bb000000000000000000000000000000000000000000000000000000000000000022b33b2200000000
1c1001c1bb1121bbb111122bbb2111bbb222111bbb1211bb0000000000000000000000000000000000000000000000000000000000000000222bb22200000000
01c00c10bb1121bbc111222bbb2111bbb22211ccbb1211bb00000000000000000000000000000000000000000000000000000000000000002222222200000000
001cc100bbccccbb7ccc222bbbccccbbb222cc77bbccccbb00000000000000000000000000000000000000000000000000000000000000002222222200000000
00011000b776677bb7776666bb6777bbb66677bbb776677b0000000000000000000000000000000000000000000000000000000000000000bbbbbbbb00000000
00000000000000000000000000000000000000000000000077777777f9e9f9f9ddd5ddd5bbbbbbbb550000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000777777779eee9f9fdd5ddd5dbbbbbbbb555500000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000077777777feeef9f9d5ddd5ddbbbbbbbb555555000000000000000000000000000000000000000000
55555555ddddddddeeeeeeee000000000000000000000000777777779fef9fef5ddd5dddbbbbbbbb555555550000000000000000000000000000000000000000
55555555ddddddddeeeeeeee00000000000000000000000077777777f9f9feeeddd5ddd5bbbbbbbb555555550000000000000000000000000000000000000000
55555555ddddddddeeeeeeee000000000000000000000000777777779f9f9eeedd5ddd5dbbbbbbbb555555550000000000000000000000000000000000000000
55555555ddddddddeeeeeeee00000000000000000000000077777777f9f9feeed5ddd5ddbbbbbbbb555555550000000000000000000000000000000000000000
55555555ddddddddeeeeeeee000000000000000000000000777777779f9f9fef5ddd5dddbbbbbbbb555555550000000000000000000000000000000000000000
77777755666666ddbbbbbbee3333335533333333000000006666666658888588dddddddd00000000000000550000000000000000000000000000000000045000
777755556666ddddbbbbeeee33333355333333330000000066666666588885885555555500000000000055550000000000000000000000000000000000045000
7755555566ddddddbbeeeeee33336666333333330000000066666666555555556666666600000000005555550000000000000000000000000000000000045000
55555555ddddddddeeeeeeee33336666333333330000000066666666888588886666666600000000555555550000000000000000000000000000000000045000
55555555ddddddddeeeeeeee33555555333333330000000066666666888588886666666600000000555555550000000000000000000000000000000000045000
55555555ddddddddeeeeeeee33555555333333330000000066666666555555556666666600000000555555550000000000000000000000000000000000045000
55555555ddddddddeeeeeeee66666666333333330000000066666666588885886666666600000000555555550000000000000000000000000000000000045000
55555555ddddddddeeeeeeee66666666333333330000000066666666588885886666666600000000555555550000000000000000000000000000000000045000
55777777dd666666eebbbbbb55333333555555550000000000000000000000000000000000000000000000000000000000000000000000000000000099999999
55557777dddd6666eeeebbbb55333333555533330000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
55555577dddddd66eeeeeebb66663333553333330000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddeeeeeeee66663333533333330000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddeeeeeeee55555533533333330000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddeeeeeeee55555533553333330000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddeeeeeeee66666666555533330000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddeeeeeeee66666666555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb55555555333355550000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb66666666333333550000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb66666666333333350000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb55555555333333350000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb55555555333333550000000000000000000000000000000000000000000000000000000000000000000000000000000000045000
55555555ddddddddbbbbbbbb66666666333355550000000000000000000000000000000000000000000000000000000000000000000000000b03000099999999
55555555ddddddddbbbbbbbb6666666655555555000000000000000000000000000000000000000000000000000000000000000000000000b00030b055555555
00000000000000000000000000000000777777777777777777555555555555770000000000000000000000000000000000000000000000004444444444444444
00000000000000000000000000000000700000077000000770700000000007070000000000000000000000000000000000000000000000004ffffff44ffffff4
00000000000000000000000000000000700000077000000770070000000070070000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600070000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600070000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600070000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000700000077000000770006000000600070000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000777777777777777777776000000677770000000000000000000000000000000000000000000000004f4444944f444494
00000000000000000000000000000000700000677600000770066000000660070000000000000000000000000000000000000000000000004f4444944f444494
0000000000000000000a000000000000700006077060000770606000000606070000000000000000000000000000000000000000000000004f9999944f444494
0000000000000000000000000000000070000507705000077050600000060507000000000000000000000000000000000000000000000000444444444f449994
0000000000a0a000000aa000000a0a0070000007700000077000600000060007000000000000000000000000000000000000000000000000444444444f994444
0000000000aaaa0000aaaa0000aaa0007000000770000007700500000000500700000000000000000000000000000000000000000000000049a4444444444444
0000000000a9aa0000a99a0000aa9a00700000077000000770500000000005070000000000000000000000000000000000000000000000004994444444444444
0000000000a99a0000a99a0000a99a00777777777777777775000000000000770000000000000000000000000000000000000000000000004444444449a44444
00000000004444000044440000444400555555555555555555555555555555550000000000000000000000000000000000000000000000004ffffff449944444
99999999777777777777777777777777700000077776000077777777777777770000000000000000000000000000000000000000000000004f44449444444444
55555555555555555555555555555555700000077776000055555555555555550000000000000000000000000000000000000000000000004f4444944444fff4
444444440dd6dd6dd6dd6dd6d6dd6d50700000077776000044444444444444440000000000000000000000000000000000000000000000004f4444944fff4494
ffff4fff0dd6dd6dd6dd6dd6d6dd6d507000000766665555444ffffffffff4440000000000000000000000000000000000000000000000004f4444944f444494
44494944066666666666666666666650700000070000777644494444444494440000000000000000000000000000000000000000000000004f4444944f444494
444949440d6dd6dd6dd6dd6ddd6dd65070000007000077764449444aa44494440000000000000000000000000000000000000000000000004f4444944f444494
444949440d6dd6dd6dd6dd6ddd6dd650777777770000777644494444444494440000000000000000000000000000000000000000000000004ffffff44f444494
4449494406666666666666666666665055555555555566664449999999999444000000000000000000000000000000000000000000000000444444444f444494
444949440dd6dd600000000056dd6d5000000000000000004449444444449444000000000000000000000000000000000000000000000000000000004f444494
444949440dd6dd650000000056dd6d5000000000000000004449444444449444000000000000000000000000000000000000000000000000000000004f444994
4449494406666665000000005666665000000000000000004449444444449444000000000000000000000000000000000000000000000000000000004f499444
444949440d6dd6d5000000005d6dd65000000000000000004449444444449444000000000000000000000000000000000000000000000000000000004f944444
444949440d6dd6d5000000005d6dd650000000000000000044494444444494440000000000000000000000000000000000000000000000000000000044444400
44494944066666650000000056666650000000000000000044494444444494440000000000000000000000000000000000000000000000000000000044440000
999949990dd6dd650000000056dd6d50000000000000000044499999999994440000000000000000000000000000000000000000000000000000000044000000
444444440dd6dd650000000056dd6d50000000000000000044444444444444440000000000000000000000000000000000000000000000000000000000000000
fff76ffffff76ffffff76fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffff
fff76ffffff76ffffff76fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666666f
fbbbbccff8888bbffcccc88f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006cccccc6
bbbcccc8888bbbbcccc8888b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d666666d
fccccc8ffbbbbbcff88888bf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
fccc888ffbbbcccff888bbbf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
fff00ffffff00ffffff00fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
fff00ffffff00ffffff00fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff6665ff
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffff
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666666f
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065555556
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d666666d
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f666650f
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff6665ff
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000094
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000944
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009440
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000094400
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000094000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044000000
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
8aaaaaa88cccccc8822222288bbbbbb8899999988eeeeee88dddddd8866666688111111885555558877777788ffffff883333338844444488dddddd880000008
8a8aa8a88c8cc8c8828228288b8bb8b8898998988e8ee8e88d8dd8d8868668688181181885855858878778788f8ff8f883833838848448488d8dd8d880800808
8aa88aa88cc88cc8822882288bb88bb8899889988ee88ee88dd88dd8866886688118811885588558877887788ff88ff883388338844884488dd88dd880088008
8aa88aa88cc88cc8822882288bb88bb8899889988ee88ee88dd88dd8866886688118811885588558877887788ff88ff883388338844884488dd88dd880088008
8a8aa8a88c8cc8c8828228288b8bb8b8898998988e8ee8e88d8dd8d8868668688181181885855858878778788f8ff8f883833838848448488d8dd8d880800808
8aaaaaa88cccccc8822222288bbbbbb8899999988eeeeee88dddddd8866666688111111885555558877777788ffffff883333338844444488dddddd880000008
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000010000000000010101010100000000000100000000000101010101000000000000000000000001010101010000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4646464747474747474747474746464656565648484848484848484848484848484848484856565600000000000000004444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
4646464700004747474747474746464656565648484848484848848585854848484848484856565600000000000000004444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
46004647000047474747474747460046560056a5a5a5a5a5a5a594a4a495a5a5a5a5a5a5a556005600000000000000004400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
460046a0a0a0a0a1a2a3a0a0a0460046560056a6a7a6a7a6a7a6a7a6a7a6a7a6a7a6a7a6a756005600000000000000004400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
460046b0b0b0b0b1b2b3b0b0b0460046560056b6b7b6b7b6b7b6b7b6b7b6b7b6b7b6b7b6b756005600000000000000004400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4640507070707070707070707060404656415171717171717171717171717171717171717161415600000000000000004454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444
5070707064545454545454747070706051717171717171717171717171717171717171717171716100000000000000006470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074
7070707070707070707070707070707071717171717171717171717171717171717171717171717100000000000000007070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070
44444449494949494949494949494949000000000000000000005f0058585858585858585858585858585858005f00004444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
44444449494949494949494949494949000000000000000000005f0058845884588458008e58845884588458005f00004444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
44004449494949494949494949494949000000000000000000005f0058a458a458a458009e58a458a458a458005f00004400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
440044494949494949494949494949490000000000004500000045005858585858585800ae58585858585858000000004400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
440044494949494949494949494949497e7e7e7e7e7e7e7e7e7e5a7070707070707070647470707070707070704a7e7e4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4454647070707070707070707070707054545454545454545454575757575757575773737373575757575757575754544454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444
6470707070707070707070707070707054545454545454545454545454545454545373737373635454545454545454546470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074
7070707070707070707070707070707054545454545454545454545454545454545454545454545454545454545454547070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070
4444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
4444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444
6470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074
7070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070
4444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
4444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444444444494949494949494949494444444444444949494949494949494944444444444449494949494949494949444444
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044440044494949494949494949494400444400444949494949494949494944004444004449494949494949494949440044
4454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444445464707070707070707070707454444454647070707070707070707074544444546470707070707070707070745444
6470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074647070707070707070707070707070746470707070707070707070707070707464707070707070707070707070707074
7070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

