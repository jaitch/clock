# clock_spec.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/clock' # added ../lib after making it and moving it to the directory

Minitest::Reporters.use!

describe "clock methods" do

  # can do before do -here- with @ symbols in front of variables to be applied within later it blocks

  it "will return a string" do
    # Arrange
    hours = 8
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect(time).must_be_instance_of String # no parentheses around "String" bc Minitest
    # must_be_instance_of is a Minitest method
  end

  it "will return a string formatted in hh:mm:ss format" do
    # Arrange
    hours = 8
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect(time).must_equal "08:14:27"
  end

  it "will display leading zeros for numbers smaller than 10" do
    time = clock(11, 8, 14) # Arrange and Act on same line
    expect(time).must_equal "11:08:14" # Assert

    time = clock(8, 11, 14);
    expect(time).must_equal "08:11:14"

    time = clock(11, 14, 8);
    expect(time).must_equal "11:14:08"
  end

  # Arranging, acting and asserting in one step
  it "will raise an error when given an invalid argument" do
    expect { #curly braces instead of parentheses--syntax borrowed from other languages. not the same as maps enumerables curly braces
      # check value of something use parens, raise something use curly braces
      clock(25, 14, 8)
    }.must_raise ArgumentError #returned instead of function

    expect {
      clock(11, 60, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 14, 60)
    }.must_raise ArgumentError

    expect {
      clock(-2, 30, 20)
      .must_raise ArgumentError
    }
  end
end
