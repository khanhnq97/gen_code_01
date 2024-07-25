import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final bool useMockData;

  ApiService({required this.baseUrl, this.useMockData = false});

  Future<http.Response> getStockMaster(String? hash) async {
    if (useMockData) {
      return Future.value(http.Response.bytes(
        utf8.encode(_mockStockMasterResponseJson),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      ));
    }

    final uri = Uri.parse('$baseUrl/stock_master');
    final response = await http.get(
      uri,
      headers: {'If-None-Match': hash ?? ''},
    );
    return response;
  }

  Future<http.Response> getSuggestDictionary(String? hash) async {
    if (useMockData) {
      return Future.value(http.Response.bytes(
        utf8.encode(_mockSuggestDictionaryResponseJson),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      ));
    }

    final uri = Uri.parse('$baseUrl/suggest_dictionary');
    final response = await http.get(
      uri,
      headers: {'If-None-Match': hash ?? ''},
    );
    return response;
  }

  // Mock data as JSON strings
  static final String _mockStockMasterResponseJson = json.encode({
    "hash": "mock_stock_master_hash",
    "updateFlag": true,
    "exchangeMap": {
      "TSE": "Tokyo Stock Exchange",
      "NYSE": "New York Stock Exchange",
      "NASDAQ": "NASDAQ Stock Market",
      "LSE": "London Stock Exchange",
      "HKEX": "Hong Kong Stock Exchange"
    },
    "divisionCodeMap": {
      "01": "First Section",
      "02": "Second Section",
      "M": "Mothers",
      "J": "JASDAQ",
      "F": "Foreign Section"
    },
    "symbolItems": [
      {
        "symbol": "7203",
        "name": "Toyota Motor Corporation",
        "sName": "Toyota",
        "nameYomi": "トヨタ自動車",
        "nameYomiEn": "toyota jidousha",
        "category": "Automobile",
        "mainEx": "TSE",
        "exInfo": [
          {"ex": "TSE", "div": "01", "exName": "Tokyo Stock Exchange"},
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "AAPL",
        "name": "Apple Inc.",
        "sName": "Apple",
        "nameYomi": "アップル",
        "nameYomiEn": "appuru",
        "category": "Technology",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "MSFT",
        "name": "Microsoft Corporation",
        "sName": "Microsoft",
        "nameYomi": "マイクロソフト",
        "nameYomiEn": "maikurosofuto",
        "category": "Technology",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "AMZN",
        "name": "Amazon.com Inc.",
        "sName": "Amazon",
        "nameYomi": "アマゾン",
        "nameYomiEn": "amazon",
        "category": "E-commerce",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "GOOGL",
        "name": "Alphabet Inc.",
        "sName": "Google",
        "nameYomi": "グーグル",
        "nameYomiEn": "guuguru",
        "category": "Technology",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "FB",
        "name": "Facebook, Inc.",
        "sName": "Facebook",
        "nameYomi": "フェイスブック",
        "nameYomiEn": "feisubukku",
        "category": "Social Media",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "BABA",
        "name": "Alibaba Group Holding Limited",
        "sName": "Alibaba",
        "nameYomi": "アリババ",
        "nameYomiEn": "aribaba",
        "category": "E-commerce",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "TSM",
        "name": "Taiwan Semiconductor Manufacturing Company Limited",
        "sName": "TSMC",
        "nameYomi": "台湾セミコンダクター",
        "nameYomiEn": "taiwan semiconductor",
        "category": "Semiconductor",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "V",
        "name": "Visa Inc.",
        "sName": "Visa",
        "nameYomi": "ビザ",
        "nameYomiEn": "biza",
        "category": "Financial Services",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "JPM",
        "name": "JPMorgan Chase & Co.",
        "sName": "JPMorgan",
        "nameYomi": "JPモルガン・チェース",
        "nameYomiEn": "JP Morgan Chase",
        "category": "Banking",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "JNJ",
        "name": "Johnson & Johnson",
        "sName": "J&J",
        "nameYomi": "ジョンソン・エンド・ジョンソン",
        "nameYomiEn": "Johnson & Johnson",
        "category": "Healthcare",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "WMT",
        "name": "Walmart Inc.",
        "sName": "Walmart",
        "nameYomi": "ウォルマート",
        "nameYomiEn": "Walmart",
        "category": "Retail",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "UNH",
        "name": "UnitedHealth Group Incorporated",
        "sName": "UnitedHealth",
        "nameYomi": "ユナイテッドヘルス・グループ",
        "nameYomiEn": "UnitedHealth Group",
        "category": "Healthcare",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "MA",
        "name": "Mastercard Incorporated",
        "sName": "Mastercard",
        "nameYomi": "マスターカード",
        "nameYomiEn": "Mastercard",
        "category": "Financial Services",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "NVDA",
        "name": "NVIDIA Corporation",
        "sName": "NVIDIA",
        "nameYomi": "エヌビディア",
        "nameYomiEn": "NVIDIA",
        "category": "Technology",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "DIS",
        "name": "The Walt Disney Company",
        "sName": "Disney",
        "nameYomi": "ディズニー",
        "nameYomiEn": "Disney",
        "category": "Entertainment",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "PYPL",
        "name": "PayPal Holdings, Inc.",
        "sName": "PayPal",
        "nameYomi": "ペイパル",
        "nameYomiEn": "PayPal",
        "category": "Financial Technology",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "ADBE",
        "name": "Adobe Inc.",
        "sName": "Adobe",
        "nameYomi": "アドビ",
        "nameYomiEn": "Adobe",
        "category": "Software",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
      {
        "symbol": "PFE",
        "name": "Pfizer Inc.",
        "sName": "Pfizer",
        "nameYomi": "ファイザー",
        "nameYomiEn": "Pfizer",
        "category": "Pharmaceutical",
        "mainEx": "NYSE",
        "exInfo": [
          {"ex": "NYSE", "div": "", "exName": "New York Stock Exchange"}
        ]
      },
      {
        "symbol": "NFLX",
        "name": "Netflix, Inc.",
        "sName": "Netflix",
        "nameYomi": "ネットフリックス",
        "nameYomiEn": "Netflix",
        "category": "Entertainment",
        "mainEx": "NASDAQ",
        "exInfo": [
          {"ex": "NASDAQ", "div": "", "exName": "NASDAQ Stock Market"}
        ]
      },
    ],
  });

  static final String _mockSuggestDictionaryResponseJson = json.encode({
    "hash": "mock_suggest_dictionary_hash",
    "updateFlag": true,
    "keywordItems": [
      {
        "symbol": "7203",
        "keywordList": ["Toyota", "Car", "Automobile", "Japan", "Hybrid"]
      },
      {
        "symbol": "AAPL",
        "keywordList": ["Apple", "iPhone", "Mac", "iPad", "Technology"]
      },
      {
        "symbol": "MSFT",
        "keywordList": ["Microsoft", "Windows", "Office", "Cloud", "Azure"]
      },
      {
        "symbol": "AMZN",
        "keywordList": ["Amazon", "E-commerce", "AWS", "Prime", "Alexa"]
      },
      {
        "symbol": "GOOGL",
        "keywordList": ["Google", "Search", "Android", "YouTube", "AI"]
      },
      {
        "symbol": "FB",
        "keywordList": [
          "Facebook",
          "Social Media",
          "Instagram",
          "WhatsApp",
          "Oculus"
        ]
      },
      {
        "symbol": "BABA",
        "keywordList": ["Alibaba", "E-commerce", "China", "Taobao", "Tmall"]
      },
      {
        "symbol": "TSM",
        "keywordList": ["TSMC", "Semiconductor", "Chip", "Taiwan", "Foundry"]
      },
      {
        "symbol": "V",
        "keywordList": [
          "Visa",
          "Payment",
          "Credit Card",
          "Financial Services",
          "Digital Wallet"
        ]
      },
      {
        "symbol": "JPM",
        "keywordList": [
          "JPMorgan",
          "Bank",
          "Investment Banking",
          "Financial Services",
          "Chase"
        ]
      },
      {
        "symbol": "JNJ",
        "keywordList": [
          "Johnson & Johnson",
          "Healthcare",
          "Pharmaceutical",
          "Medical Devices",
          "Consumer Health"
        ]
      },
      {
        "symbol": "WMT",
        "keywordList": [
          "Walmart",
          "Retail",
          "Supermarket",
          "E-commerce",
          "Sam's Club"
        ]
      },
      {
        "symbol": "UNH",
        "keywordList": [
          "UnitedHealth",
          "Healthcare",
          "Insurance",
          "Optum",
          "Medicare"
        ]
      },
      {
        "symbol": "MA",
        "keywordList": [
          "Mastercard",
          "Payment",
          "Credit Card",
          "Financial Services",
          "Digital Wallet"
        ]
      },
      {
        "symbol": "NVDA",
        "keywordList": ["NVIDIA", "GPU", "AI", "Gaming", "Data Center"]
      },
      {
        "symbol": "DIS",
        "keywordList": [
          "Disney",
          "Entertainment",
          "Theme Parks",
          "Streaming",
          "Marvel"
        ]
      },
      {
        "symbol": "PYPL",
        "keywordList": [
          "PayPal",
          "Digital Payment",
          "Fintech",
          "Venmo",
          "Braintree"
        ]
      },
      {
        "symbol": "ADBE",
        "keywordList": [
          "Adobe",
          "Software",
          "Creative Cloud",
          "Photoshop",
          "PDF"
        ]
      },
      {
        "symbol": "PFE",
        "keywordList": [
          "Pfizer",
          "Pharmaceutical",
          "Vaccine",
          "Drug",
          "Healthcare"
        ]
      },
      {
        "symbol": "NFLX",
        "keywordList": [
          "Netflix",
          "Streaming",
          "Entertainment",
          "Original Content",
          "Binge-watching"
        ]
      },
    ],
  });
}
