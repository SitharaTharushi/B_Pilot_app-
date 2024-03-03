import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';

class PassengerSignUpScreen extends StatefulWidget {
  const PassengerSignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PassengerSignUpScreenState createState() => _PassengerSignUpScreenState();
}

class _PassengerSignUpScreenState extends State<PassengerSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  bool _isPasswordVisible = false;

  late FocusNode _nicFocusNode;
  late FocusNode _usernameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _nicFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nicFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nicField = TextFormField(
      focusNode: _nicFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        _nicFocusNode.unfocus();
        FocusScope.of(context).requestFocus(_usernameFocusNode);
      },
      decoration: const InputDecoration(
        labelText: 'NIC Number',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || (value.length != 9 && value.length != 12)) {
          return 'Incorrect NIC number!';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {}
      },
    );

    var usernameField = TextFormField(
      focusNode: _usernameFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        _usernameFocusNode.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a username';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {}
      },
    );

    var passwordField = TextFormField(
      focusNode: _passwordFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        _passwordFocusNode.unfocus();
        FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
      },
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
      focusNode: _confirmPasswordFocusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        _confirmPasswordFocusNode.unfocus();
        _submitForm();
      },
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
      validator: (value) {
        if (_password.isNotEmpty && value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
      onSaved: (value) {
        // Use the value if needed
      },
    );

    var signUpButton = SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            // Perform sign-up with _nic, _username, _password
            // Add your sign-up logic here

            // After successful signup, navigate to the dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          }
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: 8, // Reduce vertical padding
              horizontal: 16, // Reduce horizontal padding
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black), // Set border color
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 14, // Reduce font size
            color: Colors.black,
          ),
        ),
      ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Sign Up as a ',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8), // Add some space between icon and text
                  Icon(Icons.person, size: 40), // Add bus icon here
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: nicField,
                        ),
                        const SizedBox(height: 17),
                        SizedBox(
                          width: double.infinity,
                          child: usernameField,
                        ),
                        const SizedBox(height: 17),
                        SizedBox(
                          width: double.infinity,
                          child: passwordField,
                        ),
                        const SizedBox(height: 17),
                        SizedBox(
                          width: double.infinity,
                          child: confirmPasswordField,
                        ),
                        const SizedBox(height: 17),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: signUpButton,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Perform sign-up with _nic, _username, _password
      // Add your sign-up logic here

      // After successful signup, navigate to the dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }
}
