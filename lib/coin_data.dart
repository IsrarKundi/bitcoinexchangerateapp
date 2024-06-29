//2. Import the required packages.
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'F89A617A-5EA1-4BC4-A42D-2C3F484A302B';


class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String coin,String currency) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String requestURL = '$coinAPIURL/$coin/$currency?apikey=$apiKey';
    //5. Convert the URL string to a Uri object.
    Uri uri = Uri.parse(requestURL);
    //6. Make a GET request to the URL and wait for the response.
    http.Response response = await http.get(uri);

    //7. Check that the request was successful.
    if (response.statusCode == 200) {
      //8. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //9. Get the last price of bitcoin with the key 'rate'.
      var lastPrice = decodedData['rate'];
      //10. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //11. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}
