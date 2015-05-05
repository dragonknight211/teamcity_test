#
# default.rb
#
# teamcity_ci_epc cookbook
# Define some node's attributes needed for this cookbook
#
default['teamcity']['version'] = '9.0.4'   # Selected Teamcity server version to install
default['teamcity']['port'] = '8000'       # Port to run Teamcity server
