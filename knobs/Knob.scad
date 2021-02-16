difference(){
rotate_extrude(angle=360, convexity=10){
    rotate([0,0,90]){
translate([10,0,0]){
difference(){
circle(10);
    translate([0,-10,0]){
    square([20,20], center=true);
    }
}
translate([8,0,0]){
    square([6,3], center=false);
}
}
}
}
color("#FF0000"){
translate([0,0,21]){
    linear_extrude(height=8,center=true,convexity=10,twist=0,slices=8){
    circle(d=2.5);
    }
}
}
}