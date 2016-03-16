//dir1 = getDirectory("Choose Source Directory containing only tiff z-stacks of vessel-structures ");
//dir2 = getDirectory("Choose Destination Result-Directory");
//list = getFileList(dir1);
//setBatchMode(true);
//for (i=0; i<list.length; i++) {
 //    showProgress(i+1, list.length);
   //  open(dir1+list[i]);
   //  title = getTitle();
	run("Gamma...", "value=1.40 stack");
	run("Smooth (3D)", "method=Gaussian sigma=0.750 use");
	save(dir2+title+"_smoothed.tif");
	run("Auto Threshold", "method=Otsu white stack");
	run("Particles8 ", "white show=Particles filter minimum=30 maximum=9999999 display redirect=None");
	save(dir2+title+"_smoothed_binary.tif");
	run("Skeletonize (2D/3D)");
	save(dir2+title+"_smoothed_binary_skeletonized.tif");
	run("Analyze Skeleton (2D/3D)", "prune=[shortest branch]");
	saveAs("Results", dir2+title+".csv");
    // close();
}

