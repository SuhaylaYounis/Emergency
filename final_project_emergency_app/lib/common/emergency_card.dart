import 'package:final_project_emergency_app/model/phone_number_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view model/phone_number_view_model.dart';

class CardButton extends StatelessWidget {
  final String phoneNumber;
  final String label;
  final String imageName ;

  CardButton({required this.phoneNumber, required this.label,  required this.imageName, });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhoneNumberViewModel>(context);


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        borderOnForeground: true,
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: InkWell(
          onTap: () {
            viewModel.callPhoneNumber(context, phoneNumber);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'images/$imageName',
                    // Load the image from the "images" directory

                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  //overflow: TextOverflow.ellipsis,
                  //maxLines: 2,
                  label,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
