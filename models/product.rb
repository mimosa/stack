# -*- encoding: utf-8 -*-

class Product
  include Mongoid::BaseModel
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  extend  Enumerize

  belongs_to :brand

  embeds_one :packing
  embeds_one :info, class_name: 'ProdInfo'

  taggable_on :materials  # 成分、材质
  taggable_on :categories # 品类
  taggable_on :audiences  # 受众
  taggable_on :features   # 功效
  taggable_on :lines      # 系列

  # Fields
  field :barcode
  field :material_id
  field :name
  field :name_eng
  field :name_alias

  field :color
  field :size

  # 枚举类型
  field :level
  enumerize :level, in: ['A+', 'A', 'B', 'C']

  field :sale_mode
  enumerize :sale_mode, in: ['必须分销', '建议分销', '可以分销', '其他']

  field :prod_status
  enumerize :prod_status, in: ['新包装', '旧包装', '停产', '新品上市', '赠品']

  field :item_status
  enumerize :item_status, in: ['正品', '物理套装', '虚拟套装', '小样', '赠品']

  # 指定ID
  field :_id, type: String, default: -> { barcode }
end