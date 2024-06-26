import 'package:flutter/material.dart';

class RegisterSixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff1E1E1F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(child: Image.asset('Assets/logo.png', height: 150)),
                const SizedBox(height: 20),
                const TextFrave(
                  text: 'Create Account',
                  color: Color.fromARGB(255, 248, 247, 247),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),

                const SizedBox(height: 20),
                _TextFieldCustom(label: 'Name', isPass: false),
                const SizedBox(height: 20),
                _TextFieldCustom(label: 'Email', isPass: false),
                const SizedBox(height: 20),
                _TextFieldCustom(label: 'Password', isPass: true),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextFrave(
                      text: 'Sign Up',
                      color: Color.fromARGB(255, 243, 241, 241),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromARGB(255, 199, 189, 189),
                              Color.fromARGB(255, 180, 174, 171),
                            ],
                          ),
                        ),
                        child: const Icon(Icons.arrow_forward, size: 35, color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 70),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'loginSixPage'),
                  child: const TextFrave(
                    text: 'Sign In',
                    color: Color.fromARGB(255, 79, 62, 231),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFieldCustom extends StatelessWidget {
  final String label;
  final bool isPass;

  const _TextFieldCustom({required this.label, required this.isPass});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        obscureText: isPass,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

class TextFrave extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextFrave({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? const Color.fromARGB(255, 243, 240, 240),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

