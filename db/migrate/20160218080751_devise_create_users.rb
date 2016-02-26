class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :first_name, index: true
      t.string    :last_name, index: true
      t.string    :email,              null: false, default: ""
      t.string    :encrypted_password, null: false, default: ""
      t.integer   :user_type
      t.string    :avatar
      t.string    :reset_password_token
      t.datetime  :reset_password_sent_at
      t.datetime  :remember_created_at
      t.integer   :sign_in_count, default: 0, null: false
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :current_sign_in_ip
      t.string    :last_sign_in_ip

      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :supervisor_courses do |t|
      t.references :user
      t.references :course
    end

    create_table :courses do |t|
      t.references  :user
      t.string      :title, index: true
      t.text        :description
      t.datetime    :start_date
      t.datetime    :end_date
      t.string      :status, default: "Not Started"

      t.timestamps null: false
    end

    create_table :course_subjects do |t|
      t.references :course
      t.references :subject

      t.timestamps null: false
    end

    create_table :subjects do |t|
      t.string :title
      t.text   :instruction

      t.timestamps null: false
    end

    create_table :tasks do |t|
      t.references :subject
      t.string     :title

      t.timestamps null: false
    end

    create_table :user_courses do |t|
      t.references :user
      t.references :course

      t.timestamps null: false
    end

    create_table :user_subjects do |t|
      t.references :user_course
      t.references :user
      t.references :subject
      t.string     :status

      t.timestamps null: false
    end

    create_table :user_tasks do |t|
      t.references :user_subject
      t.references :user
      t.references :task
      t.string     :status

      t.timestamps null: false
    end

    create_table :activities do |t|
      t.references :user
      t.references :target, polymorphic: true
      t.string :content

      t.timestamps null: false
    end
  end
end