#!/usr/bin/env ruby

#mac_firmware_enabled.rb
require 'facter'
Facter.add(:mac_firmware_enabled) do
  confine :kernel => "Darwin"
  setcode do
      output = Facter::Util::Resolution.exec("/usr/sbin/firmwarepasswd -check")
      if output == "Password Enabled: Yes"
        "Set"
      else
        "Not Set"
    end
end
end
