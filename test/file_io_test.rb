require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_io'
require 'pry'

class FileIOTest < Minitest::Test
  def test_it_reads_file
    em = FileIO.new("./data/full_event_attendees.csv")
    assert_equal 5175, em.attendees.length
    assert_equal "Allison Nguyen", em.attendees.first
    assert_equal "X Lee", em.attendees[2246]
    assert_equal "Greg SAUNDERS", em.attendees.last
  end
end
