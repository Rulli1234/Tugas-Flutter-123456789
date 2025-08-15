import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final bool _obsecurePassword = true;
  bool _obsecurConfirmPassword = true;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Column(
        children: [
          // Height of container
          Container(height: 75),

          // Expanded
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),

              // animation
              child: FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 24,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 48),
                          Row(
                            children: [
                              const Text(
                                "Welcome Back",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 48),
                          const SizedBox(height: 4),
                          const Text(
                            "Welcome back. Have a good money time",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gilroy',
                            ),
                          ),

                          // Container form fields
                          SizedBox(height: 32),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(199, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Column(
                              children: [
                                // Email Field
                                TextFormField(
                                  controller: emailController,
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'Enter your email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email is required';
                                    }
                                    if (!RegExp(
                                      r'^[^@]+@[^@]+\.[^@]+',
                                    ).hasMatch(value)) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),

                                // Divider / Spacer
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(
                                    color: Color.fromARGB(255, 189, 187, 187),
                                    height: 1,
                                    thickness: 1,
                                  ),
                                ),

                                // Password Field
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _obsecurConfirmPassword,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obsecurConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obsecurConfirmPassword =
                                              !_obsecurConfirmPassword; // Toggle visibility
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Form password logic
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Color(0xFF999999)),
                              ),
                            ),
                          ),

                          // Register logic
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final name = nameController.text;
                                  final email = emailController.text;
                                  final password = passwordController.text;
                                  final confirmPassword =
                                      confirmPasswordController.text;

                                  // Handle login process
                                  print("Logging in with $email and $password");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  211,
                                  211,
                                  211,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ), // 8–12 px radius
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              child: const Text(
                                "Register",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
