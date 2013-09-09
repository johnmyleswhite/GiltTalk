using Sound

d1, sample_rate, nbits, other = wavread("code/sound.wav")

x = vec(d1)

using Vega

p = plot(x = 1:length(x), y = x, kind = :line)
hidelegend!(p)
