#Static variable to be used for function
array = [15,25,50,75,100,200,400,600]
ratio = 1
margin = 0.1
perecentage = { 15 => 0.75, 25 => 0775, 50 => 0.8, 75 => 0.825, 100 => 0.85, 200 => 0.875, 400 => 0.9, 600 => 0.95}

def get_original_price(barand, price_reference, product_database)
  #Fetcing the approximate perecentage
  actuall_perecentage = binary_search(price_reference,array)
  #Calculate the price price_suggestion
  price_suggestion = (price_reference - product_database.shipping_cost * actuall_perecentage)
  if brand.rating = high
    price_suggestion = price_suggestion  * (ratio + margin)
  elsif  brand.rating = low
    price_suggestion = price_suggestion  * (ratio - margin)
  else
    price_suggestion = price_suggestion  * (ratio)
  end

  price_original = price_suggestion
end

def binary_search(num, arr)
  middle = arr[arr.length / 2]
  start = 0
  final = arr.length - 1

  while start < final
    if middle == num
      return num
    elsif middle < num
      start = middle
      middle = start + end / 2
    else
      final = middle
      middle = start + end / 2
    end
  end
  return middle
end
