# -*- encoding: utf-8 -*-
require 'csv'
require 'roo'

module Mongoid
  module BaseModel
    extend ActiveSupport::Concern

    included do
      include Mongoid::Document

      scope :exclude_ids, Proc.new { |ids| where(:_id.nin => ids.map(&:to_i)) }
      scope :by_week, where(:created_at.gte => 7.days.ago.utc)
    end

    module ClassMethods

      def find_by_id(id)
        find(id) rescue nil
      end

      def column_names(opts = {})
        opts[:black_list] ||= ['_id', '_type']
        opts[:extra]      ||= ['id']

        fields.keys - opts[:black_list] + opts[:extra]
      end

      def column_labels(field_list = nil)
        field_list ||= column_names
        return false unless field_list.is_a?(Array)
        Hash[ field_list.collect{|column| [human_attribute_name(column), column]} ]
      end

      def self.import(file)
        spreadsheet = open_spreadsheet(file)

        header = spreadsheet.row(1)
        header = column_labels.slice(*header).values

        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          product = find_by_id(row['id']) || new
          product.attributes = row.to_hash.slice(*accessible_attributes)
          product.save!
        end
      end

      def to_csv(field_list = nil)
        field_list ||= column_labels
        return false unless field_list.is_a?(Hash)
        ::CSV.generate(encoding: 'GB18030') do |csv|
          csv << field_list.keys
          each do |record|
            csv << record.attributes.values_at(*field_list.values)
          end
        end
      end

      private

      def open_spreadsheet(file)
        case File.extname(file.original_filename)
          when ".csv" then 
            ::Csv.new(file.path, nil, :ignore)
          when ".xls" then 
            ::Excel.new(file.path, nil, :ignore)
          when ".xlsx" then 
            ::Excelx.new(file.path, nil, :ignore)
          else
            raise "Unknown file type: #{file.original_filename}"
        end
      end

    end # Ended ClassMethods
  end
end