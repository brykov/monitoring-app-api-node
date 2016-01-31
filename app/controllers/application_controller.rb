class ApplicationController < ActionController::API
  def stats
    usw = Usagewatch
    render json: {
               uw_diskused: usw.uw_diskused,
               uw_diskused_perc: usw.uw_diskused_perc,
               uw_cpuused: usw.uw_cpuused,
               # uw_tcpused: usw.uw_tcpused,
               # uw_udpused: usw.uw_udpused,
               uw_memused: usw.uw_memused,
               uw_load: usw.uw_load,
               # uw_bandrx: usw.uw_bandrx,
               # uw_bandtx: usw.uw_bandtx,
               # uw_diskioreads: usw.uw_diskioreads,
               # uw_diskiowrites: usw.uw_diskiowrites,
               uw_cputop: usw.uw_cputop,
               uw_memtop: usw.uw_memtop,
           }
  end

  def shutdown
    system('sudo poweroff')
  end
end
