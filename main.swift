import Dispatch
import Foundation

if CommandLine.arguments.count < 2 || (CommandLine.arguments[1].range(of: "-+h(elp)?", options: .regularExpression, range: nil, locale: nil) != nil) {
    print("usage: trolldrop <path> [recharge seconds=10]")
    exit(1)
}

guard let url = URL(string: CommandLine.arguments[1]) else {
    print ("invalid url")
    exit(2)
}
let recharge = CommandLine.arguments.count >= 3 ? (Double(CommandLine.arguments[2]) ?? 10) : 10

print("started trolldrop with url \(url) and recharge \(recharge)")

let trollController = TrollController(sharedURL: url, rechargeDuration: recharge)
trollController.start()

dispatchMain()

