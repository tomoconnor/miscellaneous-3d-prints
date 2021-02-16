toprad = 20;

baserad = 10;

shell_thickness=3;
rose_height = 20;
adapter_height = 10;
$fn=100;
difference(){
cylinder(h=rose_height, r1=baserad, r2=toprad, center=true);
cylinder(h=rose_height, r1=baserad-shell_thickness, r2=toprad-shell_thickness, center=true);
}

height_of_head = (rose_height-(adapter_height/2));

translate([0,0,-(rose_height-(adapter_height/2))]){
    difference(){
    cylinder(h=adapter_height, r=baserad, center=true);
        cylinder(h=adapter_height, r=4, center=true);
    }
}

sr = toprad+(shell_thickness/2);

translate([0,0,0]){
    difference(){ // diff 0
    difference(){ //diff1
        difference(){ //diff 2
        sphere(sr);
        sphere(sr-3);
        } //diff 2
    translate([0,0,10]){ //t2
        rotate([180,0,0]){ //r
        cylinder(h=height_of_head+20, r=toprad+10);
        } //r
} //t2
} //difference 1


num_holes=15;
interval = abs(360/num_holes);

r1 = 10;
for (i=[0:interval:359]) {
    translate([r1*cos(i),r1*sin(i),height_of_head])
        cylinder(d=1.5, h=10);
}

r2 = 15;
for (i=[0:interval:359]) {
    translate([r2*cos(i),r2*sin(i),height_of_head-5])
        cylinder(d=1.5, h=10);
}

r3 = 5;
for (i=[0:interval:359]) {
    translate([r3*cos(i),r3*sin(i),height_of_head])
        cylinder(d=1.5, h=10);
}

translate([0,0,height_of_head])
        cylinder(d=1.5, h=10);

} //diff 0 
} //translate