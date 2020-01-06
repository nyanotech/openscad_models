// A soft(er) cover for vise jaws, held on with magnets.

length = 116.5;
height = 15.5;
slot_width = 4;

// TODO - move magnet down in a future iteration for embedded magnet

magnet_thickness = 2.2;
magnet_dia = 6.2;

shell = 1.6;


thickness = 1;

difference() {
    cube([length + 2*thickness, height + 2*thickness, (slot_width/2) + shell + thickness + magnet_thickness]);
    
    // indent on the back
    translate([thickness, thickness, (slot_width/2) + thickness + magnet_thickness]) {
        cube([length, height, shell]);
    }
    
    // slots on the face
    translate([0, 0, (slot_width / 2)]) {
        translate([0, (height/2) + thickness, 0]) {
            rotate([-135, 0, 0]) {
                cube([length + 2*thickness, slot_width, slot_width]);
            }
        }
        for(i = [10 : (length/2) + thickness - 10 : length]) {
            translate([i, 0, 0]) {
                rotate([0, 135, 0]) {
                    cube([slot_width, height + 2*thickness, slot_width]);
                }
            }
        }
    }
    
    
    // magnet hole
    for(i = [10 : length + thickness - 20 : length]) {
            translate([i, (height/2) + thickness, thickness + (slot_width/2)]) {
                cylinder($fn=120, h = magnet_thickness, d = magnet_dia);
            }
        }
}
