# This file is used by Rack-based servers to start the application.
require 'youtube_search'

require ::File.expand_path('../config/environment',  __FILE__)
run PlaylistrrOnRailsV2::Application
