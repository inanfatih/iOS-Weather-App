
import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=169ed03936d30eedaea2c604579ba792&units=metric"

    func fetchWeather(cityName: String)
    {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }

    func performRequest(urlString: String)
    {
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)

            // Closure'u asagidaki 3 sekilde de kullanabiliriz:
            // let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))

            // let task = session.dataTask(with: url){ handle(data: $0, response: $1, error: $2) }

            let task = session.dataTask(with: url) { (data, response, error) in

                if (error != nil)
                {
                    print(error!)
                    return
                }

                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }

            task.resume()
        }
    }

    func handle(data: Data?, response: URLResponse?, error: Error?)
    {
        if (error != nil)
        {
            print(error!)
            return
        }

        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }

    func parseJSON (weatherData: Data)
    {
        do
        {
            let decodedData = try JSONDecoder().decode(WeatherData.self, from: weatherData)
            print(decodedData)
        }
        catch
        {
            print(error)
        }
    }
}

