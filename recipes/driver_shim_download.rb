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


execute "Download MSGW Driver Shim jar" do
 user "root" 
 command "mkdir -p /tmp/msgwshim; wget http://isec-publish.labs.blr.novell.com/publish/Builds/IDM/dorado_sp2_patch2/Drivers/MSGatewayDriver/20130208/msgatewayfp.zip -O /tmp/msgwshim/msgatewayfp.zip;"
  action :run
end

execute "unzip the build" do
 user "root" 
 command "cd /tmp/msgwshim; unzip -o msgatewayfp.zip"
  action :run
end


execute "Upgrade the rpm" do
 user "root" 
 command "rpm -Uvh --force /tmp/msgwshim/msgatewayfp/linux/novell-DXMLMSGway.rpm"
  action :run
end


execute "Restart the edirectory" do
 user "root" 
 command "/etc/init.d/ndsd restart"
  action :run
end


