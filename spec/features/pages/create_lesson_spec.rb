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
    expect(page).to have_css "h1", "Новый урок"
    expect(page).to have_css "label", "Название урока"
    expect(page).to have_css "label", "Описание задание"
    expect(page).to have_css "input", "Загрузить файл"
    expect(page).to have_css "input", "Сохранить"
  end

  scenario 'page has text fields and upload field' do
    expect(page).to have_content 'Тестовое задание'
  end


end
