require 'rmagick'

class Matrix
  def initialize
    @matrix = Array.new(1000){Array.new(1000){0}}
  end

  def action(args)
    throw Exception unless args.count == 4
    (args[0]..args[1]).each do |x|
      (args[2]..args[3]).each do |y|
        yield(x,y)
      end
    end    
  end
  
  def on(args)
    action(args) do |x,y|
      @matrix[x][y] = 1
    end
  end

  def off(args)
    action(args) do |x,y|
      @matrix[x][y] = 0
    end
  end

  def inc(args,by=1)
    action(args) do |x,y|
      @matrix[x][y] += by
    end
  end

  def dec(args,by=1)
    action(args) do |x,y|
      @matrix[x][y] -= by
      if @matrix[x][y] < 0
        @matrix[x][y] = 0
      end
    end
  end

  def flip(args)
    action(args) do |x,y|
      @matrix[x][y] = @matrix[x][y] == 1 ? 0 : 1
    end
  end

  def count
    count = 0
    @matrix.each_with_index do |row,x|
      row.each_with_index do |state,y|
        count += state
      end
    end
    return count
  end

  def draw
    return @image unless @image.nil?
    @image = Magick::Image.new(@matrix.size,@matrix[0].size){
      self.background_color = 'rgb(0,0,0)'
    }
    gc = Magick::Draw.new

    @matrix.each_with_index do |row,x|
      row.each_with_index do |state,y|
        color = (state*15) % 255
        gc.fill("rgb(#{color},#{color},#{color})")
        gc.point(x,y) if state >= 1
      end
    end
    
    gc.draw(@image)
    return @image
  end

  def display
    draw.display
  end

  def save(name)
    draw.write("./#{name}.png"){
      self.format = 'png'
    }
  end
end