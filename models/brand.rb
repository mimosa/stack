# -*- encoding: utf-8 -*-

class Brand
  include Mongoid::Document
  include Mongoid::TaggableOn
  include Mongoid::Timestamps

  taggable_on :materials  # 成分、材质
  taggable_on :categories # 品类
  taggable_on :audiences  # 受众
  taggable_on :features   # 功效
  taggable_on :lines      # 系列

  has_many :stores   # 店铺
  has_many :products # 产品

  # Fields
  field :name
  field :name_eng

  def to_s
    if name_eng
      "#{name}/#{name_eng}"
    else
      name
    end
  end

end