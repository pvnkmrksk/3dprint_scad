clamp_l = 30;
clamp_w = 15;
clamp_t = 7;

thread_od = 2.65;//2.83
thread_pos = clamp_l + clamp_t -5 ;
$fn =30;

difference(){
linear_extrude(clamp_w )difference(){
    difference(){
        square(clamp_l+clamp_t);
        translate([clamp_t,clamp_t])square(clamp_l);
    }


}


{
#translate([thread_pos, 0,clamp_w/2])rotate([-90,0,0])#cylinder(d = thread_od, h = clamp_t);
translate([ 0,thread_pos,clamp_w/2])rotate([0,90,0])#cylinder(d = thread_od, h = clamp_t);
}
}