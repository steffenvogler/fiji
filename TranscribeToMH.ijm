dir1 = getDirectory("Choose Source Directory containing single tiles as tiff-files");
dir2 = getDirectory("Choose Directory for corrected tiles and stitched overview");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	print("number of z planes:"+ nSlices);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	run("MetaImage... ", "save="+dir2+list[i]+".mhd");
  	//saveAs("Tiff", dir2+list[i]+"_corr");
  	//saveAs("Jpeg", dir2+"P4_GFPrb488_"+i+1);
   //close();
   close();
   for (k=1; k<=5; k++) {
   run("Collect Garbage");
}
}