# Cookbook Name:: sbp_emet
# Attribute:: default
#
# Copyright 2014, Matthijs Wijers
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['emet']['package_name'] = 'EMET 5.5'
default['emet']['url']          = 'http://download.microsoft.com/download/8/E/E/8EEFD9FC-46B1-4A8B-9B5D-13B4365F8CA0/EMET%20Setup.msi'
default['emet']['checksum']     = '4c75ccfad0d480d510385f6c1e48c815211db64feefa9be18ad55772028c581d'
default['emet']['config_path']  = "C:/Program Files (x86)/#{node['emet']['package_name']}/deployment"

# Set default mitigation options
default['emet']['mitigation']['DEP']           = 'true'
default['emet']['mitigation']['SEHOP']         = 'true'
default['emet']['mitigation']['NullPage']      = 'true'
default['emet']['mitigation']['HeapSpray']     = 'true'
default['emet']['mitigation']['EAF']           = 'true'
default['emet']['mitigation']['EAF+']          = 'false'
default['emet']['mitigation']['MandatoryASLR'] = 'true'
default['emet']['mitigation']['BottomUpASLR']  = 'true'
default['emet']['mitigation']['LoadLib']       = 'true'
default['emet']['mitigation']['MemProt']       = 'true'
default['emet']['mitigation']['Caller']        = 'true'
default['emet']['mitigation']['SimExecFlow']   = 'true'
default['emet']['mitigation']['StackPivot']    = 'true'
default['emet']['mitigation']['ASR']           = 'false'

# Set default application settings
default['emet']['exploit_action'] = 'StopProgram'
default['emet']['advanced_settings'] = {
  'DeepHooks' => 'False',
  'AntiDetours' => 'True',
  'BannedFunctions' => 'True'
}

# Set default system settings
default['emet']['system_settings'] = {
  'DEP' => 'Application Opt In',
  'SEHOP' => 'Application Opt In',
  'ASLR' => 'Application Opt In',
  'Pinning' => 'Disabled'
}

# Set default reporting settings
default['emet']['reporting_settings'] = {
  'Telemetry' => 'False',
  'TrayIcon' => 'True',
  'EventLog' => 'True'
}

#
# Set default process configuration for individual processes
#

# Acrobat Writer
default['emet']['process']['acrobat']['path'] = '*\Adobe\Acrobat*\Acrobat\Acrobat.exe'
default['emet']['process']['acrobat']['mitigations'] = {
  'EAF' => 'False',
  'EAF+' => 'False'
}

# Acrobat Reader
default['emet']['process']['acrobatreader']['path'] = '*\Adobe\Reader*\Reader\AcroRd32.exe'
default['emet']['process']['acrobatreader']['mitigations'] = {
  'EAF' => 'False',
  'EAF+' => 'False'
}

# MS Visual Studio
default['emet']['process']['devenv']['path'] = '*\devenv.exe'
default['emet']['process']['devenv']['mitigations'] = {
  'EAF' => 'False'
}

# Dropbox
default['emet']['process']['dropbox']['path'] = '*\dropbox.exe'
default['emet']['process']['dropbox']['mitigations'] = {
  'EAF' => 'False'
}

# Internet Explorer
default['emet']['process']['iexplore']['path'] = '*\iexplore.exe'
default['emet']['process']['iexplore']['mitigations'] = {
  'EAF' => 'False',
  'DEP' => 'False',
  'SEHOP' => 'False'
}

# Java
default['emet']['process']['java']['path'] = '*\Java\jre*\bin\java.exe'
default['emet']['process']['java']['mitigations'] = {
  'Heapspray' => 'False'
}
default['emet']['process']['javaw']['path'] = '*\Java\jre*\bin\javaw.exe'
default['emet']['process']['javaw']['mitigations'] = {
  'Heapspray' => 'False'
}
default['emet']['process']['javaws']['path'] = '*\Java\jre*\bin\javaws.exe'
default['emet']['process']['javaws']['mitigations'] = {
  'Heapspray' => 'False'
}

# MS Lync
default['emet']['process']['lync']['path'] = '*\office1*\lync.exe'

# Skype
default['emet']['process']['skype']['path'] = '*\skype.exe'
default['emet']['process']['skype']['mitigations'] = {
  'EAF' => 'False'
}

# Teamviewer
default['emet']['process']['teamviewer']['path'] = '*\teamviewer.exe'

# Firefox
default['emet']['process']['firefox']['path'] = '*\Mozilla Firefox\firefox.exe'

# Foxit Reader
default['emet']['process']['foxit']['path'] = '*\Foxit Reader\foxitreader.exe'

# Google Talk
default['emet']['process']['googletalk']['path'] = '*\Google Talk\googletalk.exe'
default['emet']['process']['googletalk']['mitigations'] = {
  'DEP' => 'False',
  'SEHOP' => 'False'
}

# Google Chrome
default['emet']['process']['chrome']['path'] = '*\Google\Chrome\Application\chrome.exe'
default['emet']['process']['chrome']['mitigations'] = {
  'SEHOP' => 'False'
}

