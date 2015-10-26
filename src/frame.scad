base_plate(size = [7,5], grid_spacing = 15, material_thickness = 3, edge_width = 5, finger_length = 5);

module base_plate(size, grid_spacing, material_thickness, edge_width, finger_length) {
    difference() {
        //outer dimensions
        square ( size = [ (size[0] + 1) * grid_spacing + material_thickness + 2*edge_width
                        , (size[1] + 1) * grid_spacing + material_thickness + 2*edge_width
                        ]
               , center = true
               );
        
        //inner window
        square ( size = [ (size[0] + 1) * grid_spacing - material_thickness - 2*edge_width
                        , (size[1] + 1) * grid_spacing - material_thickness - 2*edge_width
                        ]
               , center = true
               );
        
        //vertical fingers
        for (x = [-(size[0] + 1)*grid_spacing/2, (size[0] + 1)*grid_spacing/2]) {
            for (y = [(-size[1] + 1)*grid_spacing/2 : grid_spacing : (size[1] - 1)*grid_spacing/2]) {
                translate([x,y])
                square(size = [material_thickness,finger_length], center = true);
            }
        }
        
        //horizontal fingers
        for (y = [-(size[1] + 1)*grid_spacing/2, (size[1] + 1)*grid_spacing/2]) {
            for (x = [(-size[0] + 1)*grid_spacing/2 : grid_spacing : (size[0] - 1)*grid_spacing/2]) {
                translate([x,y])
                square(size = [finger_length, material_thickness], center = true);
            }
        }
    }
}