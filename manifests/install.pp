#
class radarr::install {

  $install_path   = $::radarr::install_path
  $package_name   = 'Radarr.Binaries.Mono'
  $package_version = $::radarr_version
  $repository_url = 'https://github.com/Radarr/Radarr/releases/download/'
  $package_source = "${repository_url}/${package_version}/${package_name}.tar.gz"
  $archive_name   = "${install_path}/${package_name}-${package_version}.tar.gz"

  if $radarr::package_manage {
    archive { 'radarr_package_tar':
      path         => $archive_name,
      source       => $package_source,
      user         => $::radarr::user,
      group        => $::radarr::group,
      extract      => true,
      extract_path => $archive_name,
      creates      => $archive_name,
      cleanup      => false,
      #TODO reference to mono
      #require      => Class['mono'],
    }
  }
}
# vim: number tabstop=8 expandtab shiftwidth=2 softtabstop=2
