#
# Cookbook Name:: jade
# Recipe:: default
#
# Copyright 2013, Chendil Kumar Manoharan
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
number=1.times.map{ 1000 +  Random.rand(11) }

template "/opt/novell/idm/Designer//NOVLSOAPBASE.properties" do
  source "NOVLSOAPBASE.properties.erb"
  owner "root" 
  mode "0644"  
end
execute "Create SOAP Driver" do
 user "root" 
 command "/bin/sh -c 'ulimit -n 4096; LD_LIBRARY_PATH=/opt/novell/idm/Designer/plugins/com.novell.core.iconeditor_4.0.0.201206110753/os/linux:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/x86:/opt/novell/idm/Designer/plugins/com.novell.core.jars_4.0.0.201206110753/os/linux/gcc3:$LD_LIBRARY_PATH \"/opt/novell/idm/Designer//Designer\" -nosplash -nl en -application com.novell.idm.rcp.DesignerHeadless -command deployDriver -p \"/opt/novell/idm/Designer//packages/eclipse/plugins\":\"/tmp/plugins\" -a \"admin.servers.system\" -w novell123$ -s 127.0.0.1:524 -c \"driverset1.system\" -b NOVLSOAPBASE -l \"/var/opt/novell/idm/soap_driver.log\" -u IDM4_15_SOAP2#{number} '" 
  action :run
end








