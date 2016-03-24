mainDir=getArgument;
//mainDir = getDirectory("Choose Source Directory containing only tiff z-stacks");
//mainDir="/Users/Vogler/Documents/Programmierung/server_temp/s01/";

setBatchMode(true);
if (isOpen("Log")) {
	selectWindow("Log");
    run("Close");
}
print(mainDir);
mainList = getFileList(mainDir); 
for (i=0; i<mainList.length; i++) {  // for loop to parse through names in main folder
     if(endsWith(mainList[i], "/")){   // if the name is a subfolder...
		  //print(mainList[i]);	
          subDir = mainDir + mainList[i];
          subList = getFileList(subDir);
	      Array.sort(subList);
			
           for (j=1; j<subList.length; j++) {  // for loop to parse through names in subfolder
					 //print("subList");
					// print(subList[j]);	
               		showProgress(j, subList.length);
					IJ.redirectErrorMessages();
					run("Bio-Formats Windowless Importer", "open=["+subDir+subList[j]+"]");
					//open(dir1+"/c1/"+list1[i]);
					title=getTitle();
				    print (title);
				    //print (n);
				
				}
			dotIndex = lengthOf(subList[1])-30;
			n = substring(subList[1],0,dotIndex);	
			run("Images to Stack", "name=Stack title=[] use");
			dotIndex2 = lengthOf(mainList[i])-1;
			m = substring(mainList[i],0,dotIndex2);
			save(mainDir+"Stack_"+m+".tiff");
			close();
			//print(m);
     }
} 


z=0;
list = getFileList(mainDir);
for (i=0; i<list.length; i++)
if(endsWith(list[i],".tiff"))
{
	//open(dir1+list[i]);
	run("Bio-Formats Windowless Importer", "open=["+mainDir+list[i]+"]");
	z=z+1;
	}

names = newArray(nImages);
ids = newArray(nImages);
for (i=0; i < ids.length; i++){
        selectImage(i+1);
        ids[i] = getImageID();
        names[i] = getTitle();
        }
         
Array.sort(names);
//print(ids[0] + " = " + names[0]);
//print(ids[1] + " = " + names[1]);
//print(ids[2] + " = " + names[2]);

// adapt channel order if needed

//dotIndex3 = lengthOf(names[1])-8;
//p = substring(names[1],0,dotIndex3);
//print(p);
//print(names[0]);

if (z==1)
      run("Merge Channels...", "c1=["+names[0]+"] create");
   else if (z==2)
       run("Merge Channels...", "c1=["+names[0]+"] c2=["+names[1]+"] create");
   else if (z==3)
       run("Merge Channels...", "c1=["+names[0]+"] c2=["+names[1]+"] c3=["+names[2]+"] create");
   else if (z==4)
       run("Merge Channels...", "c1=["+names[0]+"] c2=["+names[1]+"] c3=["+names[2]+"] c4=["+names[3]+"] create");
   else
	print("Number of Channels is more than 4?");

save(mainDir+"Complete_rebuild.tiff");
close();

run("Quit");
    

