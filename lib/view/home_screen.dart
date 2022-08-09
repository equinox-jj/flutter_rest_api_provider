import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../notifier/data_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final responseModel = Provider.of<DataClass>(context, listen: false);
    responseModel.getResponseData();
  }

  @override
  Widget build(BuildContext context) {
    final responseModel = Provider.of<DataClass>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("RestApp"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: responseModel.loading
            ? Center(
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index.isEven ? Colors.red : Colors.green,
                      ));
                    },
                  ),
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        responseModel.post?.title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        responseModel.post?.body ?? "",
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
