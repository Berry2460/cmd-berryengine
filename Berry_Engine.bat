goto setall
:setall
if "%scanmap%"=="" set scanmap=y
if "%chunk%"=="" set chunk=8
if %chunk% lss 3 set chunk=3
if "%sky%"=="" set sky=.
if "%floor%"=="" set floor=-
if "%height%"=="" set height=9
if %height% gtr 16 set height=16
if %height% lss 1 set height=1
if "%animate%"=="" set animate=n
if "%collide%"=="" set collide=n
if "%vmax%"=="" set vmax=0
if "%texmax%"=="" set texmax=0
if "%mmax%"=="" set mmax=0
if "%mamax%"=="" set mamax=0
if "%turn%"=="" set turn=1
if "%mapxmax%"=="" set mapxmax=0
if "%mapymax%"=="" set mapymax=0
if "%cx%"=="" set cx=0
if "%cy%"=="" set cy=0
if %cx% gtr %mapxmax% set cx=%mapxmax%
if %cx% lss 0 set cx=0
if %cy% gtr %mapymax% set cy=%mapymax%
if %cy% lss 0 set cy=0
if "%chfind%"=="" set cfind=n
if "%getchunk%"=="" set getchunk=n
if "%ofind%"=="" set ofind=n
if "%render%"=="" set render=6
if %render% lss 1 set render=1
if %render% gtr 15 set render=15
if "%scanmap%"=="y" goto gridset
if "%chfind%"=="y" goto chunkfset
if "%getchunk%"=="y" goto getchunk
if "%ofind%"=="y" goto ofind
if "%collide%"=="y" goto cset
if "%animate%"=="y" goto modaset
goto startup
:gridset
set scanmap=n
set gx=1
set gy=1
set gridx=0
set gridy=0
set vecfind=0
set count=0
set gridxmax=0
set gridymax=0
set /a gxmax=%mapxmax%/%chunk%+1
set /a gymax=%mapymax%/%chunk%+1
goto grid
:grid
set g%gx%g%gy%max=%count%
if "%vecfind%"=="%vmax%" if "%gx%"=="%gxmax%" if "%gy%"=="%gymax%" goto done
if "%vecfind%"=="%vmax%" if "%gx%"=="%gxmax%" (
set /a gy+=1
set count=0
set /a gridy+=%chunk%
set gx=1
set vecfind=0
set gridx=0
)
if "%vecfind%"=="%vmax%" (
set count=0
set /a gx+=1
set /a gridx+=%chunk%
set vecfind=0
)
set /a gridxmax=%gridx%+%chunk%
set /a gridymax=%gridy%+%chunk%
set /a vecfind+=1
if %gridx% lss 0 set gridx=0
if %gridy% lss 0 set gridy=0
set vx=!v%vecfind%x!
set vy=!v%vecfind%y!
set vc=!v%vecfind%c!
set colx=n
set coly=n
if "%vc%"=="n" if %vx% gtr %gridx% if %vx% lss %gridxmax% set colx=y
if "%vc%"=="n" if %vy% gtr %gridy% if %vy% lss %gridymax% set coly=y
if "%vc%"=="n" if "%vx%"=="%gridx%" set colx=y
if "%vc%"=="n" if "%vx%"=="%gridxmax%" set colx=y
if "%vc%"=="n" if "%vy%"=="%gridy%" set coly=y
if "%vc%"=="n" if "%vy%"=="%gridymax%" set coly=y
if "%vc%"=="n" if "%colx%%coly%"=="yy" set /a count+=1
if "%vc%"=="n" if "%colx%%coly%"=="yy" set g%gx%g%gy%v%count%=%vecfind%
if "%vc%"=="n" goto grid
set vcx=!v%vc%x!
set vcy=!v%vc%y!
if %vx% gtr %gridx% if %vx% lss %gridxmax% set colx=y
if %vy% gtr %gridy% if %vy% lss %gridymax% set coly=y
if %vcx% gtr %gridx% if %vcx% lss %gridxmax% set colx=y
if %vcy% gtr %gridy% if %vcy% lss %gridymax% set coly=y
set guess=n
if "%guess%"=="n" if "%colx%"=="n" if %vx% gtr %vcx% if %vx% gtr %gridx% if %vcx% lss %gridx% set colx=y&set guess=y
if "%guess%"=="n" if "%colx%"=="n" if %vx% gtr %vcx% if %vx% gtr %gridxmax% if %vcx% lss %gridxmax% set colx=y&set guess=y
if "%guess%"=="n" if "%colx%"=="n" if %vx% lss %vcx% if %vx% lss %gridx% if %vcx% gtr %gridx% set colx=y&set guess=y
if "%guess%"=="n" if "%colx%"=="n" if %vx% lss %vcx% if %vx% lss %gridxmax% if %vcx% gtr %gridxmax% set colx=y&set guess=y
if "%guess%"=="n" if "%coly%"=="n" if %vy% gtr %vcy% if %vy% gtr %gridy% if %vcy% lss %gridy% set coly=y&set guess=y
if "%guess%"=="n" if "%coly%"=="n" if %vy% gtr %vcy% if %vy% gtr %gridymax% if %vcy% lss %gridymax% set coly=y&set guess=y
if "%guess%"=="n" if "%coly%"=="n" if %vy% lss %vcy% if %vy% lss %gridy% if %vcy% gtr %gridy% set coly=y&set guess=y
if "%guess%"=="n" if "%coly%"=="n" if %vy% lss %vcy% if %vy% lss %gridymax% if %vcy% gtr %gridymax% set coly=y&set guess=y
if "%vx%"=="%gridx%" set colx=y
if "%vx%"=="%gridxmax%" set colx=y
if "%vy%"=="%gridy%" set coly=y
if "%vy%"=="%gridymax%" set coly=y
if "%vcx%"=="%gridx%" set colx=y
if "%vcx%"=="%gridxmax%" set colx=y
if "%vcy%"=="%gridy%" set coly=y
if "%vcy%"=="%gridymax%" set coly=y
if "%colx%%coly%"=="yy" set /a count+=1
if "%colx%%coly%"=="yy" (
set g%gx%g%gy%v%count%=%vecfind%
)
goto grid
:startup
set sx=0
set sy=1
set /a skyheight=%height%+1
goto start
:start
set /a sx+=1
if "%sy%"=="1" set r%sx%b1=n
if "%sy%"=="1" set r%sx%b2=n
if "%sy%"=="1" set r%sx%c1=1
if "%sy%"=="1" set r%sx%c2=1
if %sy% lss %skyheight% set x%sx%x%sy%=%sky%
if %sy% gtr %height% set x%sx%x%sy%=%floor%
if %sx% gtr 31 set /a sy+=1&set sx=0
if %sy% gtr 16 goto rayset
goto start
:rayset
set ray=0
set count=0
set add=-1
set straight=n
set flip=n
set layerdone=n
goto newray
:raytexset
set texfind=0
if "%straight%"=="y" set add=%restoreadd%&set flip=y
if "%straight%"=="y" set straight=n
goto raytexfind
:raytexfind
set text=n
if "%texfind%"=="%texmax%" goto rayfind
set /a texfind+=1
set texfound=!tex%texfind%!
set text=!tex%texfind%t!
if "%texfound%"=="%block%" goto rayfind
goto raytexfind
:rayfind
if "%layerdone%"=="n" if "%text%"=="y" set layer=2
if "%text%"=="n" if "%newray%"=="y" set flip=y
if "%flip%"=="n" if "%text%"=="y" if "%newray%"=="y" set straight=y
if "%flip%"=="n" if "%text%"=="y" if "%newray%"=="y" set restoreadd=%add%
if %count% lss 1 set count=1
set r%ray%b%layer%=%block%
set r%ray%c%layer%=%count%
if "%text%"=="n" set count=0
if "%layer%"=="1" if "%flip%"=="y" if %add% lss 1 goto drawset
if "%layerdone%"=="y" set count=0&set text=n&set layerdone=n
if "%text%"=="n" goto newray
if "%layerdone%"=="n" set layer=1&set layerdone=y
if "%text%"=="y" goto raycast
goto newray
:newray
if "%flip%"=="y" if %add% lss 1 goto drawset
set layer=1
set newray=y
set /a ray+=1
if %ray% gtr 32 goto drawset
if "%flip%"=="n" set /a add+=1
if "%flip%"=="y" set /a add-=1
set rx=%cx%
set ry=%cy%
if "%turn%"=="1" set /a ry-=%add%
if "%turn%"=="2" set /a rx+=%add%
if "%turn%"=="3" set /a ry+=%add%
if "%turn%"=="4" set /a rx-=%add%
set /a count+=%add%
if %rx% gtr %mapxmax% set block=n&goto raytexset
if %ry% gtr %mapymax% set block=n&goto raytexset
if %rx% lss 0 set block=n&goto raytexset
if %ry% lss 0 set block=n&goto raytexset
if "%flip%"=="n" if "%add%"=="%render%" set flip=y&set block=n&goto raytexset
if "%flip%"=="n" goto findareaset
if "%straight%"=="y" goto newray
goto raycast
:raycast
set newray=n
if %rx% gtr %mapxmax% set block=n&goto raytexset
if %ry% gtr %mapymax% set block=n&goto raytexset
if %rx% lss 0 set block=n&goto raytexset
if %ry% lss 0 set block=n&goto raytexset
set /a count+=1
if "%count%"=="%render%" set block=n&goto raytexset
if "%straight%"=="n" if "%flip%"=="n" if "%turn%"=="1" set /a rx-=1
if "%straight%"=="n" if "%flip%"=="n" if "%turn%"=="2" set /a ry-=1
if "%straight%"=="n" if "%flip%"=="n" if "%turn%"=="3" set /a rx+=1
if "%straight%"=="n" if "%flip%"=="n" if "%turn%"=="4" set /a ry+=1
if "%straight%"=="n" if "%flip%"=="y" if "%turn%"=="1" set /a rx+=1
if "%straight%"=="n" if "%flip%"=="y" if "%turn%"=="2" set /a ry+=1
if "%straight%"=="n" if "%flip%"=="y" if "%turn%"=="3" set /a rx-=1
if "%straight%"=="n" if "%flip%"=="y" if "%turn%"=="4" set /a ry-=1
if "%turn%"=="1" set /a ry-=1
if "%turn%"=="2" set /a rx+=1
if "%turn%"=="3" set /a ry+=1
if "%turn%"=="4" set /a rx-=1
goto findareaset
:findareaset
if "%rx%x%ry%"=="%cx%x%cy%" goto raycast
set findvect=0
set /a gridx=(%rx%/%chunk%)+1
set /a gridy=(%ry%/%chunk%)+1
set gridvmax=!g%gridx%g%gridy%max!
goto countfind
:countfind
if "%findvect%"=="%gridvmax%" goto findobjset
set /a findvect+=1
set /a gridx=(%rx%/%chunk%)+1
set /a gridy=(%ry%/%chunk%)+1
set gridv=!g%gridx%g%gridy%v%findvect%!
goto findarea
:findarea
set vx=!v%gridv%x!
set vy=!v%gridv%y!
set block=!v%gridv%b!
set vc=!v%gridv%c!
set vv=!v%gridv%v!
if "%vv%"=="" set vv=y
if "%vc%"=="" set vc=n
if "%vv%"=="n" goto countfind
if "%vc%"=="n" if "%rx%x%ry%"=="%vx%x%vy%" goto raytexset
if "%vc%"=="n" goto countfind
set vcx=!v%vc%x%!
set vcy=!v%vc%y%!
set colx=n
set coly=n
set guess=n
if "%guess%"=="n" if %vx% gtr %vcx% if %rx% lss %vx% if %rx% gtr %vcx% set colx=y&set guess=y
if "%guess%"=="n" if %vx% lss %vcx% if %rx% gtr %vx% if %rx% lss %vcx% set colx=y&set guess=y
if "%guess%"=="n" if %vy% gtr %vcy% if %ry% lss %vy% if %ry% gtr %vcy% set coly=y&set guess=y
if "%guess%"=="n" if %vy% lss %vcy% if %ry% gtr %vy% if %ry% lss %vcy% set coly=y&set guess=y
if "%rx%"=="%vx%" set colx=y
if "%ry%"=="%vy%" set coly=y
if "%rx%"=="%vcx%" set colx=y
if "%ry%"=="%vcy%" set coly=y
if "%colx%%coly%"=="yy" goto raytexset
goto countfind
:findobjset
set findo=0
goto findobj
:findobj
if "%findo%"=="%omax%" goto raycast
set /a findo+=1
set ox=!o%findo%x!
set oy=!o%findo%y!
set block=!o%findo%b!
set ov=!o%findo%v!
if "%ov%"=="" set ov=y
if "%ov%"=="y" if "%rx%x%ry%"=="%ox%x%oy%" goto raytexset
goto findobj
:drawset
set rayfind=1
set /a raysize=32/%ray%
set screenx=0
set screenmax=%screenx%
set layer=1
goto setupdraw
:setupdraw
set layernew=n
set newblock=n
goto setblocks
:setblocks
set rayb=!r%rayfind%b%layer%!
set rayc=!r%rayfind%c%layer%!
if "%rayb%"=="" set rayb=n
if "%layer%"=="1" if "%rayb%"=="n" set layer=2&set layernew=y&goto setblocks
goto textureset
:newdraw
if %rayfind% gtr %ray% goto drawmodset
if "%layernew%"=="n" if "%layer%"=="2" if "%rayb%"=="n" set layer=1&set /a rayfind+=1&goto setupdraw
if "%texturefound%"=="n" set texxmax=1
if "%texturefound%"=="n" set texymax=1
set screenadd=0
set texx=%texxmax%
set /a texy=%texymax%/2+1
if "%texturefound%"=="y" if "%layer%"=="1" set screenmax=%screenx%
if "%texturefound%"=="y" if "%layer%"=="1" set /a screenx+=%raysize%
if "%texturefound%"=="y" if "%layernew%"=="y" set screenmax=%screenx%
if "%texturefound%"=="y" if "%layernew%"=="y" set /a screenx+=%raysize%
if "%texturefound%"=="y" if "%newblock%"=="y" set screenmax=%screenx%
if "%texturefound%"=="y" if "%newblock%"=="y" set /a screenx+=%raysize%
if "%texturefound%"=="n" set screenmax=%screenx%
if "%texturefound%"=="n" set /a screenx+=%raysize%
if "%rayfind%"=="%ray%" set screenx=32
set screeny=%height%
set flip=n
if "%layer%"=="2" if "%rayb%"=="n" set layer=1&set /a rayfind+=1&goto setupdraw
if "%layer%"=="1" if "%newblock%"=="n" if "%rayb%"=="n" set layer=2&set newblock=y&goto setblocks
set /a raytall=13/%rayc%
set /a texxadd=%texxmax%/%raysize%
set /a texyadd=%texymax%/%raytall%
if %texxadd% lss 1 set texxadd=1
if %texyadd% lss 1 set texyadd=1
set dtexyadd=%texyadd%
goto drawscreen
:textureset
set texfind=0
set texturefound=n
goto texturefind
:texturefind
set text=n
if "%texfind%"=="%texmax%" set textureblock=%rayb%&goto newdraw
set /a texfind+=1
if "%rayb%"=="n" goto texturefind
set texfound=!tex%texfind%!
set text=!tex%texfind%t!
set texxmax=!tex%texfind%xmax!
set texymax=!tex%texfind%ymax!
if "%texfound%"=="%rayb%" set texturefound=y&goto newdraw
goto texturefind
:drawscreen
if "%rayfind%"=="%ray%" if %screenadd% gtr %raytall% if "%layer%"=="2" goto drawmodset
if "%texturefound%"=="n" if "%rayfind%"=="%ray%" if "%rayb%"=="n" if "%layer%"=="1" goto drawmodset
if "%texturefound%"=="y" if "%rayfind%"=="%ray%" if "%rayb%"=="n" if "%layer%"=="1" if "%text%"=="n" goto drawmodset
if "%rayfind%"=="%ray%" if "%rayb%"=="n" if "%layer%"=="2" goto drawmodset
if %screenadd% gtr %raytall% if not "%rayfind%"=="%ray%" if "%layer%"=="2" set /a rayfind+=1&set layer=1&goto setupdraw
if %screenadd% gtr %raytall% if "%layer%"=="1" set layer=2&goto setupdraw
if "%texturefound%"=="y" if %texx% lss 1 set texx=1
if "%texturefound%"=="y" if %texx% gtr %texxmax% set texx=%texymax%
if "%texturefound%"=="y" if %texy% lss 1 set texy=1
if "%texturefound%"=="y" if %texy% gtr %texymax% set texy=%texymax%
if "%texturefound%"=="y" set textureblock=!tex%texfind%x%texx%x%texy%!
if "%textureblock%"=="" set textureblock=n
if not "%textureblock%"=="n" set x%screenx%x%screeny%=%textureblock%
if "%texturefound%"=="y" set /a texx-=%texxadd%
set /a screenx-=1
if "%screenx%"=="%screenmax%" goto flipscreen
goto drawscreen
:flipscreen
if "%texturefound%"=="y" set texx=%texxmax%
if "%flip%"=="n" if "%texturefound%"=="y" set /a texy-=%texyadd%
if "%flip%"=="y" if "%texturefound%"=="y" set /a texy+=%texyadd%
set /a texyadd+=%dtexyadd%
if "%flip%"=="n" set /a screenx+=%raysize%&set /a screenadd+=1
if "%flip%"=="n" set /a screeny-=%screenadd%
if "%flip%"=="n" if "%rayfind%"=="%ray%" set screenx=32&set flip=y&goto drawscreen
if "%flip%"=="n" set flip=y&goto drawscreen
if "%flip%"=="y" set /a screenx+=%raysize%&set /a screenadd+=1
if "%flip%"=="y" set /a screeny+=%screenadd%
if "%flip%"=="y" if "%rayfind%"=="%ray%" set screenx=32&set flip=n&goto drawscreen
if "%flip%"=="y" set flip=n&goto drawscreen
goto drawscreen
:drawmodset
set mod=0
goto drawmod
:drawmod
if "%mod%"=="%mmax%" goto displayset
set /a mod+=1
set mx=!m%mod%x!
set my=!m%mod%y!
set mb=!m%mod%b!
set reverse%mod%=!x%mx%x%my%!
set x%mx%x%my%=%mb%
goto drawmod
:displayset
cls
set yscr=0
goto display
:display
if "%yscr%"=="16" goto done
set /a yscr+=1
echo !x1x%yscr%!!x2x%yscr%!!x3x%yscr%!!x4x%yscr%!!x5x%yscr%!!x6x%yscr%!!x7x%yscr%!!x8x%yscr%!!x9x%yscr%!!x10x%yscr%!!x11x%yscr%!!x12x%yscr%!!x13x%yscr%!!x14x%yscr%!!x15x%yscr%!!x16x%yscr%!!x17x%yscr%!!x18x%yscr%!!x19x%yscr%!!x20x%yscr%!!x21x%yscr%!!x22x%yscr%!!x23x%yscr%!!x24x%yscr%!!x25x%yscr%!!x26x%yscr%!!x27x%yscr%!!x28x%yscr%!!x29x%yscr%!!x30x%yscr%!!x31x%yscr%!!x32x%yscr%!
goto display
:modaset
set animate=n
set moda=0
set mr=0
goto modreverse
:modreverse
if "%mr%"=="%mmax%" goto modanimate
set /a mr+=1
set reverse=!reverse%mr%!
set rex=!m%mr%x!
set rey=!m%mr%y!
set x%rex%x%rey%=%reverse%
goto modreverse
:modanimate
if "%moda%"=="%mamax%" goto displayset
set /a moda+=1
set max=!ma%moda%x!
set may=!ma%moda%y!
set mab=!ma%moda%b!
set x%max%x%may%=%mab%
goto modanimate
:cset
set collide=n
set ctype=n
set cnumber=n
set cblock=n
set creturn=n
set findvect=0
set /a gridx=(%collix%/%chunk%)+1
set /a gridy=(%colliy%/%chunk%)+1
set gridvmax=!g%gridx%g%gridy%max!
goto cfind
:cfind
if "%findvect%"=="%gridvmax%" goto findoset
set /a findvect+=1
set /a gridx=(%collix%/%chunk%)+1
set /a gridy=(%colliy%/%chunk%)+1
set gridv=!g%gridx%g%gridy%v%findvect%!
goto finda
:finda
set vx=!v%gridv%x!
set vy=!v%gridv%y!
set block=!v%gridv%b!
set vc=!v%gridv%c!
set vv=!v%gridv%v!
if "%vv%"=="" set vv=y
if "%vc%"=="" set vc=n
if "%vv%"=="n" goto cfind
if "%vc%"=="n" if "%collix%x%colliy%"=="%vx%x%vy%" set ctype=v&set cnumber=%gridv%&set cblock=%block%&set creturn=y&goto done
if "%vc%"=="n" goto cfind
set vcx=!v%vc%x%!
set vcy=!v%vc%y%!
set colx=n
set coly=n
set guess=n
if "%guess%"=="n" if %vx% gtr %vcx% if %collix% lss %vx% if %collix% gtr %vcx% set colx=y&set guess=y
if "%guess%"=="n" if %vx% lss %vcx% if %collix% gtr %vx% if %collix% lss %vcx% set colx=y&set guess=y
if "%guess%"=="n" if %vy% gtr %vcy% if %colliy% lss %vy% if %colliy% gtr %vcy% set coly=y&set guess=y
if "%guess%"=="n" if %vy% lss %vcy% if %colliy% gtr %vy% if %colliy% lss %vcy% set coly=y&set guess=y
if "%collix%"=="%vx%" set colx=y
if "%colliy%"=="%vy%" set coly=y
if "%collix%"=="%vcx%" set colx=y
if "%colliy%"=="%vcy%" set coly=y
if "%colx%%coly%"=="yy" set ctype=v&set cnumber=%gridv%&set cblock=%block%&set creturn=y&goto done
goto cfind
:findoset
set findo=0
goto collideo
:collideo
if "%findo%"=="%omax%" goto done
set /a findo+=1
set ox=!o%findo%x!
set oy=!o%findo%y!
set block=!o%findo%b!
set ov=!o%findo%v!
if "%ov%"=="" set ov=y
if "%ov%"=="y" if "%collix%x%colliy%"=="%ox%x%oy%" set ctype=c&set cnumber=%findo%&set cblock=%block%&set creturn=y&goto done
goto collideo
:ofind
set ofind=n
set returnx=n
set returny=n
set block=n
set returnv=n
if "%osearch%"=="" goto done
if %osearch% lss 1 goto done
if %osearch% gtr %omax% goto done
set returnx=!o%osearch%x!
set returny=!o%osearch%y!
set block=!o%osearch%b!
set returnv=!o%osearch%v!
goto done
:chunkfset
set chfind=n
set chfound=n
if "%chfx%"=="" goto done
if "%chfy%"=="" goto done
if "%chsearch%"=="" goto done
set max=!g%chfx%g%chfy%max!
set cnum=0
goto findchunk
:findchunk
if "%cnum%"=="%max%" goto done
set /a cnum+=1
set searchchunk=!g%chfx%g%chfy%v%cnum%!
set find=!v%searchchunk%b!
if "%find%"=="%chsearch%" set chfound=y&goto done
goto findchunk
:getchunk
set getchunk=n
set /a chx=(%chx%/%chunk%)+1
set /a chy=(%chy%/%chunk%)+1
goto done
:done
