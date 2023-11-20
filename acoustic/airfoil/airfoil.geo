//+
SetFactory("OpenCASCADE");
//+
Point(1) = {-40, -10, 0, 1.0};
//+
Point(2) = {50, -10, 0, 1.0};
//+
Point(3) = {-40, 20, 0, 1.0};
//+
Point(4) = {50, 20, 0, 1.0};
//+
Point(5) = {3.5, 5.05, 0, 1.0};
//+
Point(6) = {3.7, 5.2, 0, 1.0};
//+
Point(7) = {4.1, 5.2, 0, 1.0};
//+
Point(8) = {4.3, 5.15, 0, 1.0};
//+
Point(9) = {4.4, 5.1, 0, 1.0};
//+
Point(10) = {4.5, 5.0, 0, 1.0};
//+
Point(11) = {3.7, 5.0, 0, 1.0};
//+
Point(12) = {3.85, 4.95, 0, 1.0};
//+
Point(13) = {4.1, 5.0, 0, 1.0};
//+
Point(14) = {4.3, 5.1, 0, 1.0};
//+
Bezier(1) = {5, 6, 7, 8, 9, 10};
//+
Bezier(2) = {5, 11, 12, 13, 14, 10};
//+
Line(3) = {1, 2};
//+
Line(4) = {2, 4};
//+
Line(5) = {4, 3};
//+
Line(6) = {3, 1};
//+
Curve Loop(1) = {5, 6, 3, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {1, -2};
//+
Plane Surface(2) = {2};
//+
BooleanDifference{ Surface{1}; Delete; }{ Surface{2}; Delete; }
//+
Physical Curve("inlet", 7) = {3};
//+
Physical Curve("outlet", 8) = {2};
//+
Physical Curve("side", 9) = {1, 4};
//+
Physical Curve("airfoil", 10) = {6, 5};
//+
Physical Surface("fluid", 11) = {1};
//+
Transfinite Curve {6, 5} = 100 Using Progression 1;
