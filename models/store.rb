# -*- encoding: utf-8 -*-

class Store
  include Mongoid::Document
  include Mongoid::Timestamps
  extend  Enumerize

  has_many :items   # 商品

  # Fields
  field :name
  enumerize :name, in: ['京东', '亚马逊', '乐峰', '天猫', '当当', '一号店']
  
  field :name_eng
  enumerize :name_eng, in: ['jd', 'amazon', 'lefeng', 'tmall', 'dangdang', 'yihaodian']

  field :url
  field :item_url
  # 指定ID
  field :_id, type: String, default: -> { name_eng }

  def labels
    {
      '京东' => 'jd',
      '亚马逊' => 'amazon',
      '乐峰' => 'lefeng',
      '天猫' => 'tmall',
      '当当' => 'dangdang',
      '一号店' => 'yihaodian'
    }
  end

end
