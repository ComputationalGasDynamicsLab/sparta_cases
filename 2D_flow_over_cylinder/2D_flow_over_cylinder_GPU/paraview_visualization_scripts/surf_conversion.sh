rm -rf ./surf_result
rm -rf surf_result.pvd
pvpython surf2paraview.py ../data.circle surf_result -r ../surface.*.data
