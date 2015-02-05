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
    context "one question" do
      background do
        visit new_lesson_path
        click_on "Добавить вопрос"
      end

      context "without answer" do
        scenario "short text" do
          fill_in 'question_text', with: 'Ф'
          click_on 'Сохранить вопрос'

          expect(page).to have_content 'Текст вопроса недостаточной длины'
          expect(page).to_not have_content 'Вопрос успешно создан.'
        end

        scenario "valid text" do
          fill_in 'question_text', with: 'Классный вопрос'
          click_on 'Сохранить вопрос'

          expect(page).to have_content 'Текст ответа недостаточной длины'
          expect(page).to_not have_content 'Вопрос успешно создан.'
        end
      end

      context 'with answer' do
        background do
          fill_in 'question_text', with: 'Классный вопрос'
        end

        context "one answer" do
          scenario "no text" do
            fill_in 'question_answers_attributes_0_text', with: ''
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Текст ответа не может быть пустым'
            expect(page).to_not have_content 'Вопрос успешно создан.'
          end

          scenario "valid text" do
            fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ'
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Правильный ответ'
            expect(page).to have_content 'Вопрос успешно создан.'
          end
        end

        context "two answers" do
          background do
            fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ'
            click_on 'Добавить ответ'
          end

          scenario "no text" do
            fill_in 'question_answers_attributes_1_text', with: ''
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Текст ответа не может быть пустым'
            expect(page).to_not have_content 'Вопрос успешно создан.'
          end

          scenario "valid text" do
            fill_in 'question_answers_attributes_1_text', with: 'Правильный ответ'
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Правильный ответ'
            expect(page).to have_content 'Вопрос успешно создан.'
          end
        end
      end
    end

    context "two questions" do
      background do
        visit new_lesson_path
        click_on "Добавить вопрос"
        fill_in 'question_text', with: 'Классный вопрос2'
        fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ'
        click_on 'Сохранить вопрос'

        page.find('.alert .close').click
        click_on "Добавить вопрос"
      end

      context "without answer" do
        scenario "short text" do
          fill_in 'question_text', with: 'Ф'
          click_on 'Сохранить вопрос'

          expect(page).to have_content 'Текст вопроса недостаточной длины'
          expect(page).to_not have_content 'Вопрос успешно создан.'
        end

        scenario "valid text" do
          fill_in 'question_text', with: 'Классный вопрос2'
          click_on 'Сохранить вопрос'

          expect(page).to have_content 'Текст ответа недостаточной длины'
          expect(page).to_not have_content 'Вопрос успешно создан.'
        end
      end

      context 'with answer' do
        background do
          fill_in 'question_text', with: 'Классный вопрос2'
        end

        context "one answer" do
          scenario "no text" do
            fill_in 'question_answers_attributes_0_text', with: ''
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Текст ответа не может быть пустым'
            expect(page).to_not have_content 'Вопрос успешно создан.'
          end

          scenario "valid text" do
            fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ2'
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Правильный ответ'
            expect(page).to have_content 'Правильный ответ2'
            expect(page).to have_content 'Вопрос успешно создан.'
          end
        end

        context "two answers" do
          background do
            fill_in 'question_answers_attributes_0_text', with: 'Правильный ответ2'
            click_on 'Добавить ответ'
          end

          scenario "no text" do
            fill_in 'question_answers_attributes_1_text', with: ''
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Текст ответа не может быть пустым'
            expect(page).to_not have_content 'Вопрос успешно создан.'
          end

          scenario "valid text" do
            fill_in 'question_answers_attributes_1_text', with: 'Правильный ответ2'
            click_on 'Сохранить вопрос'

            expect(page).to have_content 'Правильный ответ'
            expect(page).to have_content 'Правильный ответ2'
            expect(page).to have_content 'Вопрос успешно создан.'
          end
        end
      end
    end
  end
end