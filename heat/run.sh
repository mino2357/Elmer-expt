#!/bin/bash

gmsh -3 heat.geo
ElmerGrid 14 2 heat.msh
ElmerSolver case.sif
