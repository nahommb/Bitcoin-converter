import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
 //var url;
 var textdata;
Future getcurrencydata(String selected_currency) async{
   var url = Uri.parse("https://rest.coinapi.io/v1/exchangerate/BTC/$selected_currency?apiKey=DEC86D52-62B0-423F-8204-D13B94164C25");
   http.Response rs = await http.get(url);
   var currencydata = rs.body;
   var decoded_data = jsonDecode(currencydata)["rate"];
   if(rs.statusCode == 200){
     print("Rate of 1BTC = $textdata $selected_currency");
     textdata = decoded_data.toStringAsFixed(2);
   }
   else {
     throw(Exception("Network Error"));
   }
 }
}