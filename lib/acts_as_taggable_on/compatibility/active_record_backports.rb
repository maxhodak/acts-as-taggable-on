module ActsAsTaggableOn
  module ActiveRecord
    module Backports
      def self.included(base)
        base.class_eval do
          scope :where,    lambda { |conditions| { :conditions => conditions } }  
          scope :joins,    lambda { |joins|      { :joins => joins } }
          scope :group,    lambda { |group|      { :group => group } }
          scope :order,    lambda { |order|      { :order => order } }
          scope :select,   lambda { |select|     { :select => select } }
          scope :limit,    lambda { |limit|      { :limit => limit } }
          scope :readonly, lambda { |readonly|   { :readonly => readonly } }
          
          def self.to_sql
            construct_finder_sql({})
          end
        end
      end
    end
  end
end