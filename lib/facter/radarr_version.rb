require 'facter'

# Default for non-Linux nodes
#
Facter.add(:radarr_version) do
    setcode do
        nil
    end
end

# Linux
#
Facter.add(:radarr_version) do
    confine :kernel  => :linux
    setcode do
        Facter::Util::Resolution.exec("wget -q https://github.com/Radarr/Radarr/releases/latest -O - | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d ' ' -f 4")
    end
end

