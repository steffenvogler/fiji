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
//run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
// Color Thresholder 1.47a
// Autogenerated macro, single images only!
min=newArray(3);
max=newArray(3);
filter=newArray(3);
a=getTitle();
run("HSB Stack");
run("Convert Stack to Images");
selectWindow("Hue");
rename("0");
selectWindow("Saturation");
rename("1");
selectWindow("Brightness");
rename("2");
min[0]=128;
max[0]=134;
filter[0]="stop";
min[1]=0;
max[1]=255;
filter[1]="pass";
min[2]=0;
max[2]=63;
filter[2]="pass";
for (i=0;i<3;i++){
  selectWindow(""+i);
  setThreshold(min[i], max[i]);
  run("Convert to Mask");
  if (filter[i]=="stop")  run("Invert");
}
imageCalculator("AND create", "0","1");
imageCalculator("AND create", "Result of 0","2");
for (i=0;i<3;i++){
  selectWindow(""+i);
  close();
}
selectWindow("Result of 0");
close();
selectWindow("Result of Result of 0");
rename(list[i]);
// Colour Thresholding-------------
saveAs("Jpeg",dir2+list[i]);
   close();
   close();
 //  for (k=1; k<=3; k++) {
   //run("Collect Garbage");
}
