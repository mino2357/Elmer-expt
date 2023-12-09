//+
s=0.1;
n=1.0;
Point(1) = {0, 0.05, 0, 1.0};
//+
Point(2) = {0, -0.05, 0, 1.0};
//+
Point(3) = {0.1, -0.05, 0, 1.0};
//+
Point(4) = {0.1, 0.05, 0, 1.0};
//+
Point(5) = {-2, -0.05, 0, 1.0};
//+
Point(6) = {-2, 0.05, 0, 1.0};
//+
Point(7) = {0, 3, 0, 1.0};
//+
Point(8) = {0.1, 3, 0, 1.0};
//+
Point(9) = {0, -3, 0, 1.0};
//+
Point(10) = {0.1, -3, 0, 1.0};
//+
Point(11) = {10, -0.05, 0, 1.0};
//+
Point(12) = {10, 0.05, 0, 1.0};
//+
Point(13) = {10, -3, 0, 1.0};
//+
Point(14) = {10, 3, 0, 1.0};
//+
Point(15) = {-2, 3, 0, 1.0};
//+
Point(16) = {-2, -3, 0, 1.0};
//+
Line(1) = {5, 2};
//+
Line(2) = {6, 1};
//+
Line(3) = {7, 1};
//+
Line(4) = {8, 4};
//+
Line(5) = {12, 4};
//+
Line(6) = {11, 3};
//+
Line(7) = {9, 2};
//+
Line(8) = {10, 3};
//+
Line(9) = {15, 6};
//+
Line(10) = {16, 5};
//+
Line(11) = {14, 12};
//+
Line(12) = {13, 11};
//+
Line(13) = {15, 7};
//+
Line(14) = {14, 8};
//+
Line(15) = {13, 10};
//+
Line(16) = {16, 9};
//+
Line(17) = {5, 6};
//+
Line(18) = {7, 8};
//+
Line(19) = {12, 11};
//+
Line(20) = {10, 9};
//+
Line(21) = {2, 1};
//+
Line(22) = {1, 4};
//+
Line(23) = {4, 3};
//+
Line(24) = {3, 2};
//+
Curve Loop(1) = {13, 3, -2, -9};
//+
Surface(1) = {1};
//+
Curve Loop(2) = {18, 4, -22, -3};
//+
Surface(2) = {2};
//+
Curve Loop(3) = {14, 4, -5, -11};
//+
Surface(3) = {3};
//+
Curve Loop(4) = {5, 23, -6, -19};
//+
Surface(4) = {4};
//+
Curve Loop(5) = {12, 6, -8, -15};
//+
Surface(5) = {5};
//+
Curve Loop(6) = {24, -7, -20, 8};
//+
Surface(6) = {6};
//+
Curve Loop(7) = {1, -7, -16, 10};
//+
Surface(7) = {7};
//+
Curve Loop(8) = {2, -21, -1, 17};
//+
Surface(8) = {8};
//+
Transfinite Curve {21, 17, 22, 23, 24, 18, 19, 20} = 100*n Using Progression 1;
//+
Transfinite Curve {10, 7, 8, 12} = 2950*s*n Using Progression 0.99;
//+
Transfinite Curve {3, 4, 9, 11} = 2950*s*n Using Progression 0.99;
//+
Transfinite Curve {5, 6, 14, 15} = 9900*s*n Using Progression 0.997;
//+
Transfinite Curve {1, 2, 13, 16} = 2000*s*n Using Progression 0.985;
//+
Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
//+
Physical Curve("obstacle", 25) = {22, 21, 24, 23};
//+
Physical Curve("Inlet", 26) = {9, 17, 10};
//+
Physical Curve("Outlet", 27) = {11, 19, 12};
//+
Physical Curve("Side", 28) = {14, 18, 13, 16, 20, 15};
//+
Physical Curve("empty", 29) = {7, 8, 6, 5, 4, 3, 1, 2};
//+
Physical Surface("Fluid", 30) = {7, 8, 1, 6, 4, 2, 3, 5};
