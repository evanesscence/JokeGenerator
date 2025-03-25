import XCTest
@testable import JokeGenerator

class MockNetwork: Network {
    var fetchCalled = false
    var passedURL: URL?
    var mockResult: Result<Data, Error>?
    
    override func fetch(url: URL, handler: @escaping (Result<Data, any Error>) -> Void) {
        fetchCalled = true
        passedURL = url
        
        if let result = mockResult {
            handler(result)
        }
    }
}


