// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:netzary_task/modals/data_modal.dart';

enum Status { loading, success, error }

// final apip = ApiProvider();

final dataModalProvider =
    ChangeNotifierProvider<ApiProvider>((ref) => ApiProvider());

class ApiProvider extends ChangeNotifier {
  Status status = Status.loading;
  DataModal? dataModal;
  List<BackgroundImages> backImages = [];
  List<Data> data = [];
  apiInitiate() async {
    print('Enter in fn');
    http.Response response = await http
        .get(Uri.parse('http://milkiyat.bangalore2.com/api/home/'), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*",
    });
    print('Api called');
    if (response.statusCode == 200) {
      print('response body');
      // print(response.body);
      print(response.body);
      // print(jsonDecode(response.body)['categories']);
      status = Status.success;
      print(status);
      print('success');
      dataModal = DataModal.fromJson(jsonDecode(response.body));
      print(' data length is ${dataModal!.data.length}');
      backImages = dataModal!.backgroundImages;
      data = dataModal!.data;
      print('background length is ${dataModal!.backgroundImages.length}');
      notifyListeners();
    } else {
      status = Status.error;
      dataModal = null;
      print('error');
      print(status);
      notifyListeners();
    }
  }
}
