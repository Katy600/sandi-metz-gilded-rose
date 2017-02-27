class GildedRose

  def initialize(items)
    @items = items
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
      end
    end
  end


  def normal_update_quality()
      @items.each do |item|
        item.sell_in -= 1
        return if item.quality == 0
        item.quality -= 1
        item.quality -= 1 if item.sell_in <= 0
      end
    end

    def brie_update_quality
      @items.each do |item|
        item.sell_in -= 1
        return if item.quality >= 50
        item.quality += 1
        item.quality += 1 if item.sell_in <= 0
    end

    def sulfuras_update_quality

    end
  end


    # def normal_update_quality
    #    @items.item.quality -= 1
    #    @item.sell_in -= 1
    # end

      # def normal_update_quality
      #    item.quality -= 1
      #   # p item.sell_in -= 1
      # end

#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#
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
