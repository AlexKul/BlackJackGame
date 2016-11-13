require "administrate/base_dashboard"

class StudentRankingDashboard < Administrate::BaseDashboard
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
    student_name: Field::String,
    student_email: Field::String,
    student_school: Field::String,
    student_program_select: Field::String,
    student_program_text_field: Field::String,
    rank_1: Field::String,
    rank_2: Field::String,
    rank_3: Field::String,
    rank_4: Field::String,
    rank_5: Field::String,
    student_skills: Field::Text,
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
    :student_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :student_name,
    :student_email,
    :student_school,
    :student_program_select,
    :student_program_text_field,
    :rank_1,
    :rank_2,
    :rank_3,
    :rank_4,
    :rank_5,
    :student_skills,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :student_name,
    :student_email,
    :student_school,
    :student_program_select,
    :student_program_text_field,
    :rank_1,
    :rank_2,
    :rank_3,
    :rank_4,
    :rank_5,
    :student_skills,
  ].freeze

  # Overwrite this method to customize how student rankings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(student_ranking)
  #   "StudentRanking ##{student_ranking.id}"
  # end
end
