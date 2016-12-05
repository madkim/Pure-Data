<CsoundSynthesizer>
<CsInstruments>

; audio setup
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

instr 1
ifreq = p4
iamp = p5
iatt = 1.0
idec = 0.1
islev = 0.6
irel = 1.5
kEnv madsr iatt, idec, islev, irel 
aOut vco2 iamp, ifreq
out aOut*kEnv
endin

</CsInstruments>
<CsScore>
i 1 0 1 100 1 
i 1 1 1 250 1 
i 1 2 1 300 1 
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
