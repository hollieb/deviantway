import Vapor
import DeviantArtApi
let drop = try Droplet()
guard drop.config["deviantart", "client_id"] != nil, drop.config["deviantart", "client_secret"] != nil, drop.config["deviantart", "username"] != nil else {
    throw Abort(.internalServerError, reason: "Please specify your client_id, client_secret and username in Config/deviantart.json")
}
let apiConn = APIConnection(drop: drop, forUser: drop.config["deviantart", "username"]!.string!, clientId: drop.config["deviantart", "client_id"]!.string!, clientSecret: drop.config["deviantart", "client_secret"]!.string!)
try apiConn.connect()

drop.get { request in
    return try drop.view.make("index.leaf")
}

try drop.run()
