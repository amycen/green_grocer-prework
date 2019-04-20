require "pry"
def consolidate_cart(cart)
  # code here
  whole_cart = cart.reduce Hash.new, :merge
  cart.each do |item_hash|
    item_hash.each do |item, attrib|
      whole_cart[item] ||= {}
      whole_cart[item][:count] ||= 0
      curr_count = whole_cart[item][:count]
      whole_cart[item][:count] = curr_count + 1
    end
  end
  whole_cart
end

coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

def apply_coupons(cart, coupons)
  # code here
  cart.clone.each do |item, attrib|
    coupons.each do |coupon|
      if item == coupon[:item] && coupon[:num] <= cart[item][:count]
        cart[item][:count] = cart[item][:count] % coupon[:num]
        cart["#{item} W/COUPON"] = {
          :price => coupon[:cost],
          :clearance => cart[item][:clearance],
          :count => cart[item][:count] / coupon[:num]
        }
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, attrib|
    cart[item][:price] = (cart[item][:price] * 0.80).round(2) if cart[item][:clearance]
  end
  cart
end

def checkout(cart, coupons)
  # code here
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  curr_total = 0
  cart.each do |item, attrib|
    curr_total += cart[item][:price]
  end
  if curr_total > 100.0
    cart.each do |item, attrib|
      cart[item][:price] = (cart[item][:price] * 0.90).round(2)
    end
  end
end

cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"KALE" => {:price => 3.00, :clearance => false}},
  {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
  {"ALMONDS" => {:price => 9.00, :clearance => false}},
  {"TEMPEH" => {:price => 3.00, :clearance => true}},
  {"CHEESE" => {:price => 6.50, :clearance => false}},
  {"BEER" => {:price => 13.00, :clearance => false}},
  {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
  {"BEETS" => {:price => 2.50, :clearance => false}},
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"SOY MILK" => {:price => 4.50, :clearance => true}}
]

coupons = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

ccart = consolidate_cart(cart)
apply_coupons(ccart, coupons)
apply_clearance(ccart)
