dir = getDirectory("Choose a source directory ");
setBatchMode(true);
count = 0;
countFiles(dir);
n = 0;
processFiles(dir);

function countFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            countFiles(""+dir+list[i]);
        else
            count++;
    }
}

function processFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            processFiles(""+dir+list[i]);
        else {
            showProgress(n++, count);
            path = dir+list[i];
            processFile(path);
        }
    }

function processFile(path) {
    if (endsWith(path, ".tif")) {
        open(path);
        title=getTitle();
        len = lengthOf(title);
        lenPath = lengthOf(path);
        path = substring(path, 0, lenPath-len);
        for(i=1;i<=26; i++){
          newTitle = substring(title, 0, len-4)+" Slice "+i;
          newPath = path+newTitle;
          run("Select All");
          setSlice(i);
          run("Copy");
          newImage("Untitled", "8-bit Black", 1024, 706, 1);
          run("Paste");
//         setMinAndMax(1,45);
//          call("ij.ImagePlus.setDefault16bitRange",8); 
          run("Green");
          run("RGB Color");
      run("Enhance Contrast", "saturated=0.00001");
// 	run("Green");  
 //	run("RGB Color");
	saveAs("JPEG",newPath);
          close();
        }
      close();
    }
} 