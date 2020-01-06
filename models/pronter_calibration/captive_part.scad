dia = 15;
gap = 1;
height = 10;
cone_height = 5;


module spool(height, dia, cone_height) {
    cylinder($fn = 120, h = height, d = (dia - 2*cone_height));
    cylinder($fn = 120, h = cone_height, d1 = dia, d2 = dia - 2*cone_height);
    translate([0, 0, height - cone_height]) {
        cylinder($fn = 120, h = cone_height, d1 = dia - 2*cone_height, d2 = dia);
    }
}

difference() {
    translate([-10, -10, 0]) {
        cube([20, 20, height]);
    }
    difference() {
        spool(height, dia, cone_height);
        spool(height, dia - gap, cone_height );
    }
}
