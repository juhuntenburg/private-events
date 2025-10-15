class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.references :invitee, null: false, foreign_key: { to_table: :users }
      t.references :invited_event, null: false, foreign_key: { to_table: :events }

      t.timestamps
    end

    add_index :invitations, [:invitee_id, :invited_event_id], unique: true

  end
end
