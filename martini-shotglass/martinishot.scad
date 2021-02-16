shell=3;
$fn=100;
cylinder(h=10, r1=60, r2=8, center=true);
translate([0,0,30]) cylinder(h=50,r=8,center=true);
difference(){
translate([0,0,30+60]) cylinder(h=90,r1=8, r2=60,center=true);

translate([0,0,30+60]) cylinder(h=90,r1=8-shell, r2=60-shell,center=true);
}