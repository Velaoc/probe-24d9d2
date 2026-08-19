class CreateGuestbookEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :guestbook_entries do |t|
      t.string :name, null: false, default: "Anonymous"
      t.text :message, null: false

      t.timestamps
    end
  end
end
