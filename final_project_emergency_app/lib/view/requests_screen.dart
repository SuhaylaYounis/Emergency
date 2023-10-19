import 'package:final_project_emergency_app/model/request_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view model/phone_number_view_model.dart';

class RequestsScreen extends StatelessWidget {
  final String selectedServiceName;
  final String status = "status";

  RequestsScreen({required this.selectedServiceName});
  @override
  Widget build(BuildContext context) {
    final requestsModel = Provider.of<RequestsModel>(context);

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Requests',style: TextStyle(fontSize: 25)),
      ),
      body: Column(
        children: <Widget>[
          for (String serviceName in requestsModel.serviceNames)
            Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(serviceName),
                    Text(status),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
