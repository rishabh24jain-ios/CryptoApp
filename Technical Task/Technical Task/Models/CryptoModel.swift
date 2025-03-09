//
//  CryptoModel.swift
//  Technical Task
//
//  Created by Rishabh Jain on 8/3/2025.
//

import Foundation
struct Crypto : Codable, Identifiable {
  let id : String
  let symbol : String
  let name : String
  let image : String
  let currentPrice : Double
  let marketCap : Double?
  let marketCapRank : Int
  let fullyDilutedValuation : Double?
  let totalVolume : Double
  let high24H : Double
  let low24H : Double
  let priceChange24H : Double
  let priceChangePercentage24H : Double
  let marketCapChange24H : Double
  let marketCapChangePercentage24H : Double
  let circulatingSupply : Double
  let totalSupply : Double
  let maxSupply : Double?
  let ath : Double
  let athChangePercentage : Double
  let athDate : String
  let atl : Double
  let atlChangePercentage : Double
  let atlDate : String
  let roi : Roi?
  let lastUpdated : String
  var totalValue: Double {
     currentPrice * totalVolume
  }


  enum CodingKeys: String, CodingKey {

    case id = "id"
    case symbol = "symbol"
    case name = "name"
    case image = "image"
    case currentPrice = "current_price"
    case marketCap = "market_cap"
    case marketCapRank = "market_cap_rank"
    case fullyDilutedValuation = "fully_diluted_valuation"
    case totalVolume = "total_volume"
    case high24H = "high_24h"
    case low24H = "low_24h"
    case priceChange24H = "price_change_24h"
    case priceChangePercentage24H = "price_change_percentage_24h"
    case marketCapChange24H = "market_cap_change_24h"
    case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
    case circulatingSupply = "circulating_supply"
    case totalSupply = "total_supply"
    case maxSupply = "max_supply"
    case ath = "ath"
    case athChangePercentage = "ath_change_percentage"
    case athDate = "ath_date"
    case atl = "atl"
    case atlChangePercentage = "atl_change_percentage"
    case atlDate = "atl_date"
    case roi = "roi"
    case lastUpdated = "last_updated"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    symbol = try values.decode(String.self, forKey: .symbol)
    name = try values.decode(String.self, forKey: .name)
    image = try values.decode(String.self, forKey: .image)
    currentPrice = try values.decode(Double.self, forKey: .currentPrice)
    marketCap = try values.decodeIfPresent(Double.self, forKey: .marketCap)
    marketCapRank = try values.decode(Int.self, forKey: .marketCapRank)
    fullyDilutedValuation = try values.decodeIfPresent(Double.self, forKey: .fullyDilutedValuation)
    totalVolume = try values.decode(Double.self, forKey: .totalVolume)
    high24H = try values.decode(Double.self, forKey: .high24H)
    low24H = try values.decode(Double.self, forKey: .low24H)
    priceChange24H = try values.decode(Double.self, forKey: .priceChange24H)
    priceChangePercentage24H = try values.decode(Double.self, forKey: .priceChangePercentage24H)
    marketCapChange24H = try values.decode(Double.self, forKey: .marketCapChange24H)
    marketCapChangePercentage24H = try values.decode(Double.self, forKey: .marketCapChangePercentage24H)
    circulatingSupply = try values.decode(Double.self, forKey: .circulatingSupply)
    totalSupply = try values.decode(Double.self, forKey: .totalSupply)
    maxSupply = try values.decodeIfPresent(Double.self, forKey: .maxSupply)
    ath = try values.decode(Double.self, forKey: .ath)
    athChangePercentage = try values.decode(Double.self, forKey: .athChangePercentage)
    athDate = try values.decode(String.self, forKey: .athDate)
    atl = try values.decode(Double.self, forKey: .atl)
    atlChangePercentage = try values.decode(Double.self, forKey: .atlChangePercentage)
    atlDate = try values.decode(String.self, forKey: .atlDate)
    roi = try values.decodeIfPresent(Roi.self, forKey: .roi)
    lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
  }
}

struct Roi: Codable {
  let times: Double
  let currency: String
  let percentage: Double
}
