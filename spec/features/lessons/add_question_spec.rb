require_relative '../../feature_helper'
# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Teacher adds question to a lesson',
%{
  In order to provide tests for students
  As a teacher
  I want to add questions and answers to lessons
  } do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  describe "add question", js: true do
    background do
      visit new_lesson_path
      click_on "Добавить вопрос"
    end

    scenario "short text" do
      fill_in 'question_text', with: 'Ф'
      click_on 'Сохранить вопрос'

      expect(page).to have_content 'Текст вопроса недостаточной длины'
    end

    scenario "valid text" do
      fill_in 'question_text', with: 'Классный вопрос'
      click_on 'Сохранить вопрос'

      expect(page).to have_content 'Текст вопроса недостаточной длины'
    end
  end
end