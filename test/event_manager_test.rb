require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_manager'
require 'mocha/mini_test'
require 'pry'

class EventManagerTest < Minitest::Test
  def test_it_exists
    em = EventManager.new
    assert_instance_of EventManager, em
  end

  def test_include
    em = EventManager.new(["Brian Zanti", "Manoj Panta", "Tyler Westlie", "Bryan Combs"])
    assert em.include? "Manoj Panta"
    refute em.include? "Rando McRandomson"
  end

  def test_remove
    em = EventManager.new(["Brian Zanti", "Manoj Panta", "Tyler Westlie", "Bryan Combs"])
    assert em.include? "Tyler Westlie"
    em.remove("Tyler Westlie")
    refute em.include? "Tyler Westlie"
  end

  def test_insert
    em = EventManager.new(["Brian Zanti", "Manoj Panta", "Tyler Westlie", "Bryan Combs"])
    refute em.include? "Rando McRandomson"
    em.insert "Rando McRandomson"
    assert em.include? "Rando McRandomson"
  end

  def test_load
    em = EventManager.new(["Brian Zanti", "Manoj Panta", "Tyler Westlie", "Bryan Combs"])
    em.load("./data/full_event_attendees.csv")
    assert_equal 5179, em.attendees.length
  end
end
