#if os(Linux)

import XCTest
import DeviantArtApiTests

XCTMain([
    testCase(ConnectionTests.allTests),
])

#endif
