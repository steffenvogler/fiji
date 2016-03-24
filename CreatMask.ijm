path = getArgument;
open(path);
name=getTitle();
print(name);
dir = getDirectory("image");
print(dir);	

save(dir+name+"_Mask.tif");
run("Close All");
eval("script", "System.exit(0);"); 