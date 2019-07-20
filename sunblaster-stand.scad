lightThickness = 22;
lightDepth = 10;
lightHeight = 40;
lightAllowance = 0.2;

lightHolderWallThickness = 5;
elevationHeight = 8;
totalHeight = elevationHeight + lightHeight;
footProtrusion = 15;

footWidth = lightThickness + (footProtrusion * 2);

holderWidth = lightThickness + (lightHolderWallThickness * 2);

module holderBody() {
    translate([-lightHolderWallThickness, 0, 0]) {
        cube([holderWidth, lightDepth, lightHeight]);
    }
    
}

module lightSocket() {
    cube([lightThickness + lightAllowance, lightDepth, lightHeight]);
}

module holder() {
    translate([0, 0, elevationHeight]) {
        difference() {
            holderBody();
            lightSocket();
        }
    }
   
}

module base() {
    baseXOffset = -(footProtrusion + lightHolderWallThickness);
    translate([baseXOffset, 0, 0]) {
        cube([holderWidth + footProtrusion * 2, lightDepth, elevationHeight]);
    }
    
}

module stand() {
    union() {
        holder();
        base();
    }
}

stand();

