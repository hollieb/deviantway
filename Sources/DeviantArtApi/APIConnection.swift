import HTTP
import Vapor

public class APIConnection {
    private var accessToken: String?
    private let username: String
    private let clientId: String
    private let clientSecret: String
    private let drop: Droplet
    
    public init(drop: Droplet, forUser username: String, clientId: String, clientSecret: String) {
        self.username = username
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.drop = drop
    }
    
    /// Tries to get the access_token from DeviantArt.
    public func connect() throws {
        let res = try? drop.client.get("https://www.deviantart.com/oauth2/token", query: ["grant_type": "client_credentials", "client_id": self.clientId, "client_secret": self.clientSecret])
        self.accessToken = res?.json?["access_token"]?.string
        
        guard self.accessToken == nil else { return }
        throw Abort(.internalServerError, reason: "Cannot get access_token. Be sure to be connected to the internet and check your client credentials.")
    }
}
