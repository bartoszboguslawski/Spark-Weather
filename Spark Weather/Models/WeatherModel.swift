//
//  WeatherModel.swift
//  Spark Weather
//
//  Created by Bartosz Bogusławski on 24/05/2022.
//

import Foundation

struct WeatherModel: Decodable {
    let lat, lon: Double?
    let timezone: String
    let timezoneOffset: Int?
    let current: Current
    let minutely: [Minutely]?
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily, alerts
    }
}

// MARK: - Alert
struct Alert: Decodable {
    let senderName, event: String?
    let start, end: Int?
    let alertDescription: String?

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end
        case alertDescription = "description"
    }
}

// MARK: - Current
struct Current: Decodable {
    let dt: Int?
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let pop: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct Daily: Decodable {
    let dt, sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let clouds: Int?
    let pop, rain, uvi: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, rain, uvi
    }
}

// MARK: - FeelsLike
struct FeelsLike: Decodable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Decodable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Minutely
struct Minutely: Decodable {
    let dt, precipitation: Int?
}

