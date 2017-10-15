import XCTest

class FakeTests: XCTestCase {
    func testFake() {
        XCTAssertTrue(true)
    }
}

// Linux compatibility
extension FakeTests {
    static var allTests = {
        return [("testFake", testFake)]
    }()
}          
