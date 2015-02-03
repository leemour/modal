require_relative '../../feature_helper'
# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Teacher creates a lesson',
%{
  In order to create a lesson for students
  As a teacher
  I want to fill in Details, upload Videos, add Questions & Answers
  } do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  background do
    visit new_lesson_path
  end

  scenario 'page has correct content' do
    expect(page).to have_css "h1", text: "Новый урок"
    expect(page).to have_css "label", text: "Название"
    expect(page).to have_css "label", text: "Описание"
    expect(page).to have_upload_field 'lesson[images_attributes]'
    expect(page).to have_submit_button "Сохранить урок"
  end

  feature "fill text fields" do
    scenario "short text" do
      fill_in 'lesson_name', with: 'Ф'
      fill_in 'lesson_description', with: 'Ф'
      click_on 'Сохранить урок'

      expect(page).to have_content 'Название недостаточной длины'
      expect(page).to have_content 'Описание недостаточной длины'
    end

    scenario "long text" do
      fill_in 'lesson_name', with: 'Это коварный урок'
      fill_in 'lesson_description', with: 'Отличное описание интеересного урока которое подойдет для всех и каждого'
      click_on 'Сохранить урок'

      expect(page).to have_content 'Урок успешно создан.'
    end
  end

  context

  feature "upload" do
    background do
      fill_in 'lesson_name', with: 'Это коварный урок'
      fill_in 'lesson_description', with: 'Отличное описание интеересного урока которое подойдет для всех и каждого'
    end

    context 'one image' do
      scenario 'valid' do
        attach_file "Файл", File.join(Rails.root, "spec", "fixtures", "test.png")
        click_on 'Сохранить урок'

        expect(page.all('.image')[0]['src']).
          to match(/\/uploads\/lesson_images\/\d+\/test_medium.png/)
      end

      scenario 'invalid file type' do
        attach_file "Файл", File.join(Rails.root, "spec", "fixtures", "test.txt")
        click_on 'Сохранить урок'

        expect(page).to_not have_content 'Урок успешно создан.'
        expect(page).to have_content 'Не получилось сохранить Урок'
      end

      scenario 'invalid file size' do
        attach_file "Файл", File.join(Rails.root, "spec", "fixtures", "test.txt")
        click_on 'Сохранить урок'

        expect(page).to_not have_content 'Урок успешно создан.'
        expect(page).to have_content 'Не получилось сохранить Урок'
      end
    end

    # context 'with invalid image' do
    #   scenario 'upload avatar' do
    #     attach_file "Фото", File.join(Rails.root, "spec", "spec_helper.rb")
    #     click_on 'Сохранить'

    #     expect(page).to have_content("Вы не можете загружать файлы типа")
    #     expect(page.find('.avatar')['src']).
    #       to_not eq("/uploads/user/avatar/#{user.id}/medium_logo.png")
    #   end
    # end
  end
end
