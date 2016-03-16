dir = getDirectory("Choose a Directory ");
list = getFileList(dir);
setBatchMode(true);
for (i=0; i<list.length; i++) {
       showProgress(i+1, list.length);
	filename = dir + list[i];
	open(filename);
	print(filename);
	output = exec("tiffsplit " + filename + " " + dir + "output");
	open(dir + "outputaaa.tif");
	open(dir + "outputaab.tif");
	run("Merge Channels...", "c2=outputaab.tif c3=outputaaa.tif create");
	saveAs("TIFF",filename);
	output = exec("del " + dir + "outputaaa.tif");
	output = exec("del " + dir + "outputaab.tif");
	close();
}