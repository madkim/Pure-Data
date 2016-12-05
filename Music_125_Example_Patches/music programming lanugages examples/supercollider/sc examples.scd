// -------------------------------------------------------------- //

// boot the server
s.boot;

// define synthdef
(
SynthDef(\myFirstSynth, {|freq=440|

    Out.ar(0, SinOsc.ar(freq));

}).add;
)

// play the synth
a = Synth(\myFirstSynth, [\freq, 550]);

// change the frequency
a.set(\freq, 600);

// stop the synth
a.free;

// -------------------------------------------------------------- //

// a shortcut
a = { SinOsc.ar(440) }.play;
a.free;

// multiple synths!
a = { SinOsc.ar([440,550,660]).sum() }.play;
a.free;

// functions help
8.collect({|i| i*100 + 100});

a = { SinOsc.ar(8.collect({|i| i*100 + 100})).sum() }.play;
a.free;

// -------------------------------------------------------------- //

// sequencing
(
SynthDef(\mySecondSynth, {|freq=440, amp=0.5, pan=0|

    var sig, env;

    sig = SinOsc.ar(freq);
    π
    env = EnvGen.kr(Env.new([0,1,1,0], [0.0,1,0.0],[1,-1]), doneAction: 2);

    Out.ar(0, Pan2.ar(sig*env, pan));

}).add;
)

// first play it
a = Synth(\mySecondSynth, [\freq, 550]);
a.free

// now play it with a pattern
(
Pbind(
    \instrument, \mySecondSynth,
    \dur, Pseq([1.0, 0.5, 1.5, 0.45], inf),
    \amp, 0.8,
    \freq, Pseq([400, 550, 650, 950]),
).play
)

// now play it with a pattern
(
Pbind(
    \instrument, \mySecondSynth,
    \dur, Prand([0.5, 0.5, 1, 0.33, 0.25], inf),
    \amp, 0.8,
    \freq, Prand([400, 550, 650, 950], inf),
    \pan, Prand([-1,0,1], inf),
).play
)