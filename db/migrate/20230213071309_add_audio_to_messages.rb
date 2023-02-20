class AddAudioToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :audio, :string
  end
end
