dir1 = getDirectory("Choose Source Directory containing only tiff z-stacks");
dir2 = getDirectory("Choose Source Directory containing only tiff z-stacks");
list = getFileList(dir1);
setBatchMode(true);

// for multiple channels	
for (i=0; i<list.length; i++) {
	print("opening"+ list[i]);
	print ("with path"+dir1+list[i]);
	showProgress(i, list.length);
	IJ.redirectErrorMessages();
	run("Bio-Formats Windowless Importer", "open=["+dir1+list[i]+"]");
	getDimensions( width, height, channels, slices, frames );
	//run("Z Project...", "start=1 stop="+slices+" projection=[Max Intensity]");
	//save(dir1+list[i]+"_z-project.tiff");
	run("Set Measurements...", "area mean shape stack redirect=None decimal=0");
	for (j=1; j<slices+1; j++) {
		print(slices);
	Stack.setSlice(j);
	run("Duplicate...", "title=[MAX_IP--IP-proliferation brdu-proer zsene number-03stich-Scene-1-TR1-A2-1.czi] channels="+j+"");
	run("Enhance Contrast", "saturated=0.35");
	run("Gamma...", "value=1.10");
	run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=3 mask=*None* fast_(less_accurate)");
	setAutoThreshold("Otsu dark");
	run("Make Binary");
	//run("Watershed");
	run("Open");
	//run("Make Binary");
	rename(list[i]+"slice_"+j);
	run("Analyze Particles...", "size=50.00-200000.00 circularity=0.00-1.00 show=[Overlay Outlines] display exclude clear summarize record in_situ");
	dotIndex = lengthOf(list[i]) - 8;
        n = substring(list[i],0,dotIndex) + "_";  
	save(dir2+n+"seg_Sl"+j+".tiff");
	close();
	selectWindow("Results");
	save(dir2+list[i]+"_result-sl"+j+".txt");
	}
	 for (k=1; k<=5; k++) {
	   run("Collect Garbage");
	}
	selectWindow("Summary");
	//rename(File.getName(dir1)+"summary_final.txt");
	//save(dir1+list[i]+"_summary"+i+".txt");
//	selectWindow("Results");
//	save(dir1+list[i]+"_results.txt");
	}
	save(dir2+File.getName(dir1)+"_summary.txt");