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
        Facter::Util::Resolution.exec("wget -q https://github.com/Radarr/Radarr/releases/latest -O - | grep -E \/tag\/ | head -1 | awk -F '[><]' '{print $3}' | cut -d ' ' -f 2 | sed 's/^v//'")
    end
end

