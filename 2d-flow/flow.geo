//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0.2, 0.1, 0, 1.0};
//+
Point(3) = {0.3, 0.1, 0, 1.0};
//+
Point(4) = {0.7, 0.1, 0, 1.0};
//+
Point(5) = {1, 0.1, 0, 1.0};
//+
Point(6) = {1.1, 0.2, 0, 1.0};
//+
Point(7) = {1.2, 0.3, 0, 1.0};
//+
Point(8) = {1.2, 0.2, 0, 1.0};
//+
Point(9) = {1.2, 0.1, 0, 1.0};
//+
Point(10) = {1.1, -0, 0, 1.0};
//+
Point(11) = {1, -0.1, 0, 1.0};
//+
Point(12) = {0.7, -0.1, 0, 1.0};
//+
Point(13) = {0.3, -0.1, 0, 1.0};
//+
Point(14) = {0.2, -0.1, 0, 1.0};
//+
Point(15) = {-0.1, -0, 0, 1.0};
//+
Bezier(1) = {15, 1, 2, 3, 4, 5, 6, 7};
//+
Bezier(2) = {7, 8, 9, 10, 11, 12, 13, 14, 1, 15};
//+
Point(16) = {-4, -2, 0, 1.0};
//+
Point(17) = {-4, 3, -0, 1.0};
//+
Point(18) = {10, 3, -0, 1.0};
//+
Point(19) = {10, -2, 0, 1.0};
//+
Line(3) = {16, 19};
//+
Line(4) = {19, 18};
//+
Line(5) = {18, 17};
//+
Line(6) = {17, 16};
//+
Curve Loop(1) = {1, 2};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, 6, 3, 4};
//+
Plane Surface(2) = {2};
//+
BooleanDifference{ Surface{2}; Delete; }{ Surface{1}; Delete; }
//+
Transfinite Curve {6} = 200 Using Progression 1;
//+
Transfinite Curve {5} = 200 Using Progression 1;
//+
Physical Curve("Inlet", 7) = {3};
//+
Physical Curve("Outlet", 8) = {2};
//+
Physical Curve("Wall", 9) = {1, 4};
//+
Physical Curve("OBJ", 10) = {6, 5};
//+
Physical Surface("Fluid", 11) = {2};
