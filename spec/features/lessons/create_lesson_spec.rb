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
    context "short text" do
      background do
        fill_in 'lesson_name', with: 'Ф'
        fill_in 'lesson_description', with: 'Ф'
      end

      scenario "text only" do
        click_on 'Сохранить урок'

        expect(page).to have_content 'Название недостаточной длины'
        expect(page).to have_content 'Описание недостаточной длины'
      end

      scenario "with question", js: true do
        click_on "Добавить вопрос"
        fill_in 'question_text', with: 'Классный вопрос'
        fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ'
        click_on 'Сохранить вопрос'

        click_on 'Сохранить урок'

        expect(page).to have_content 'Название недостаточной длины'
        expect(page).to have_content 'Описание недостаточной длины'
        expect(page).to have_content 'Классный вопрос'
        expect(page).to have_content 'Правильный ответ'
      end
    end

    context "long text" do
      background do
        fill_in 'lesson_name', with: 'Это коварный урок'
        fill_in 'lesson_description', with: 'Отличное описание интеересного урока которое подойдет для всех и каждого'
      end

      scenario "text only" do
        click_on 'Сохранить урок'

        expect(page).to have_content 'Урок успешно создан.'
      end

      scenario "with question", js: true do
        click_on "Добавить вопрос"
        fill_in 'question_text', with: 'Классный вопрос'
        fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ'
        click_on 'Сохранить вопрос'

        click_on 'Сохранить урок'

        expect(page).to have_content 'Урок успешно создан.'
        expect(page).to have_content 'Классный вопрос'
        expect(page).to have_content 'Правильный ответ'
      end

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
  end
end
