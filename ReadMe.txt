The engine will automaticly render the scene by calling.

IMPORTANT: Use the command "setlocal enabledelayedexpansion" on main program when using the engine!

scanmap = Load map data into engine (Only used once on new map loading) (scanmap=y)
chunk = Size of square chunks (chunk=5) (smaller chunks require more pre-calculation but render faster)
sky = set sky texture (sky=:)
floor = set floor texture (floor=+)
render = set max render distance (1-15) (render=6)
height = Camera center height on Y coordinate (1-16) (height=9)
cx = Camera X (cx=5)
cy = Camera Y (cy=3)
mapxmax = maximum X coordinate for map (mapxmax=10)
mapymax = maximum Y coordinate for map (mapymax=10)
turn = Camera Direction 1-4 (North, East, South, West)
vmax = vector maximum (Vectors can be connected but cannot move without another map scan) (vmax=6)
v1x = vector X coordinate (v4x=2)
v1y = vector Y coordinate (v4y=3)
v1b = vector block identifier (v4b=#)
v1c = vector connection (v4c=5) (use 'n' as nothing) (Straight lines or Boxes can be made)
v1v = vector visible (v4v=y) ('y' or 'n')
omax = object maximum (Objects cannot be connected but can be moved freely) (omax=6)
o1x = object X coordinate (o4x=2)
o1y = object Y coordinate (o4y=3)
o1b = object block identifier (o4b=#)
o1v = object visible (o4v=y) ('y' or 'n')
mmax = model max blocks to draw (wmax=12)
m1x = model block X (m4x=15)
m1y = model block Y (m4y=6)
m1b = model block (m4b=@)
mamax = model animation max blocks to draw (mamax=10)
ma1x = model animation block X (ma4x=15)
ma1y = model animation block Y (ma4y=6)
ma1b = model animation block (ma4b=+)
animate = Used to play model animation ('y' or 'n') (animate=y)
chfind = Enable finding items in given chunk ('y' or 'n') (chfind=y)
chsearch = Vector to search for in chunk (chsearch=wall)
chfx = Chunk X coordinate to search in (chfx=3)
chfy = Chunk Y coordinate to search in (chfy=1)
chfound = Returned chunk found value ('y' or 'n') (if "%chfound%"=="y" echo FOUND %chsearch%!)
getchunk = Convert map coordinates to chunk coordinates ('y' or 'n')
chx = Given X coordinate to be converted to chunk X (chx=10) Also the same variable is converted to chunk X (now chx=3)
chy = Given Y coordinate to be converted to chunk Y (chy=13) Also the same variable is converted to chunk Y (now chy=3)
texmax = max textures used (texmax=6)
tex1 = texture identifier (tex4=#) ('n' is blank)
tex1t = texture transparent value (tex4t=y) ('y' or 'n')
tex1x1x1 = texture value (tex4x10x14=!) ('n' is blank) (tex(number)x(X)x(Y))
tex1xmax = texture max X (tex1xmax=10)
tex1ymax = texture max Y (tex1ymax=14)
collide = collision check ('y' or 'n') (collide=y)
collix = collision X coordinate (collix=%cx%)
colliy = collision Y coordinate (colliy=%cy%)
creturn = collision check return value ('y' or 'n') (if "%creturn%"=="y" echo Collide!)
ctype = type of block collision ('v' for vector, 'o' for object) ('n' is nothing) (if "%ctype%"=="o" echo Collide With Object!)
cnumber = collision check return vector value (if "%cnumber%"=="3" if "%ctype%"=="v" echo Collide With Vector 3!)
cblock = collision check return block identifier value (if "%cblock%"=="@" echo Collide With Block @!)
ofind = enables searching for a object properties (ofind=y)
osearch = object properties to search for (osearch=3)
block = returned object block data (if "%block%"=="enemy" echo Object 3 is an enemy)
returnx = returned object X coordinate (if "%returnx%"=="3" echo Object 3, X=3)
returny = returned object Y coordinate (if "%returny%"=="4" echo Object 3, Y=4)
returnv = returned object visible variable (if "%returnv%"=="y" echo Object 3 can be seen!)

The screen is X:32 by Y:16

The minimum Map X and Y is 0

The minimum for Chunk size is 3

Start all vectors, objects, textures, and models/animations numbers from 1 and so forth

Textures are usually X:10 Y:14 (Any Texture smaller might not scale properly)

Call "Berry_Engine.bat" again after using the "animate", "collide", "scanmap", "ofind", "chfind", and "getchunk" functions.

To use functions, call "Berry_Engine.bat"
