json.extract! schedule, :id, :date, :username, :mark, :comment, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
