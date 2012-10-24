#encoding: utf-8

module ProductDecorator

  def display_price
    number_to_currency(price, unit: '￥', precision: 0)
  end

  def display_image
    image_tag(image_url) if image?
  end

  def display_description
    simple_format description
  end

  def label_recommend
    content_tag :span, "オススメ", class: "label label-info" if recommend?
  end

end
