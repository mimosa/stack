# -*- encoding: utf-8 -*-

class Packing
  include Mongoid::Document
  embedded_in :product

  # Fields
  field :length, type: Float # 长
  field :width,  type: Float # 宽
  field :height, type: Float # 高
  field :weight, type: Float # 重量

  field :country # 产地
end
