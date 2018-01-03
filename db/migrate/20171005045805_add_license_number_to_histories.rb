class AddLicenseNumberToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :license_number, :integer
  end
end
