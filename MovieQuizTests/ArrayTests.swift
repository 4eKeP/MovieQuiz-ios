//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by admin on 12.08.2023.
//

import XCTest

@testable import MovieQuiz // импортирование приложения для теста

class ArrayTest: XCTestCase {
    func testGetValueInRange() throws { // тест на успешное взятие элемента по индексу
        // Given
        let array = [1,1,2,3,5]
        // When
        let value = array[safe: 2]
        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    func testGetValueOutOfRange() throws { // тест на взяте элемента по неправильному индексу
        // Given
        let array = [1,1,2,3,5]
        // When
        let value = array[safe: 20]
        // Then
        XCTAssertNil(value)
    }
}
