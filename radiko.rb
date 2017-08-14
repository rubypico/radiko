# coding: utf-8
module Radiko
  class Radiko
    # channel
    # TBS .. TBSラジオ
    # RN1 .. ラジオNIKKEI第1
    # RN2 .. ラジオNIKKEI第2
    # RBC .. RBCiラジオ
    # CRK .. ラジオ関西
    # RKB .. RKBラジオ
    # HBC .. HBCラジオ
    #
    # time
    # Timeオブジェクト
    def initialize(channel, time = Time.now)
      @channel = channel
      @time = time
    end

    def time_url
      sprintf(
        "%04d%02d%02d%02d%02d%02d",
        @time.year,
        @time.month,
        @time.day,
        @time.hour,
        @time.min,
        @time.sec
      )
    end

    def url
      "radiko://radiko.jp/share/?sid=#{@channel}&t=#{time_url}"
    end

    def astr(title)
      AttrString.new(title, link: url)
    end
  end

  def last_wday(wday, hour, min)
    t = Time.now
    t = Time.local(t.year, t.month, t.day, hour, min)
    if t.wday >= wday
      d = t.wday - wday
    else
      d = t.wday + 7 - wday
    end
    t - d * (24 * 60 * 60)
  end

  def cc(channel, wday, hour, min)
    Radiko.new(channel, last_wday(wday, hour, min)).astr(channel)
  end

  def chan(title, chans, wday, hour, min)
    puts title
    chans.each do |e|
      print cc(e, wday, hour, min), " "
    end
    puts
    puts
  end

  def parse_whm(src)
    r = []
    w, t = src.split(" ")

    week = %w(sun mon tue wed thu fri sat)

    # weekday
    wi = week.index(w.downcase)

    # hour
    hour, min = t.split(":")
    hour = hour.to_i
    if hour >= 24
      hour -= 24
      wi = wi == 6 ? 0 : wi + 1
    end
    r << wi
    r << hour

    # min
    r << min.to_i

    r
  end

  def c(name, whm, chans)
    chan "#{name}(#{whm})", chans, *parse_whm(whm)
  end

end
