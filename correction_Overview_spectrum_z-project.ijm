dir1 = getDirectory("Choose Source Directory containing single tiles as tiff-files");
dir2 = getDirectory("Choose Directory for corrected tiles and stitched overview");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	//run("Spectrum");
	run("Z Project...", "start=1 stop=39 projection=[Max Intensity]");
	run("Green");
   	run("Enhance Contrast", "saturated=0.35");
   	run("RGB Color");
   	run("Scale...", "x=0.2 y=0.2 width=530 height=547 interpolation=Bilinear average create title=MAX_IP-diff_cell_number-test_DIV1S-01-1.czi");
  	saveAs("Tiff", dir2+list[i]+"_corr_no_spectr");
   close();
   close();
   for (k=1; k<=5; k++) {
   run("Collect Garbage");
}
}
/**
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
