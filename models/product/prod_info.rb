class ProdInfo
  include Mongoid::Document
  embedded_in :product

  field :desc  # 宝贝详情
  field :guide # 使用手册
  field :warn  # 注意事项

end