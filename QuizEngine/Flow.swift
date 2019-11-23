//
//  Flow.swift
//  QuizEngine
//
//  Created by Amaan Khan on 2019-11-22.
//  Copyright © 2019 com.amaancan. All rights reserved.
//

import Foundation

/// Routing is an abstraction to the "next question event" handler
protocol Routing {
    func routeTo(question: String )
}

///  Flow is a "stream" or a "stream of events," like questions and answers. The Flow receives "answer events" and fires "next question events."
class Flow {
    let router: Routing
    let questions: [String]

    init(questions: [String], router: Routing) {
        self.questions = questions
        self.router = router
    }

    func start() {
        if !questions.isEmpty {
            router.routeTo(question: "anything")
        }
    }
}
