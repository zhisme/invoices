class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :title, null: false
      t.datetime :due_date, null: false
      t.references(:billable, polymorphic: true)
      t.float :total
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
