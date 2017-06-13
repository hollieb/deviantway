import Vapor
let drop = try Droplet()
drop.get { request in
    return "Hello, World!"
}
try drop.run()
