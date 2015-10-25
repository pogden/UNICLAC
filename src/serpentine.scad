// Serpentine Spring
// =================
// Creates a 2d pattern for a serpentine spring, centered on the origin
// with ends in the X axis direction.
//
// Parameters
// ----------
// w - width
// n - number of meaders
// a - space between meanders
// b - length of span beams
// l - total length, including en

module serpentine_spring( w = 2, n = 6, a = 5, b = 30, l = 100) {
    
    // span beams
    for( i = [ -n/2 + 1 : 1 : n/2 - 1] ) {
        translate([a*i, 0])
            square([w, b], center = true);
    }
    
    $fs = 0.01;
    
    // connectors
    for ( j = [0,180]) {
        rotate( a = j, v = [0,0,1] )
        for ( i = [ -(n-1)/2 : 2 : (n-1) / 2 ]) {
            translate([ i*a, b / 2])
            half_annulus(major_d = a + w, minor_d = a - w);
        }
    }
    
    // final spans
    for(i = [-1, 1])
    translate([0.5*a*n*i, -i*(a + b)* 0.25])
    square (size  = [w, (b-a)/2 + 0.001], center = true);
    
    // final bends
    translate([ a * (n/2+ 0.5), - a/2])
    rotate( a = 90, v = [0,0,1])
    quarter_annulus( major_d = a+w, minor_d = a-w);
    
    translate([- a * (n/2+ 0.5),  a/2])
    rotate( a = 270, v = [0,0,1])
    quarter_annulus( major_d = a+w, minor_d = a-w);
    
    //ends
    for (i = [-1,1])
    translate([i*((l/2) - 0.25*(l - a*(n+1))), 0])
    square( size = [0.5*(l - a*(n+1)), w], center = true);
    
//    translate([0,w*2])
//    square(size = [l, w], center = true);
    
}

module annulus (major_d, minor_d) {
    difference() {
        circle( d = major_d, center = true);
        circle( d = minor_d, center = true);
    }
}

// upper half
module half_annulus(major_d, minor_d) {
    difference() {
        annulus(major_d = major_d, minor_d = minor_d);
        translate([0, - major_d / 2,])
            square (size = major_d, center = true);
    }
}

module quarter_annulus(major_d, minor_d) {
    intersection() {
        annulus(major_d = major_d, minor_d = minor_d);
        square (size = major_d, center = false);
    }
}

serpentine_spring( a = 5, b = 43, n = 6, l = 50);
for (i = [-1, 1]) {
    translate( [i*27.5, 0])
    difference() {
        square(size = [15,7.5], center = true);
        square (size = [5,3], center = true);
    }
}
$fs = 0.01;
//quarter_annulus( major_d = 10, minor_d = 5);