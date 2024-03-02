import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pilot_dashboard.dart';

class PilotSignUpScreen extends StatefulWidget {
  const PilotSignUpScreen({Key? key}) : super(key: key);

  @override
  _PilotSignUpScreenState createState() => _PilotSignUpScreenState();
}

class _PilotSignUpScreenState extends State<PilotSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _busRegistrationNumber = '';
  String _employeeID = '';
  String _password = '';
  final String _confirmPassword = '';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var busRegNumberField = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Bus Registration Number',
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a Bus Registration Number';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _busRegistrationNumber = value.toString();
        }
      },
    );

    var employeeIDField = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Employee ID',
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an Employee ID';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _employeeID = value.toString();
        }
      },
    );

    var passwordField = TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      validator: (value) {
        if (value == null || value.length < 8) {
          return 'Password should be at least 8 characters';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _password = value.toString();
        }
      },
    );

    var confirmPasswordField = TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (_password.isNotEmpty && value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'B.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Pilot',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 229, 228),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '\nBus Pilot Operator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Sign Up as a ',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8), // Add some space between icon and text
                    Icon(Icons.directions_bus, size: 40), // Add bus icon here
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: busRegNumberField,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: employeeIDField,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: passwordField,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: confirmPasswordField,
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // Perform sign-up with _busRegistrationNumber, _employeeID, _password, _confirmPassword
                          // Add your sign-up logic here

                          // After successful signup, show the PilotDashboardScreen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PilotDashboardScreen(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(color: Colors.black),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
