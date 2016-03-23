dir1 = getDirectory("Choose Source Directory containing only tiff z-stacks");
list = getFileList(dir1);
setBatchMode(true);
/*for (i=0; i<list.length; i++) {
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	getDimensions( width, height, channels, slices, frames );
	run("Split Channels");
	close();
	run("Z Project...", "start=1 stop="+slices+" projection=[Max Intensity]");
	save(dir1+list[i]+"_z-project.tiff");
	run("Enhance Contrast", "saturated=0.35");
	run("Gamma...", "value=1.10");
	run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=3 mask=*None* fast_(less_accurate)");
	setAutoThreshold("Otsu dark");
	run("Make Binary");
	run("Watershed");
	run("Open");
	//run("Make Binary");
	run("Analyze Particles...", "size=50.00-2000.00 circularity=0.00-1.00 show=[Overlay Outlines] display exclude clear summarize record in_situ");
	save(dir1+list[i]+"segmented.tiff");
	selectWindow("Summary");
	save(dir1+list[i]+"_summary"+i+".txt");
	selectWindow("Results");
	save(dir1+list[i]+"_results.txt");
	}
*/	
// for multiple channels	
for (i=0; i<list.length; i++) {
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	getDimensions( width, height, channels, slices, frames );
	run("Z Project...", "start=1 stop="+slices+" projection=[Max Intensity]");
	save(dir1+list[i]+"_z-project.tiff");
	for (j=1; j<4; j++) {
	Stack.setChannel(j);
	run("Duplicate...", "title=[MAX_IP--IP-proliferation brdu-proer zsene number-03stich-Scene-1-TR1-A2-1.czi] channels="+j+"");
	run("Enhance Contrast", "saturated=0.35");
	run("Gamma...", "value=1.10");
	run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=3 mask=*None* fast_(less_accurate)");
	setAutoThreshold("Otsu dark");
	run("Make Binary");
	run("Watershed");
	run("Open");
	//run("Make Binary");
	run("Analyze Particles...", "size=50.00-2000.00 circularity=0.00-1.00 show=[Overlay Outlines] display exclude clear summarize record in_situ");
	save(dir1+list[i]+"_segmented_Ch"+j+".tiff");
	close();
	}
	selectWindow("Summary");
	//save(dir1+list[i]+"_summary"+i+".txt");
//	selectWindow("Results");
//	save(dir1+list[i]+"_results.txt");
	}
	selectWindow("Summary");
	save(dir1+"summary_final.txt");