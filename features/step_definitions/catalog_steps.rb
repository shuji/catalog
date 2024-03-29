#encoding: utf-8

前提 /^商品管理ページを開いている$/ do
  visit "/products"
end

前提 /^店舗管理ページを開いている$/ do
  visit "/shops"
end

前提 /^トップページを表示している$/ do
  visit "/"
end

前提 /^"(.*?)"をクリックする$/ do |link_text|
  click_link link_text
end

前提 /^以下の内容で店舗が登録されている:$/ do |table|
  table.hashes.each do |row|
    Shop.create!(
      name: row['店舗名'],
      description: row['説明'],
      lines_summary: row['取扱商品概要'],
    )
  end
end

前提 /^以下の内容で商品が登録されている:$/ do |table|
  table.hashes.each do |row|
    Product.create!(
      name: row['商品名'],
      description: row['説明'],
      price: row['価格'].to_i,
    )
  end
end

もし /^以下の内容で商品を登録する:$/ do |table|
  product_info = table.hashes[0]
  fill_in 'product_name', with: product_info['商品名']
  fill_in 'product_price', with: product_info['価格']
  fill_in 'product_description', with: product_info['説明']
  click_on 'Save'
end

もし /^以下の内容で店舗を登録する:$/ do |table|
  shop_info = table.hashes[0]
  fill_in 'shop_name', with: shop_info['店舗名']
  fill_in 'shop_description', with: shop_info['説明']
  fill_in 'shop_lines_summary', with: shop_info['取扱商品概要']
  click_on 'Save'
end

ならば /^"(.*?)"が商品詳細ページに表示されていること$/ do |product_name|
  visit url_for(Product.where(name: product_name).first)
  within 'p.name' do
    page.should have_content(product_name)
  end
end

ならば /^以下の商品が表示されていること:$/ do |table|
  table.hashes.each do |row|
    page.should have_content(row['商品名'])
    page.should have_content(row['価格'])
    page.should have_content(row['説明'])
  end
end

ならば /^"(.*?)"が店舗詳細ページに表示されていること$/ do |shop_name|
  visit url_for(Shop.where(name: shop_name).first)
  within 'p.name' do
    page.should have_content(shop_name)
  end
end

ならば /^説明が"(.*?)"になっていること$/ do |product_description|
  within 'div.description' do
    page.should have_content(product_description)
  end
end

ならば /^価格が"(.*?)"となっていること$/ do |product_price|
  within 'p.price' do
    page.should have_content(product_price)
  end
end

ならば /^取扱商品概要が"(.*?)"となっていること$/ do |lines_summary|
  within 'div.lines_summary' do
    page.should have_content(lines_summary)
  end
end

ならば /^エラーメッセージに"(.*?)"が表示されていること$/ do |error_message|
  within 'div#error_explanation' do
    page.should have_content(error_message)
  end
end

