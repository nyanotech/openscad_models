// A second spool holder for ender 3. This replaces the back piece that tightens
// onto the original spool holder.

// TODO - On mine, it fits slightly loose when printed at 0.2 layer height.
// tab_height might need increasing to fix.

spool_width = 90;
wall_thickness = 1.5;

connector_inner = 15.5;
tab_height = 4; // TODO - test increasing tab_height by 0.2?

difference() {
    union() {
        cylinder(h=10, d=40);
        cylinder(h=10 + spool_width, d=(2 * (connector_inner + wall_thickness)));
        translate([0, 0, (10 + spool_width)]) {
            cylinder(h=3, d1=(2 * (connector_inner + wall_thickness)), d2=((2 * (connector_inner + wall_thickness)) + 6));
        }
        for(i = [0 : 60 : 300]) {
            rotate([0, 0, i]) {
                translate([19, 0, 0]) {
                    cylinder(h=10, r=3);
                }
            }
        }
    }
    translate([0, 0, -1]) {
        cylinder(h=spool_width + 15, d=(2 * connector_inner));
    }
}
for(i = [-1, 1]) {
    translate([connector_inner * i, 0, tab_height]) {
        cylinder(h=3, r=2.5);
    }
}
