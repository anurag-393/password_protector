import 'package:flutter/cupertino.dart';

class CheckPin extends ChangeNotifier {
  bool isAuthenticated = false;

  void authenticated() {
    isAuthenticated = true;
    notifyListeners();
  }

  bool get authStatus {
    notifyListeners();
    return isAuthenticated;
  }
}
