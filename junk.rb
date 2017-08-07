# coding: utf-8
require "radiko/radiko"
include Radiko

def c(channel, wday)
  Radiko::Radiko.new(channel, last_wday(wday + 1, 1, 0)).astr(channel)
end

def junk(title, wday)
  print title, "\n",
        c("TBS", wday), " ",
        c("RBC", wday), " ",
        c("CRK", wday), " ",
        c("RKB", wday), " ",
        c("HBC", wday), " ",
        "\n\n"
end

junk("伊集院光・深夜の馬鹿力", 1)
junk("爆笑問題カーボーイ", 2)
junk("山里亮太の不毛な議論", 3)
junk("おぎやはぎのメガネびいき", 4)
junk("バナナマンのバナナムーンGOLD", 5)
