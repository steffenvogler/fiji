if (isOpen("Log")) {
	selectWindow("Log");
    run("Close");
}

getDimensions( width, height, channels, slices, frames );
//name= getTitle();
//run("Duplicate...", "title="+name+"_outline");
//run("Outline");
//selectWindow(name);
//run("Duplicate...", "title="+name+"_center");
//run("Ultimate Points");
//newImage("final", "32-bit black", width, height, slices);
m = width;
n = height;
o = slices;
//imageCalculator("OR create",name+"_outline",name+"_center");
//print("x","	","y","	","z","	","value","	");
number=m*n*o;
print("<index>");
print("<"+number+">");
for (j=0; j<n; j++) {
for (i=0; i<m; i++) {
for (p=1; p<o+1; p++) {
	Stack.setSlice(p);
	v=getPixel(i, j);
	print(i,"	",j,"	","0","	",v);
	 }
     }
     }