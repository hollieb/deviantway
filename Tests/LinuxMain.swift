#if os(Linux)

import XCTest
@testable import AppTests
@testable import DeviantArtApiTests

XCTMain([
    testCase(FakeTests.allTests),
    testCase(ConnectionTests.allTests),
])

#endif
