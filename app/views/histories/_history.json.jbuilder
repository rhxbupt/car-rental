json.extract! history, :id, :start,:location, :model, :manufacturer, :style, :status, :user_id,:car_id,
              :end, :rental_rate, :license_number
json.url car_url(history, format: :json)