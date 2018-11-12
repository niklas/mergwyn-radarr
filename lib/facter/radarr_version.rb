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
        radarr_version = Facter::Util::Resolution.exec("wget -q https://github.com/Radarr/Radarr/releases/latest -O - | grep -E \/tag\/ | head -1 | sed 's:^.*/v\([0-9\.]*\)\".*:\1:'")
	if radarr_version == ""
	    nil
	else
	    radarr_version
	end
    end
end

