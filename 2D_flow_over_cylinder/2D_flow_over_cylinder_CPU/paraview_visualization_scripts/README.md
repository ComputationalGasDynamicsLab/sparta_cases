To use ParaView to post-process the surface and grid dump files from SPARTA,
we need to use `surf2paraview` and `grid2paraview` provided by SPARTA.
The details is discussed in this [manual page](https://sparta.github.io/doc/Section_howto.html#howto_5).

To convert SPARTA grid dump files to ParaView file, we need to do:
```
pvpython grid2paraview.py grid_description.txt flow_result -r grid.*.data
```
For this user can simply type the following command in terminal:
```
./grid_conversion.sh
```

The processing of surface dump files is similar.

To have `pvpython`, users can download the `ParaView` [binary file](https://www.paraview.org/download/) 
and put into some directory, and then use the `pvpython` file located in the
`ParaView_binary_folder/bin/` directory.
