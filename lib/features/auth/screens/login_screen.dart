import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  Country? _country;

  // function to pick the country
  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country country) {
          setState(() {
            _country = country;
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('WhatsApp will need to verify your phone number'),
              const SizedBox(height: 10),
              TextButton(
                onPressed: pickCountry, //pick the country
                child: const Text(
                  'Pick Country',
                  style: TextStyle(
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_country != null) Text('+${_country!.phoneCode}'),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                          hintText: 'phone number',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blueColor),
                          )),
                      cursorColor: blueColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.6),
              SizedBox(
                width: 90,
                child: CustomButton(
                  text: 'NEXT',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
