#
class radarr::service {

  if $radarr::service_manage == true {

    #TODO set user from variable
    #TODO move user setting to drop in
    systemd::unit_file { 'radarr.service':
      enable  => $radarr::service_enable,
      active  => $radarr::service_active,
      content => template('radarr/radarr.service.erb'),
    }
  }
}
# vim: number tabstop=8 expandtab shiftwidth=2 softtabstop=2
