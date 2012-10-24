# coding: utf-8
require 'spec_helper'

describe ProductDecorator do
  let(:product) { Product.new.extend ProductDecorator }
  subject { product }
  it { should be_a Product }
end
