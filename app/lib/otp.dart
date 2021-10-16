import 'package:flutter/material.dart';

class otpPage extends StatefulWidget {
  final String originalOtp;
  const otpPage({Key? key, required this.originalOtp}) : super(key: key);
  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  TextEditingController otpcontroller = TextEditingController();
  final _otpformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
            height: 50, width: 150, child: Image.asset("assets/logo3.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text("Enter OTP"),
            ),
            Form(
                key: _otpformKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: otpcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter OTP";
                        } else if (value.compareTo(widget.originalOtp) == 0) {
                          return "Please enter Coreect OTP";
                        }
                      },
                    ),
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        if (_otpformKey.currentState!.validate()) {
                          print("Success");
                        }
                      },
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
