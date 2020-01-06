// A case for a yubikey.

// TODO - my first print of this broke at the badge-holder-hole, don't trust
// this thing to not lose your yubikey.

width = 18.5;
length = 33.8;
thickness = 3.75;
plug_thickness = (thickness - 0.5);
head_width = 13;

button_height = 15;
button_hole_diameter = 15;

key_margin = 0;
key_hole_dia = 3.5;
key_hole_width = 13;
top_margin = 4;

top_fillet_radius = 3;
bottom_fillet_radius = 1.5;
part_thickness = 0.8;



center_y = ((width / 2) + part_thickness);

difference() {
    cube([
        width + 2 * part_thickness,
        thickness + 2 * part_thickness,
        length + part_thickness + key_margin + key_hole_dia + top_margin
    ]);
    // main opening
    translate([part_thickness, part_thickness, part_thickness]) {
        cube([width, thickness, length + part_thickness + 20]);
    }
    // plug opening
    translate([center_y - (head_width / 2), part_thickness + (thickness - plug_thickness), 0]) {
        cube([head_width, plug_thickness, 10]);
    }
    // button hole
    translate([center_y, 0, part_thickness + button_height]) {
        rotate([-90, 0, 0]) {
            cylinder(h=part_thickness, d=button_hole_diameter, $fn=45);
        }
    }
    // keyring hole
    for(i = [-1, 1]) {
        translate([
            center_y + (i * (key_hole_width-key_hole_dia) / 2),
            0,
            length + part_thickness + key_hole_dia / 2 + key_margin
        ]) {
            rotate([-90, 0, 0]) {
                cylinder(h=2 * part_thickness + thickness, d=key_hole_dia, $fn=45);
            }
        }
    }
    translate([((width-key_hole_width+key_hole_dia)/2+part_thickness), 0, length + part_thickness + key_margin]) {
        cube([key_hole_width - key_hole_dia, 2 * part_thickness + thickness, key_hole_dia]);
    }
    // top fillet left
    translate([0, 0, length + part_thickness + key_margin + key_hole_dia + top_margin - top_fillet_radius]) {
        difference() {
            cube([top_fillet_radius, (2 * part_thickness) + thickness, top_fillet_radius]);
            translate([top_fillet_radius, 0, 0]) {
                rotate([-90, 0, 0]) {
                    cylinder(r=top_fillet_radius, h=(2 * part_thickness) + thickness, $fn=45);
                }
            }
        }
    }
    // top fillet right
    translate([
        (2 * part_thickness) + width - top_fillet_radius,
        0,
        length + part_thickness + key_margin + key_hole_dia + top_margin - top_fillet_radius
    ]) {
        difference() {
            cube([top_fillet_radius, (2 * part_thickness) + thickness, top_fillet_radius]);
            rotate([-90, 0, 0]) {
                cylinder(r=top_fillet_radius, h=(2 * part_thickness) + thickness, $fn=45);
            }
        }
    }
    // top fillet slot
    translate([
        0,
        part_thickness,
        length + part_thickness + key_margin + key_hole_dia + top_margin - top_fillet_radius
    ]) {
        cube([
            width + 2*part_thickness,
            thickness, 
            top_fillet_radius
        ]);
    }
    // bottom fillet left
    translate([0, 0, 0]) {
        difference() {
            cube([bottom_fillet_radius, (2 * part_thickness) + thickness, bottom_fillet_radius]);
            translate([bottom_fillet_radius, 0, bottom_fillet_radius]) {
                rotate([-90, 0, 0]) {
                    cylinder(r=bottom_fillet_radius, h=(2 * part_thickness) + thickness, $fn=45);
                }
            }
        }
    }
    // bottom fillet right
    translate([(2 * part_thickness) + width - bottom_fillet_radius, 0, 0]) {
        difference() {
            cube([bottom_fillet_radius, (2 * part_thickness) + thickness, bottom_fillet_radius]);
            translate([0, 0, bottom_fillet_radius]) {
                rotate([-90, 0, 0]) {
                    cylinder(r=bottom_fillet_radius, h=(2 * part_thickness) + thickness, $fn=45);
                }
            }
        }
    }
}