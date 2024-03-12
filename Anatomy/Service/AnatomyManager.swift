//
//  TriviaManager.swift
//  Anatomy
//
//  Created by Nguyễn Quốc Hiếu on 10/12/2023.
//

import Foundation
class AnatomyManager: ObservableObject {
    private(set) var triviaQuestions: [AnatomySet.Result] = []
    @Published private(set) var index = 0
    @Published private(set) var length = 0
    @Published private(set) var reachEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    init() {
        Task {
            await fetchTriviaQuestions(length: 3)
        }
    }
    
    func fetchTriviaQuestions(length: Int) async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(length)") else {
            fatalError("Missing URL")
        }
            
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Unexpected response type")
            }
            if httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodeData = try decoder.decode(AnatomySet.self, from: data)
                DispatchQueue.main.async {
                    self.index = 0
                    self.length = 0
                    self.reachEnd = false

                    self.triviaQuestions = decodeData.results
                    self.length = self.triviaQuestions.count
                    self.setQuestion()
                }
                print("### sucess")
            }
            
        } catch {
            print("Error fetching trivia: \(error)")
        }
        
    }
    
    func goToNextQuestion() {
        // setting new question here
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        if index < length {
            let currentTriviaQuestion = triviaQuestions[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
