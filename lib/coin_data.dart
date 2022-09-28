import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
//
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CF074BA7-D461-448F-83E2-B510EE373B55';

// const bitcoinAverageURL =
//     'https://apiv2.bitcoinaverage.com/indices/global/ticker';
class CoinData {
  getbitcoindata(String currency)async
  {
    var url = Uri.parse("$coinAPIURL/BTC/$currency?apiKey=CF074BA7-D461-448F-83E2-B510EE373B55");
    http.Response response=await http.get(url);
    var data= response.body;
    var deocode=jsonDecode(data);
    var price=deocode['rate'];
    return price;
  }
  getETHdata(String currency)async
  {
    var url=Uri.parse("$coinAPIURL/ETH/$currency?apiKey=CF074BA7-D461-448F-83E2-B510EE373B55");
    http.Response response=await http.get(url);
    var price=jsonDecode(response.body)['rate'];
    return price;
  }
  getLTCdata(String currency)async
  {
    var url=Uri.parse("$coinAPIURL/LTC/$currency?apiKey=CF074BA7-D461-448F-83E2-B510EE373B55");
    http.Response response=await http.get(url);
    var price=jsonDecode(response.body)['rate'];
    return price;
  }
}
