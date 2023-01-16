$fn = 30;

base_l = 38;
base_b = 38;
base_h = 2;
base_hole_od=2.4;
base_hole_off_r = 20;

base_rim_h=5;
base_rim_t=4.3;

mount_l = 22;
mount_b = 22;
mount_h = 13;
mount_t = 2.8;

spring_od = 5;
spring_h = 1.8;     
spring_off_r = 9;


lens_od = 16;




//mount +  base + holes - lens
difference(){


    //mount -mountOffset +  base + holes

    difference(){
    
    //mount + base + holes
    union()
    {
        
        //mount with spring holes
        translate([0,0,base_h])difference(){
        
        //mount cube
        translate([0,0,mount_h/2])cube([mount_l,mount_b,mount_h],center=true);
        
        
        //spring mount holes
        
        translate([0,0,mount_h-spring_h])holeDriller(hole_od=spring_od, hole_h=spring_h+1,off_r=spring_off_r, angle_start=45);
        }
        
       
       //base with holes
       difference(){
        //base
        translate([0,0,base_h/2])cube([base_l,base_b,base_h],center=true);
        
        //base mount holes
        translate([0,0,-0.5])holeDriller(hole_od=base_hole_od, hole_h=base_h+1,off_r=base_hole_off_r, angle_start=45);
        }
        
        }


        //mount offset diff cube
        mount_offset_h=base_h+mount_h-mount_t;
        
         translate([0,0,mount_offset_h/2]) cube([mount_l-2*mount_t,mount_b-2*mount_t,mount_offset_h+1],center=true);
    }



// lens diff cylinder
cylinder(mount_h*2,d=lens_od);
}



/////////////////////////////////////////////////
module holeDriller(hole_od, hole_h,off_r, angle_start){

        for(i = [angle_start:90:360]){
            rotate([0,0,i])
            translate([off_r,0,0])cylinder(hole_h,d=hole_od);
         }            
    }


