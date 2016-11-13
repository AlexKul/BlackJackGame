require "administrate/base_dashboard"

class ExpressionOfInterestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    contact_name: Field::String,
    contact_position: Field::String,
    contact_phone: Field::String,
    contact_email: Field::String,
    organization_website: Field::String,
    organization_description: Field::Text,
    project_description: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :contact_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :contact_name,
    :contact_position,
    :contact_phone,
    :contact_email,
    :organization_website,
    :organization_description,
    :project_description,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :contact_name,
    :contact_position,
    :contact_phone,
    :contact_email,
    :organization_website,
    :organization_description,
    :project_description,
  ].freeze

  # Overwrite this method to customize how expression of interests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(expression_of_interest)
  #   "ExpressionOfInterest ##{expression_of_interest.id}"
  # end
end
