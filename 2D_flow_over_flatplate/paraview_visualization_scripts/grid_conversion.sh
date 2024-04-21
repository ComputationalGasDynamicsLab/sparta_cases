rm -rf ./grid_result
rm -rf grid_result.pvd
pvpython grid2paraview.py grid_description.txt grid_result -r ../grid.*.data
