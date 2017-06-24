import XCTest
@testable import DeviantArtApi
@testable import Vapor

class ConnectionTests: XCTestCase {
    var drop: Droplet!
    var apiConn: APIConnection!
    
    override func setUp() {
        drop = try! Droplet(config: Config(arguments: ["--env=test"]))
    }
    
    func testClientIdAccessible() {
        XCTAssertNotNil(drop.config["deviantart", "client_id"]?.string)
    }
    
    func testClientSecretAccessible() {
        XCTAssertNotNil(drop.config["deviantart", "client_secret"]?.string)
    }
    
    func testAccessTokenRetrievable() {
        apiConn = APIConnection(drop: drop, forUser: "TitoSakki", clientId: drop.config["deviantart", "client_id"]!.string!, clientSecret: drop.config["deviantart", "client_secret"]!.string!)
        try? apiConn.connect()
        XCTAssertNotNil(apiConn.accessToken)
    }
}

// Linux compatibility
extension ConnectionTests {
    static var allTests = {
        return [
            ("testClientIdAccessible", testClientIdAccessible),
            ("testClientSecretAccessible", testClientSecretAccessible),
            ("testAccessTokenRetrievable", testAccessTokenRetrievable),
        ]
    }()
}
