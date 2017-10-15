#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
    testCase(FakeTests.allTests),
])

#endif
