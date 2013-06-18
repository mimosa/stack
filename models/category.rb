# -*- encoding: utf-8 -*-

class Category # 分类
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :categoryable, polymorphic: true
  
  has_many   :children, class_name: 'Category', :inverse_of => :parent
  belongs_to :parent,   class_name: 'Category', :inverse_of => :children, index: true
  
  # Fields
  field :parent_id, type: Integer
  field :priority,  type: Integer
  field :name
end