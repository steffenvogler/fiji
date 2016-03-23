if (isOpen("Results")) {
	selectWindow("Results");
    run("Close");
}

//run("Set Measurements...", "  mean stack redirect=None decimal=2");
run("Set Measurements...", " mean standard stack redirect=None decimal=2");
getDimensions( width, height, channels, slices, frames );
name= getTitle();
m = width;
n = height;
o = slices;
f = frames;
//print("okay");
for (g=1; g<f+1; g++) {
	 Stack.setFrame(g);
for (p=1; p<o+1; p++) {
	Stack.setSlice(p);
	run("Enhance Contrast...", "saturated=0.1 normalize"); //Normalizes Intensity in Addition
	run("Measure");
	 }
     }
selectWindow("Results");
save("/home/ip-linux/Documents/For_Externals/forSheik_Mike/Results_Mean_SD_BrightnessOverZAndt_normalized.txt");
//save("/home/ip-linux/Documents/For_Externals/forSheik_Mike/Results_Mean_SD_BrightnessOverZAndt.txt");

    