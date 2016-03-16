dir1 = getDirectory("Choose Source Directory containing multichannel tiff-files with calibration");
dir2 = getDirectory("Choose Destination Montage-Directory");
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
     showProgress(i+1, list.length);
     open(dir1+list[i]);
     title = getTitle();
	run("Make Composite");
	run("Stack to RGB");
	run("Scale Bar...", "width=100 height=15 font=28 color=White background=None location=[Lower Right] bold");
//	save(dir2+title+"merge_scale.tif");
	selectWindow(title);
	close();
	open(dir1+list[i]);
	run("Stack to Images");
	run("Images to Stack", "name=Stack title=[] use keep");
	run("Stack Sorter");
	run("Make Montage...", "columns=4 rows=1 scale=1 first=1 last=4 increment=1 border=10 font=12");
	save(dir2+"Montage_"+title);
     close();
}