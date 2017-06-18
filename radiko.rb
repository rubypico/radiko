# coding: utf-8
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
    "http://radiko.jp/share/?sid=#{@channel}&t=#{time_url}"
  end
  
  def astr(title)
    AttrString.new(title, link: url)
  end
end

# prev_week
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

