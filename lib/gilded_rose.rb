class GildedRose

  def initialize(items)
    @items = items
  end

  def normal_update_quality
    items = Normal.new(@items)
    items.update_quality
  end

  def brie_update_quality
    items = Brie.new(@items)
    items.update_quality
  end

  def sulfuras_update_quality
    items = Sulfuras.new(@items)
    items.update_quality
  end

  def backstage_update_quality
    items = Backstage.new(@items)
    items.update_quality
  end

  def update_quality()
    @items.each do |item|
      case
      when item.name == "normal"
          normal_update_quality()
      when item.name == "Aged Brie"
          brie_update_quality
      when item.name == "Sulfuras, Hand of Ragnaros"
        sulfuras_update_quality
      when item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_update_quality
      end
    end
  end
end

class Backstage
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      return if item.quality >= 50
      return item.quality = 0 if item.sell_in < 0
      item.quality += 1
      item.quality += 1 if item.sell_in < 10
      item.quality += 1 if item.sell_in < 5
    end
  end
end

class Brie
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1
      return if item.quality >= 50
      item.quality += 1
      item.quality += 1 if item.sell_in <= 0
    end
  end
end

class Sulfuras
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
  end
end

class Normal
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.sell_in -= 1
      return if item.quality == 0
      item.quality -= 1
      item.quality -= 1 if item.sell_in <= 0
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
