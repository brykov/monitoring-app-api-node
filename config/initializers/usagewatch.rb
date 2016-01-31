module Usagewatch
  def self.uw_diskused_perc
    df = `df --total`
    df.split("\n").last.split(' ')[4].to_f.round(2)
  end
end