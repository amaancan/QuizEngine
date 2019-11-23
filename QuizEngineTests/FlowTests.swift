//
//  FlowTests.swift
//  QuizEngineTests
//
//  Created by Amaan Khan on 2019-11-22.
//  Copyright © 2019 com.amaancan. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)

        sut.start()
        XCTAssertEqual(router.routedQuestionCount, 0)
    }

    func test_start_withOneQuestion_routesToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [""], router: router)

        sut.start()
        XCTAssertEqual(router.routedQuestionCount, 1)
    }

    class RouterSpy: Routing {
        var routedQuestionCount: Int = 0

        func routeTo(question: String) {
            routedQuestionCount += 1
        }
    }
}
