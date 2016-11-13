require "administrate/base_dashboard"

class ProjectEvaluationDashboard < Administrate::BaseDashboard
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
    organization_name: Field::String,
    project_title: Field::String,
    quality_assesment: Field::Text,
    student_learning: Field::Text,
    team_feedback: Field::Text,
    additional_team_feedback: Field::Text,
    pass_on_send: Field::String,
    pass_comments: Field::String,
    enhance_development: Field::Text,
    progress_reports_rating: Field::Number,
    project_workplan_rating: Field::Number,
    peste_analysis_rating: Field::Number,
    poster_conferenece_rating: Field::Number,
    contact_via_email_rating: Field::Number,
    project_report_rating: Field::Number,
    weekly_meetings_rating: Field::Number,
    other_comment_rating: Field::Number,
    other_comment: Field::Text,
    organization_suggestions: Field::Text,
    future_issues: Field::Text,
    another_project: Field::String,
    another_project_comments: Field::Text,
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
    :organization_name,
    :project_title,
    :quality_assesment,
    :student_learning,
    :team_feedback,
    :additional_team_feedback,
    :pass_on_send,
    :pass_comments,
    :enhance_development,
    :progress_reports_rating,
    :project_workplan_rating,
    :peste_analysis_rating,
    :poster_conferenece_rating,
    :contact_via_email_rating,
    :project_report_rating,
    :weekly_meetings_rating,
    :other_comment_rating,
    :other_comment,
    :organization_suggestions,
    :future_issues,
    :another_project,
    :another_project_comments,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :contact_name,
    :organization_name,
    :project_title,
    :quality_assesment,
    :student_learning,
    :team_feedback,
    :additional_team_feedback,
    :pass_on_send,
    :pass_comments,
    :enhance_development,
    :progress_reports_rating,
    :project_workplan_rating,
    :peste_analysis_rating,
    :poster_conferenece_rating,
    :contact_via_email_rating,
    :project_report_rating,
    :weekly_meetings_rating,
    :other_comment_rating,
    :other_comment,
    :organization_suggestions,
    :future_issues,
    :another_project,
    :another_project_comments,
  ].freeze

  # Overwrite this method to customize how project evaluations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project_evaluation)
  #   "ProjectEvaluation ##{project_evaluation.id}"
  # end
end
