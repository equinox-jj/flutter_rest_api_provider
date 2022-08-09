import 'package:flutter/foundation.dart';
import 'package:flutter_apps/data/api_service.dart';

import '../model/model.dart';

class DataClass extends ChangeNotifier {
  Response? post;
  bool loading = false;

  getResponseData() async {
    loading = true;
    post = (await getSingleResponse());
    loading = false;

    notifyListeners();
  }

}