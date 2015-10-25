base_plate(size = [7,5], grid_spacing = 15, material_thickness = 3, edge_width = 5);

module base_plate(size, grid_spacing, material_thickness, edge_width) {
    difference() {
        //outer_dimensions
        square ( size = [ (size[0] + 1) * grid_spacing + material_thickness + 2*edge_width
                        , (size[1] + 1) * grid_spacing + material_thickness + 2*edge_width
                        ]
               , center = true
               );
        //inner_window
        square ( size = [ (size[0] + 1) * grid_spacing - material_thickness - 2*edge_width
                        , (size[1] + 1) * grid_spacing - material_thickness - 2*edge_width
                        ]
               , center = true
               );
    }
}