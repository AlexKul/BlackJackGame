require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    email: Field::String,
    program: Field::String
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :email,
    :created_at,
    :updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :name,
    :email,
    :program
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :email,
    :program
  ].freeze
end
