

class BeefyRobotSimulator
  HEIGHT = 5
  WIDTH = 5
  DELTAS = {
    "N" => { x: 0, y: 1},
    "E" => { x: 1, y: 0},
    "S" => { x: 0, y: -1},
    "W" => { x: -1, y: 0},
  }
  FACINGS = ["N", "E", "S", "W"]

  def initialize
    @position = nil
    @facing = nil
  end

  def place(x,y,f)
    @position = { x: x, y: y } if in_bounds?(x, y)
    @facing = f
  end

  def move
    delta = DELTAS[@facing]
    if @position
      new_position = {
        x: @position[:x] + delta[:x],
        y: @position[:y] + delta[:y]
      }
      if in_bounds?(new_position[:x], new_position[:y])
        @position[:x] = new_position[:x]
        @position[:y] = new_position[:y]
      end
    end
  end

  def left 
    new_facing_index = nil

    FACINGS.each_with_index do |facing, index|
      if facing == @facing
        new_facing_index = index - 1
        break
      end
    end

    @facing = FACINGS[new_facing_index]
  end

  def right 
    new_facing_index = nil

    FACINGS.each_with_index do |facing, index|
      if facing == @facing
        new_facing_index = index + 1
        if new_facing_index >= FACINGS.length
          new_facing_index = 0
        end
        break
      end
    end

    @facing = FACINGS[new_facing_index]
  end

  def report
    {
      x: @position[:x],
      y: @position[:y],
      f: @facing
    }
  end

  private

  def in_bounds?(x, y)
    x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
  end
end






