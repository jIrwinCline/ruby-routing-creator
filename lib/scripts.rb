#!/usr/bin/env ruby

require 'pry'
require 'fileutils'

def root_creator(project)
  FileUtils.mkdir("../#{project}")
  FileUtils.cd("../#{project}")
  FileUtils.mkdir("lib")
end

def file_creator(file_name)
  FileUtils.touch("lib/#{file_name}.rb")
  FileUtils.touch("config.ru")
  FileUtils.mkdir("spec")
  FileUtils.mkdir("views")
  FileUtils.touch("spec/#{file_name}_spec.rb")
  FileUtils.touch("spec/#{file_name}_integration_spec.rb")
  FileUtils.touch("Gemfile")
  FileUtils.touch("app.rb")
end

def write(file_name)

  File.open("config.ru", 'w') { |file| file.write("require ('./app')
    run Sinatra::Application") }

  File.open("Gemfile", 'w') { |file| file.write("source 'https://rubygems.org'

    gem 'pry'
    gem 'rspec'
    gem 'fileutils'
    gem 'pivotal_git_scripts'
    gem 'capybara'
    gem 'sinatra'
    gem 'sinatra-contrib'") }



  File.open("app.rb", 'w') { |file| file.write(
    "require('sinatra')
    require('sinatra/reloader')
    also_reload('lib/**/*.rb')
    require('./lib/#{file_name}.rb')

    get('/') do
      'This will be our home page. '/' is always the root route in a Sinatra application.'
    end

    get('/albums') do
      'This route will show a list of all albums.'
    end

    get('/albums/new') do
      'This will take us to a page with a form for adding a new album.'
    end

    get('/albums/:id') do
      'This route will show a specific album based on its ID. The value of ID here is '
    end

    post('/albums') do
      'This route will add an album to our list of albums. We can't access this by typing in the URL. In a future lesson, we will use a form that specifies a POST action to reach this route.'
    end

    get('/albums/:id/edit') do
      'This will take us to a page with a form for updating an album with an ID of.'
    end

    patch('/albums/:id') do
      'This route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route.'
    end

    delete('/albums/:id') do
      'This route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route.'
    end

    get('/custom_route') do
      'We can even create custom routes, but we should only do this when needed.'
    end

    ") }

  File.open("lib/#{file_name}.rb", 'w') { |file| file.write(
"require 'pry'
require 'fileutils'
require 'pry'

  class Class_name
    def initialize()

    end
    def method

    end
  end

#     class Album
#   attr_reader :id
#   attr_accessor :name, :year, :artist, :genre
#
#   @@albums = {}
#   @@total_rows = 0
#
#   def initialize(name,year,artist,genre, id)
#     @name = name
#     @year = year
#     @artist = artist
#     @genre = genre
#     # @songs = []
#     @id = id || @@total_rows += 1 #ask about this
#   end
#
#   def self.all()
#     @@albums.values()
#   end
#
#   def self.find(id)
#     @@albums[id]
#   end
#
#   def self.search(query)
#     @@albums.values.select { |album| album.name == query }
#   end
#
#   def self.sort
#     @@albums.values.sort
#   end
#
#   def self.clear
#     @@albums = {}
#     @@total_rows = 0
#   end
#
#   def save
#     @@albums[self.id] = Album.new(self.name,self.year, self.artist,self.genre, self.id)
#   end
#
#   def ==(album_to_compare)
#     self.name() == album_to_compare.name()
#   end
#
#   def update(name)
#     self.name = name
#     @@albums[self.id] = Album.new(self.name,self.year, self.artist,self.genre, self.id)
#   end
#
#   def delete
#     @@albums.delete(self.id)
#   end
#
#   def songs
#     Song.find_by_album(self.id)
#   end
#
# end

    ")}

  File.open("spec/#{file_name}_spec.rb", 'w') { |file| file.write("
require 'pry'
require '#{file_name}.rb'
require 'rspec'

  describe('#{file_name}') do
    it('this is your generic test') do

    end
  end
    ")}

  File.open("spec/#{file_name}_integration_spec.rb", 'w') { |file| file.write("
require 'pry'
require '#{file_name}.rb'
require 'capybara'

  describe('#{file_name}') do
    it('this is your generic test') do

    end
  end
    ")}
  end

p "Enter your project name:"
project = gets.chomp
root_creator(project)
p "What do you want to name your file?"
file_name = gets.chomp
file_creator(file_name)
write(file_name)
