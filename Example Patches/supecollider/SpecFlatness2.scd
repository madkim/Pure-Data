(
{ // Now try with your own voice
var in, chain;
in = SoundIn.ar([0,1]).mean;
chain = FFT(b, in);
Out.kr(0, [in, SpecFlatness.kr(chain).poll(10, "flatness: ")]);
}.scope;
)