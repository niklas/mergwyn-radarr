#
class radarr::install(
  $package_version = "0.2.0.1450"
) {
  $package_name    = 'Radarr.develop'
  $install_path    = $::radarr::install_path
  $extract_dir     = "${install_path}/Radarr-${package_version}"
  $creates         = "${extract_dir}/Radarr"
  $link            = "${install_path}/Radarr"
  $repository_url  = 'https://github.com/Radarr/Radarr/releases/download/'
  $package_source  = "${repository_url}/v${package_version}/${package_name}.${package_version}.linux.tar.gz"
  $archive_name    = "${package_name}-${package_version}.linux.tar.gz"
  $archive_path    = "${install_path}/${archive_name}"

  if $radarr::package_manage {
    file { $extract_dir:
      ensure => directory,
      owner  => $::radarr::user,
      group  => $::radarr::group,
    }

    archive { $archive_name:
      path         => $archive_path,
      source       => $package_source,
      extract      => true,
      extract_path => $extract_dir,
      creates      => $creates,
      cleanup      => true,
      user         => $::radarr::user,
      group        => $::radarr::group,
      #TODO reference to mono
      #require      => Class['mono'],
      notify       => Service['radarr.service']
    }
    file { $link:
      ensure    => 'link',
      target    => $creates,
      subscribe => Archive[$archive_name],
    }
    exec {'radarr_tidy':
      cwd         => $install_path,
      path        => '/usr/sbin:/usr/bin:/sbin:/bin:',
      command     => "ls -dtr ${link}-* | head -n -${radarr::keep} | xargs rm -rf",
      #onlyif      => "test $(ls -d ${link}-* | wc -l) -gt ${radarr::keep}",
      refreshonly => true,
      subscribe   => Archive[$archive_name],
    }
  }
}
# vim: number tabstop=8 expandtab shiftwidth=2 softtabstop=2
