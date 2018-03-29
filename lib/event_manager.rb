require 'CSV'
require './lib/file_io'

class EventManager
  attr_reader :attendees

  def initialize(attendees = [])
    @attendees = attendees
  end

  def load(file_name)
    @attendees += FileIO.load(file_name)
  end

  def include?(name)
    @attendees.include? name
  end

  def insert(name)
    @attendees << name
  end

  def remove(name)
    @attendees.delete(name)
  end
end
