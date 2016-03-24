mainDir = getDirectory("Choose a main directory ");
mainList = getFileList(mainDir); 
for (i=0; i<mainList.length; i++) {  // for loop to parse through names in main folder
     if(endsWith(mainList[i], "/")){   // if the name is a subfolder...
		
			print(mainList[i]);
			
          subDir = mainDir + mainList[i];
          subList = getFileList(subDir);

           for (j=0; j<subList.length; j++) {  // for loop to parse through names in subfolder

              //print(subList[j]);

          }
     }
} 