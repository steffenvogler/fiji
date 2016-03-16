dir1 = getDirectory("Choose Source Directory containing single tiles as tiff-files");
dir2 = getDirectory("Choose Directory for corrected tiles and stitched overview");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
	//open(dir1+list[i]);
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	print("number of z planes:"+ nSlices);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	//run("Scale...", "x=0.25 y=0.25 width=2844 height=1619 interpolation=Bilinear average create title=P4_GFPrb488_sl101_121106-1.tif");
  	//run("Gamma...", "value=1.30");
  	//run("Enhance Contrast", "saturated=0.35");
  	//setMinAndMax(100, 16000);
  	//run("Flip Vertically");
  	setMinAndMax(0, 941);
  	run("Green");
  	run("Z Project...", "start=1 stop="+ nSlices +" projection=[Average Intensity]");
  	saveAs("Tiff", dir2+list[i]+"_corr");
  	//saveAs("Jpeg", dir2+"P4_GFPrb488_"+i+1);
   close();
   close();
   for (k=1; k<=5; k++) {
   run("Collect Garbage");
}
}