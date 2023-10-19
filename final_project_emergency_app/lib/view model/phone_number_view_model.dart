import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../model/phone_number_model.dart';

class PhoneNumberViewModel with ChangeNotifier {
  String? _selectedLabel; // Added property to store the selected label
  final List<PhoneNumberModel> phoneNumbers = [
    PhoneNumberModel('123', 'Ambulance', 'ambulance.png'), //main ambulance
    PhoneNumberModel('122', 'Emergency Police', 'Emergency.png'), //emergency police
    PhoneNumberModel('180', 'Fire Departement','fire.png'), //fire departement
    PhoneNumberModel('128', 'Traffic Police','traffic.png'), //traffic police
  ];
  String? get selectedLabel => _selectedLabel; // Getter for selected label

  void setSelectedPhoneNumber(String? label) {
    _selectedLabel = label; // Method to set the selected label
    notifyListeners(); // Notify listeners to update the UI
  }

  void callPhoneNumber(BuildContext context, String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }
}
