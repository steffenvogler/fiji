dir1 = getDirectory("Choose Source Directory containing single tiles as tiff-files");
dir2 = getDirectory("Choose Directory for corrected tiles and stitched overview");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
open(dir1+list[i]);
run("8-bit Color", "number=256");
//run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
setThreshold(30, 255);
setAutoThreshold("Otsu dark");
run("Convert to Mask");
run("Close-");
run("Invert");
saveAs("Jpeg",dir2+list[i]);
   close();
 //  close();
 //  for (k=1; k<=3; k++) {
   //run("Collect Garbage");
}
