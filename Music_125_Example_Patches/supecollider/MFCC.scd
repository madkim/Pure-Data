(
o = Server.local.options;
o.numInputBusChannels = 23;
o.sampleRate = 44100;
s.waitForBoot({"-> Server Started!".postln});
s.meter(24,2);
);


// assumes hop of half fftsize, fine
b = Buffer.alloc(s, 1024, 1); // for sampling rates 44100 and 48000

d = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");

(
x = {
var in, fft, array;

    // in = PlayBuf.ar(1, d, BufRateScale.kr(d), 1, 0, 1);
    in = SoundIn.ar(8);
    fft = FFT(b, in);
    array = MFCC.kr(fft);
    array.size.postln;
    Out.kr(0, array);
    // Out.ar(0,Pan2.ar(in));

}.play
)

x.free

c = Bus.new('control', 0, 13);
c.getn(13, { arg val; { val.plot; }.defer });


(
var ms;

w = Window.new("Thirteen MFCC coefficients", Rect(200, 400, 300, 300));

ms = MultiSliderView.new(w, Rect(10, 10, 260, 280));

ms.value_(Array.fill(13, 0.0));
ms.valueThumbSize_(20.0);
ms.indexThumbSize_(20.0);
ms.gap_(0);

w.front;

r = {

inf.do{

c.getn(13, { arg val; { ms.value_(val * 0.9) }.defer });

0.04.wait; // 25 frames per second
};

}.fork;

)

// tidy up
(
r.stop;
b.free;
c.free;
x.free;
w.close;
)