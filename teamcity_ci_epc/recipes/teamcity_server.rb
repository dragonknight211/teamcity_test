#
# teamcity_server.rb
#
# teamcity_ci_epc cookbook
# Install and configure TeamCity to use selected port

# Download TeamCity of selected version
file_name = "TeamCity#{node["teamcity"]["version"]}.exe"x
file_url = "http://download-cf.jetbrains.com/teamcity/#{file_name}"
remote_file "C:\#{file_name}" do
    source file_url
end

# Install TeamCity from downloaded file
windows_package "TeamCity Server" do
    source "C:\#{file_name}"
    action :install
end

# Configure TeamCity to listen on selected port
template "C:\TeamCity\conf\server.xml" do
    source "server.xml.erb" 
end

# Set TeamCity to auto start on boot
windows_service "TeamCity Server" do
    action [:enable, :start]
end
