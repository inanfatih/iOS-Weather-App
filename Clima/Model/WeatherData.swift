import Foundation

struct WeatherData: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys?
    let timezone, id: Int
    let name: String
    let cod: Int
}

struct Clouds: Decodable  {
    let all: Int
}

struct Coord: Decodable  {
    let lon, lat: Double
}

struct Main: Decodable  {
    let temp: Double
    let feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int
}

struct Sys: Decodable  {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

struct Weather: Decodable  {
    let id: Int
    let main: String
    let weatherDescription, icon: String?
}

struct Wind : Decodable {
    let speed: Double
    let deg: Int
}
