require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_manager'
require 'pry'

class EventManagerTest < Minitest::Test
  def test_it_exists
    em = EventManager.new("./data/full_event_attendees.csv")
    assert_instance_of EventManager, em
  end

  def test_it_has_correct_number_of_attendees
    em = EventManager.new("./data/full_event_attendees.csv")
    assert_equal 5175, em.attendees.length
  end

  def test_it_has_correct_fist_attendee
    em = EventManager.new("./data/full_event_attendees.csv")
    assert_equal "Allison Nguyen", em.attendees.first
  end

  def test_it_has_correct_middle_attendee
    em = EventManager.new("./data/full_event_attendees.csv")
    assert_equal "X Lee", em.attendees[2246]
  end

  def test_it_has_correct_last_attendee
    em = EventManager.new("./data/full_event_attendees.csv")
    assert_equal "Greg SAUNDERS", em.attendees.last
  end

  def test_include
    em = EventManager.new("./data/full_event_attendees.csv")
    assert em.include? "Chris Sackett"
    refute em.include? "Rando McRandomson"
  end

  def test_remove
    em = EventManager.new("./data/full_event_attendees.csv")
    assert em.include? "Chris Sackett"
    em.remove("Chris Sackett")
    refute em.include? "Chris Sackett"
  end

  def test_insert
    em = EventManager.new("./data/full_event_attendees.csv")
    refute em.include? "Rando McRandomson"
    em.insert "Rando McRandomson"
    assert em.include? "Rando McRandomson"
  end
end
