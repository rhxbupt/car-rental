class AddLicenseNumberToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :license_number, :integer
  end
end
