class DeleteIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index "registers", name: "index_registers_on_user_and_day"
  end
end
