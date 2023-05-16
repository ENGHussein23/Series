import 'package:getx_series/constants/constans.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SeriesController extends GetxController{
  List series=[169 ,
    335,
    82,
    495,
    182,
    210,
    1505];
  var shows_serie;
  var series_from_api=[].obs;
var se;
  @override
  void onInit() {
    super.onInit();
    getSeries();
  }

  Future<void> getSeries() async {
    for(int i=0;i<series.length;i++){
      Uri myURL =Uri.https("https://api.tvmaze.com/shows/${series[i]}");
      http.Response response = await http.get(myURL);
      var jsonGet = response.body;
      var resFromson;
      try{
        resFromson = json.decode(jsonGet);
      } catch (error) {
        print("the error is:$error");
      }
      shows_serie = Map<String, dynamic>.from(resFromson).obs;
      series_from_api[i].value=shows_serie;
      print("index is $i and the object is ${series_from_api[i]}");
    }
  }
}
// class SeriesController extends GetxController{
//   List series=[169 , 335 , 82 ,495,  182, 210,1505];
//   var shows_serie;
//   var series_from_api=[].obs;
//   @override
//   void onInit() {
//     getSeries();
//     super.onInit();
//   }
//   Future<void> getSeries() async {
//       for(int i=0;i<series.length;i++){
//         Uri myURL =Uri.http("https://api.tvmaze.com","/shows/${series[i]}",{'q':'dart'});
//         http.Response response = await http.get(myURL);
//         var jsonGet = response.body;
//         var resFromson;
//         try{
//           resFromson = json.decode(jsonGet);
//         }
//     catch (error) {
//     print("the error is:$error");
//     }
//         shows_serie = Map<String, dynamic>.from(resFromson).obs;
//         series_from_api[i].value=shows_serie;
//         print("index is $i and the object is ${series_from_api[i]}");
//       }
//
//
//   }
//
// }