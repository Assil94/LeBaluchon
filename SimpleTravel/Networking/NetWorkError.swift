
import Foundation

enum NetWorkError: Error {
    case badUrl
    case noData
    case jsonError
}

// enumeration to manage errors
enum ErrorCases: Swift.Error {
    case noData
    case wrongResponse(statusCode: Int?)
    case failure
    case errorDecode
}
