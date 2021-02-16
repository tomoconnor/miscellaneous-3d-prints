w=6;
th=3;
l=180;
sl=8;

linear_extrude(height = th, center = true, convexity = 10,  slices = 20, scale = 1.0, $fn = 16) {

polygon(points=[
[sl,0],
[0,(-w/2)], 
[-l,(-w/2)], 
[-l,(w/2)], 
[0,(w/2)]]);
}