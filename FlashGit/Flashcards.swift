//
//  Flashcards.swift
//  FlashGit
//
//  Created by Tyler Chermely on 7/30/17.
//  Copyright © 2017 Sami Vashaw. All rights reserved.
//

import Foundation

class Flashcard
{
    var question : String
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String])
    {
        self.question = question
        self.options = options
        self.correctAnswer = options[0]
    }
}

class CardCollection
{
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    public private(set) var currentIndex : Int
    
    private init()
    {
        cards = [ Flashcard(question : "What is your favorite color?", options : ["Blue", "Red", "Orange"]),
                  Flashcard( question : "Male or Female?", options: ["Male, Female"])]
        
        currentIndex = 0
    }
    
    public var currentCard : Flashcard
    {
        get
        {
            return cards[currentIndex]
        }
    }
    
    public func nextQuestion()
    {
        currentIndex += 1
        if currentIndex >= cards.count
        {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool
    {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
