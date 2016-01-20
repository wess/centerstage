require 'thor'
require 'uri'
require 'open-uri'
require 'fileutils'
require 'etc'
require 'zip'
require 'erb'
require "centerstage/version"


URL                 = "https://github.com/wess/center-stage/archive/master.zip"
HOME_DIR            =  Etc.getpwuid.dir
CENTER_STAGE_DIR    = "#{HOME_DIR}/.center-stage"
CONFIG_TEMPLATE     = <<-BLOCK
app_name: <%= name %>

development:
 db:
  user: username
  name: database

production:
 db:
  user: username
  name: database

BLOCK

module Centerstage
    class App < Thor
        desc "setup", "Sets up CenterStage for use"
        def setup(fork=URL)
            if  not valid_url?(fork)
                puts "URL provided for fork of Centerstage, is invalid."
                return
            end

            if File.directory?(CENTER_STAGE_DIR)
                FileUtils.rm_rf CENTER_STAGE_DIR    
            end
            
            FileUtils.mkdir_p(CENTER_STAGE_DIR)

            zip_path = "#{CENTER_STAGE_DIR}/center-stage.zip"
            open zip_path, 'wb' do |file|
                file << open(fork).read
            end

            Zip::File.open zip_path do |zip_file|
                zip_file.each do |entry|
                    path_array  = entry.name.split("/").drop(1)
                    path        = "#{CENTER_STAGE_DIR}/#{path_array.join("/")}"

                    entry.extract path
                end
            end

            File.delete zip_path

            puts "Setup complete"
        end

        desc "create NAME", "Creates a new Sinatra/Datamapper app"
        def create(name)
            app_dir     = "#{Dir.pwd}/#{name}"
            app_name    = name.slice(0, 1).capitalize + name.slice(1..-1)

            FileUtils.cp_r CENTER_STAGE_DIR, app_dir

            Dir.glob("#{app_dir}/**/*.*") do |file|
                template = ERB.new File.read(file)
                File.open(file, 'w') do |f|
                    f.write template.result(binding)
                end
            end
        end

        no_commands do
            def valid_url?(url)
                uri = URI.parse(url)
                uri.kind_of?(URI::HTTP)
            rescue URI::InvalidURIError
                false
            end
        end
    end
end

