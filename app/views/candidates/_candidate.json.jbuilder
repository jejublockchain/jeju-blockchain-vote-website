json.extract! candidate, :id, :name, :main_image_data, :description, :pledge, :policy, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
