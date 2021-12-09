input = getDirectory("Choose_input dir");
output = getDirectory("Choose output dir");
list = getFileList(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]));
			processFolder(input + list[i]);
	}
}	

function batch(input, output){
			run("Image Sequence...", "open=input sort");
			filename = getTitle();
			saveAs("Tiff", output + filename);
			close();
		}

for (d = 0; d < list.length; d++) { 
	batch(input + list[d], output);
}