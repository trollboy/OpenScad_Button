

difference(){
    generic_button();
    translate([0,0,1.5]) cylinder(2, 4, 4, false, $fn=360);
}

module generic_button() {
    difference(){
        cylinder(2, 5, 5, false, $fn=360);
        button_holes();
    }
}

module button_holes(){
    
    union(){
        translate([2,2,-1])  cylinder(5, 1, 1, false, $fn=360);
        translate([-2,2,-1])  cylinder(5, 1, 1, false, $fn=360);
        translate([2,-2,-1])  cylinder(5, 1, 1, false, $fn=360);
        translate([-2,-2,-1])  cylinder(5, 1, 1, false, $fn=360);
    }
    
}