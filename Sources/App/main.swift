import Vapor
let drop = try Droplet()

drop.get { request in
    return try drop.view.make("index.leaf")
}

try drop.run()
