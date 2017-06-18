# coding: utf-8
require "radiko/radiko"

def c(channel, wday)
  Radiko.new(channel, last_wday(wday + 1, 1, 0)).astr(channel)
end

def ann(title, wday)
  print title, "\n", 
        c("LFR", wday), " ",
        c("CBC", wday), " ",
        c("RNB", wday), " ",
        c("MRT", wday), " ",
        c("YBC", wday), " ",
        c("MRO", wday), " ",
        "\n\n"
end

ann("菅田将暉", 1)
ann("星野源", 2)
ann("ＡＫＢ４８", 3)
ann("ナインティナイン岡村隆史", 4)
ann("三代目J Soul Brothers 山下健二郎", 5)
ann("オードリー", 6)
