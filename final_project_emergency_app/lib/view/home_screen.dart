import 'package:final_project_emergency_app/view/request_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/emergency_card.dart';
import '../view model/phone_number_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhoneNumberViewModel>(context);
    final cardSize = calculateCardSize(context); //  cardSize calculation

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Emergency Numbers',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("images/call.png", height: 100, width: 100,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.red, // background (button) color
                  foregroundColor: Colors.white,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestCallScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Request A Call",style: TextStyle(fontSize: 25),),
                  )
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: viewModel.phoneNumbers.map((phoneNumber) {
                return SizedBox(
                  width: cardSize.width, // Changed: Set card width
                  height: cardSize.height, // Changed: Set card height
                  child: CardButton(
                    label: phoneNumber.label,
                    phoneNumber: phoneNumber.phoneNumber,
                    imageName: phoneNumber.imageName,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Size calculateCardSize(BuildContext context) {
    // Changed: Added function to calculate card size
    final screenSize = MediaQuery.of(context).size;
    final cardWidth =
        (screenSize.width - 16.0) / 2; // Two cards in a row with spacing
    final cardHeight = screenSize.height / 2; // Two cards in the screen height

    return Size(cardWidth, cardHeight);
  }
}
