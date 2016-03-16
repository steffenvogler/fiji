dir = getDirectory("Choose a Directory ");
list = getFileList(dir);
setBatchMode(true);
for (i=0; i<list.length; i++) {
       showProgress(i+1, list.length);
	filename = dir + list[i];
	open(filename);
	print(filename);
	run("Set Measurements...", "area mean limit add redirect=None decimal=3");
	run("8-bit");
	setAutoThreshold("Otsu dark");
	run("Analyze Particles...", "size=0-Infinity circularity=0.00-1.00 show=Nothing exclude add");
	roiManager("Multi Measure");