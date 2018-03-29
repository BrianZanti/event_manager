require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require 'pry'

class FileIOTest < Minitest::Test
  def test_it_reads_file
    attendees = FileIO.load("./data/full_event_attendees.csv")
    assert_equal 5175, attendees.length
    assert_equal "Allison Nguyen", attendees.first
    assert_equal "X Lee", attendees[2246]
    assert_equal "Greg SAUNDERS", attendees.last
  end
end
