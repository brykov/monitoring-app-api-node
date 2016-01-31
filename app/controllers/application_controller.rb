class ApplicationController < ActionController::API

  def stats
    usw = Usagewatch
    render json: {
               uw_diskused: usw.uw_diskused,
               uw_diskused_perc: usw.uw_diskused_perc,
               uw_cpuused: usw.uw_cpuused,
               uw_memused: usw.uw_memused,
               uw_load: usw.uw_load,
               uw_cputop: usw.uw_cputop,
               uw_memtop: usw.uw_memtop,
           }
  end

  def shutdown
    authenticate!
    system('sudo poweroff &')
    render text: 'OK'
  end

  def status
    render text: 'ALIVE'
  end

  private

  def authenticate!
    raise 'Unauthorized' unless params.require('auth_token')=='df351d97acbd7d3f7e8cabfa884315ebb5dc336f4062496c40dacba8222907f72d3e199f79c989fef040ff9b18a3b456d2d4237b3f30ddd07404f7a28c8b29a9'
  end


end
