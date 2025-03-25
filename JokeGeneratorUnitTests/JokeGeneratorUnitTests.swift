//
//  JokeGeneratorUnitTests.swift
//  JokeGeneratorUnitTests
//
//  Created by /karisheesh on 25.03.2025.
//

import XCTest
@testable import JokeGenerator

class JokesLoaderTests: XCTestCase {
    
    func testLoadJokes_CallsFetch() {
        // 1. Создаём мок и заглушку
        let mockNetwork = MockNetwork()
        let sut = JokesLoader(networkClient: mockNetwork)
        
        sut.loadJokes { _ in }
        
        XCTAssertTrue(mockNetwork.fetchCalled, "Метод fetch(url:handler:) должен быть вызван")
    }
}

