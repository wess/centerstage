# Centerstage

Centerstage is a commandline helper for creating Sinatra/Datamapper apps, including Rakefile and templates for creating routes and models.

## Installation

To install, just run:

    $ gem install centerstage

## Usage

Once Centerstage is installed, you can get started using it by running:
    $ centerstage setup

This will download the project template from the repo and install it to private directory (~/.center-stage). You can also, optionally, pass a fork url of your Centerstage
project setup. When you pass your fork (fork of http://github.com/wess/center-stage), Centerstage will attempt to download your fork and setup the project template for create.
Example:
    $ centerstage setup "http://github.com/<yourname>/center-stage"


Once setup, you create your new Centerstage project using:
    $ centerstage create /path/to/project
    $ cd /path/to/project
    $ bundle install

This will create a folder and a stubbed out Sinatra/Datamapper project that includes a Rakefile with prewritten commands for generating routes and models. In the project's directory
there is a `.templates` folder, this folder contains the templates used to generate routes (views) and models. You can change or update these as you see fit. When you use the
`generate` command, Rake will look to the template when generating the file.

## Development
Pull requests are always welcome, either to the main center-stage project setup or to the centerstage gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wess/center-stage.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

