run("Enhance Contrast", "saturated=0.35");
run("Non-local Means Denoising", "sigma=25 stack");
run("Subtract Background...", "rolling=25 sliding stack");
run("Median...", "radius=8 stack");
//run("8-bit");
run("Bio-Formats Exporter", "save=/home/ip-linux/Documents/For_Externals/forAnnette/3-color-zstack-trial/20x_488_proc.ome.tif compression=Uncompressed");
