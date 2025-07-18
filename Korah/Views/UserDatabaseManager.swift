import Foundation

struct UserDatabaseManager {
    static let key = "UserDatabase"
    
    static func saveUser(email: String, username: String) {
        var database = loadDatabase()
        database[email] = username
        if let data = try? JSONEncoder().encode(database) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    static func loadDatabase() -> [String: String] {
        if let data = UserDefaults.standard.data(forKey: key),
           let database = try? JSONDecoder().decode([String: String].self, from: data) {
            return database
        }
        return [:]
    }
    
    static func userExists(email: String) -> Bool {
        return loadDatabase()[email] != nil
    }
    
    static func getUsername(for email: String) -> String? {
        return loadDatabase()[email]
    }
}
