//+
SetFactory("OpenCASCADE");
//+
n=1.5;
//+
Point(1) = {-1, 0, 0, 1.0};
//+
Point(2) = {1, 0, 0, 1.0};
//+
Point(3) = {1.5, -0.5, 0, 1.0};
//+
Point(4) = {2, 0, 0, 1.0};
//+
Point(5) = {7, 0, 0, 1.0};
//+
Point(6) = {-1, 1, 0, 1.0};
//+
Point(7) = {1, 1, 0, 1.0};
//+
Point(8) = {2, 1, 0, 1.0};
//+
Point(9) = {7, 1, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {6, 7};
//+
Line(3) = {5, 4};
//+
Line(4) = {9, 8};
//+
Line(5) = {6, 1};
//+
Line(6) = {7, 2};
//+
Line(7) = {8, 4};
//+
Line(8) = {9, 5};
//+
Line(9) = {7, 8};
//+
Circle(10) = {2, 3, 4};
//+
Curve Loop(1) = {2, 6, -1, -5};
//+
Surface(1) = {1};
//+
Curve Loop(3) = {9, 7, -10, -6};
//+
Surface(2) = {3};
//+
Curve Loop(5) = {4, 7, -3, -8};
//+
Surface(3) = {5};
//+
Transfinite Curve {5, 6, 7, 8} = 100*n Using Progression 1.0; //0.98;
//+
Transfinite Curve {2, 1} = 100*n Using Progression 1.0;
//+
Transfinite Curve {9, 10} = 50*n Using Progression 1;
//+
Transfinite Curve {4, 3} = 250*n Using Progression 1;
//+
Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
//+
Physical Curve("inlet", 11) = {5};
//+
Physical Curve("outlet", 12) = {8};
//+
Physical Curve("wall", 13) = {1, 10, 3, 4, 9, 2};
//+
Physical Surface("fluid", 14) = {1, 2, 3};
