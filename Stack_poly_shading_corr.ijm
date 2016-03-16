
 
getDimensions( width, height, channels, slices, frames );
isComposite = channels > 1;
 {
  channels = 1;
}
   
for ( f=1; f<=frames; f++ ) {
  Stack.setFrame( f );
  for ( s=1; s<=slices; s++ ) {
    Stack.setSlice( s );
    for ( c=1; c<=channels; c++ ) {
      Stack.setChannel( c );
      run("Polynomial Shading Corrector", "degree_x=2 degree_y=2 regularization=2");
    }
  }
}