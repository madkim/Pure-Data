
b = Buffer.alloc(s,2048,1);

(
{ // Example - vary mixture of white noise and pure tone with the mouse
var in, chain, flat, flatdb, flatdbsquish;
in = XFade2.ar(WhiteNoise.ar, SinOsc.ar, MouseX.kr(-1,1));
chain = FFT(b, in);
Out.ar(0, in * 0.1);

flat = SpecFlatness.kr(chain);

flatdb = 10 * flat.log; // Convert to decibels
flatdbsquish = LinLin.kr(flatdb, -45, -1.6, 0, 1).max(-10); // Rescale db roughly to 0...1.

flat.poll(10, "flatness: ");
flatdb.poll(10, "flatness (db): ");

Out.kr(0, [flat, flatdbsquish]);
}.scope;
)