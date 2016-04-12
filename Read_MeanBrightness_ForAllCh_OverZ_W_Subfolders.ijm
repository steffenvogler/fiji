mainDir=getArgument;
//mainDir = getDirectory("Choose Source Directory containing only tiff z-stacks");
//mainDir="/Users/Vogler/Documents/Programmierung/server_temp/s01/";
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
setBatchMode(true);
if (isOpen("Log")) {
	selectWindow("Log");
    run("Close");
}
if (isOpen("Results")) {
	selectWindow("Results");
    run("Close");
}

run("Set Measurements...", " mean standard stack redirect=None decimal=2");
print(mainDir);
mainList = getFileList(mainDir); 
for (i=0; i<mainList.length; i++) {
//for (i=0; i<2; i++) { // for loop to parse through names in main folder
     if(endsWith(mainList[i], "/")){   // if the name is a subfolder...
		  //print(mainList[i]);	
          subDir = mainDir + mainList[i];
          subList = getFileList(subDir);
	      for (j=0; j<subList.length; j++) {
	      //Array.sort(subList);
	      	if(matches(subList[j], ".+_rebuild.tiff")) {  // for loop to parse through names in subfolder
	      	print(subDir+subList[j]);
	      	open(subDir+subList[j]);
	      	
getDimensions( width, height, channels, slices, frames );
name= getTitle();
m = width;
n = height;
o = slices;
f = frames;
c = channels;
//print("okay");
for (g=1; g<c+1; g++) {
	 Stack.setChannel(g);
for (p=1; p<o+1; p++) {
	Stack.setSlice(p);
	//run("Enhance Contrast...", "saturated=0.1 normalize"); //Normalizes Intensity in Addition
	run("Measure");
	 }
     }
selectWindow("Results");
save(subDir+subList[j]+"Read_Out.txt");
run("Clear Results");
		  }
		  }
     }
} 

getDateAndTime(year2, month2, dayOfWeek2, dayOfMonth2, hour2, minute2, second2, msec2);

     d_delta=dayOfMonth2-dayOfMonth;	
     h_delta=hour2-hour;
     min_delta=minute2-minute;
     sec_delta=second2-second;
     
     print("Elpased Time: "+d_delta+"d "+h_delta+"h "+min_delta+"min "+sec_delta+"sec");



//run("Set Measurements...", "  mean stack redirect=None decimal=2");



//run("Quit");
    

