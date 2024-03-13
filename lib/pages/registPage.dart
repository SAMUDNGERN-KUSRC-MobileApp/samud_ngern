import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registPage extends StatefulWidget {
  const registPage({super.key});

  @override
  State<registPage> createState() => _registPageState();
}

class _registPageState extends State<registPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      // เข้า try ไปเช็คว่า password กับ confirmPassword ตรงกันไหม ถ้าตรง ก็สร้างแล้ว pop ไม่ตรง print Password dont match ถ้าเกิด error ตรง if เข้า catch แล้ว print e.message
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } else {
        print('Password Dont\'t match');
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:
              Text('Example Firebase', style: TextStyle(color: Colors.white)),
        ),
        actions: const [Icon(Icons.help, color: Colors.white)],
        backgroundColor: const Color.fromRGBO(40, 84, 48, 1),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                  child: Text(
                'Create accout',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'กรุณากรอก email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'กรุณากรอกรหัสผ่าน';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'กรุณากรอกรหัสยืนยัน';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUserUp();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(164, 190, 123, 1)),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
