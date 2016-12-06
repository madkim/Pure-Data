
b = Buffer.alloc(s,2048,1);

(
x = {
var in, chain, freq, rq, centroid;

//freq = LFPar.kr(0.3).exprange(100, 1000);
freq = MouseY.kr(1000, 100, 1);

in = Blip.ar(freq, MouseX.kr(1, 100, 1));

chain = FFT(b, in);

centroid = SpecCentroid.kr(chain);

Out.ar(0, in.dup * 0.1);
centroid.poll(10);
}.play(s);
)

x.free;