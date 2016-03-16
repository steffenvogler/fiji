dir1 = getDirectory("Choose Source Directory containing single tiles as tiff-files");
dir2 = getDirectory("Choose Directory for corrected tiles and stitched overview");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
   run("Grid/Collection stitching", "type=[Positions from file] order=[Defined by image metadata] multi_series_file="+dir1+list[i]+ " fusion_method=[Linear Blending] regression_threshold=0.80 max/avg_displacement_threshold=0.50 absolute_displacement_threshold=3.50 increase_overlap=13 subpixel_accuracy computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
   run("Channels Tool... ");
   Stack.setDisplayMode("color");
   saveAs("Tiff", dir2+list[i]+"_stitched");
   getDimensions( width, height, channels, slices, frames );
isComposite = channels > 1;
 {
  channels = 1;
}
   
for ( f=1; f<=frames; f++ ) {
  Stack.setFrame( f );
  for ( s=1; s<=slices; s++ ) {
    Stack.setSlice( s );
    for ( c=1; c<=channels; c++ ) {
      Stack.setChannel( c );
      run("Polynomial Shading Corrector", "degree_x=2 degree_y=2 regularization=2");
    }
  }
  run("Z Project...", "start=1 stop="+s-1+ " projection=[Max Intensity]");
}
saveAs("Tiff", dir2+list[i]+"_stitched+shading_corrected+project");
}