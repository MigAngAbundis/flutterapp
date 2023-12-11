import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Drawers View Model Controller that communicates with service and model
class DrawersViewModelController with ChangeNotifier {
  ///booleans for left drawer that toggles expansion panel opening or closing
  List<bool> expandIsOpen = List<bool>.filled(3, false);

  ///boolean to indicate whether the user is shown as online to other users or not
  bool? onlineStatusControl = false;

  ///function to toggle online status of the user and save them in shared prefs
  toggleOnlineStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onlineStatusControl = !onlineStatusControl!;
    prefs.setBool("OnlineStatus", !onlineStatusControl!);
    notifyListeners();
  }
}
