sbp_emet Cookbook
=================
This cookbook will install EMET 5.51 and manage the configuration.

Requirements
------------
Windows cookbook

Attributes
----------
To define applications defaults and enable/disable true/false
default['emet']['mitigation']['DEP']           = 'true'

To define process configuration and (optional) include/exclude mitigations
default['emet']['process']['acrobatreader']['path'] = '*\Adobe\Reader*\Reader\AcroRd32.exe'
default['emet']['process']['acrobatreader']['mitigations'] = {
  'EAF' => 'False'
}

Usage
-----
sbp_emet::install
will download EMET 5.51 from Microsoft download and install EMET.

sbp_emet::configure
will setup global system settings and define process

We set the global mitigation for DEP, SEHOP, ASLR to failsafe Opt-In, that way no processes will be under EMET protection unless specific added in the attributes.

License and Authors
-------------------
Authors: Matthijs Wijers and Sander van Harmelen

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
