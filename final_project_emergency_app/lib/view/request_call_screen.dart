import 'package:final_project_emergency_app/model/request_model.dart';
import 'package:final_project_emergency_app/view/requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view model/location_veiw_model.dart';
import '../view model/phone_number_view_model.dart';

class RequestCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhoneNumberViewModel>(context);
    final requestsModel = Provider.of<RequestsModel>(context);
    final locationViewModel = Provider.of<LocationViewModel>(context);

    return Scaffold(
      //resizeToAvoidBottomInset:false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Request Call', style: TextStyle(fontSize: 25)),
      ),
      body: SingleChildScrollView(
        padding:EdgeInsets.all( 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/help.png", height: 130, width: 200,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text('Service Name:', style: TextStyle(fontSize: 25)),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_sharp, size: 50),
                      value: viewModel.selectedLabel,
                      items: viewModel.phoneNumbers.map((phoneNumber) {
                        return DropdownMenuItem<String>(
                          value: phoneNumber.label,
                          child: Text(phoneNumber.label, style: TextStyle(fontSize: 20)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        viewModel.setSelectedPhoneNumber(newValue);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Name:', style: TextStyle(fontSize: 25),)),
                Expanded(
                  flex: 2,
                  child: TextFormField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        labelText: 'Your Name',
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Phone:', style: TextStyle(fontSize: 25),)),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        labelText: '+20xxxxxxxxxx',
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text('Address:', style: TextStyle(fontSize: 25)),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: TextEditingController(text: locationViewModel.address ?? ''),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: 'st maadi',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await locationViewModel.updateLocation();
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.red, // background (button) color
                foregroundColor: Colors.white,),
              onPressed: ()  {
                final selectedServiceName = viewModel.selectedLabel;
                if (selectedServiceName != null) {
                  requestsModel.addRequest(selectedServiceName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestsScreen(selectedServiceName: selectedServiceName),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Request Call",style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
