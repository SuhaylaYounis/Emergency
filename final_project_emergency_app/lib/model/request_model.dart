import 'package:flutter/cupertino.dart';

class RequestsModel with ChangeNotifier {
  List<String> serviceNames = [];

  void addRequest(String serviceName) {
    serviceNames.add(serviceName);
    notifyListeners();
  }
}
