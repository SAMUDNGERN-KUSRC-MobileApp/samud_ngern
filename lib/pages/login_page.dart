import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotPasswordPage.dart';
import 'registPage.dart';
import '../utility/alert.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     //ให้แอปหมุนๆรอ
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    // );

    try {
      //try catch ถ้ากรอกถูกไป try กรอกผิดไป catch
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      // Navigator.pop(context); // pop กลับไปหน้า auth แล้วถ้า login เสร็จแล้วหน้า auth จะเปลี่ยนไป
    }

    on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        //e เป็นอะไรก็ได้ เอาไว้เก็บ error .code เอาไว้ดูโค้ดที่แอปส่งกลับมาว่าขึ้นว่าอะไร ถ้าขึ้น user not found (ต้องไปเช็คเอาว่าปัจจุบัน code error มีอะไรบ้าง) แต่ตอนนี้ใช้แบบนี้ก่อน
        showAlert('User not found!', 'Please Register!', context);
      } else if (e.code == 'invalid-credential') {
        showAlert('Password incorrect!', 'Your password is incorrect!', context);
      } else if (e.code == 'too-many-requests') {
        showAlert('Too Many Request!', 'You have login with incorrect password many time! Please try again later.', context);
      }
      // ignore: use_build_context_synchronously
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 1200,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [

                  const SizedBox(height: 48),

                  const Image(image: AssetImage('assets/images/samud-ngern-logo_256.png')),

                  const SizedBox(height: 10),

                  const Text('SAMUD-NGERN',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          autofocus: true,
                          validator: (value) {
                            if (value!.isEmpty) return 'กรุณากรอก email';
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue , width: 2)),
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.mail_rounded, size: 20),
                            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
                            labelText: 'Email',
                            hintStyle: TextStyle(fontWeight: FontWeight.w300),
                            hintText: 'example@gmail.com',
                          ),
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) return 'กรุณากรอก password';
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue , width: 2)),
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.lock, size: 20),
                            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
                            labelText: 'Password',
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const forgotPasswordPage()
                                  )
                                );
                              },
                              child: const Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.w300),),
                            ),

                            const SizedBox(width: 12)
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUserIn();
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),

                      ]
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?', style: TextStyle(fontWeight: FontWeight.w300)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const registPage()));
                        },
                        child: const Text('Register here')
                      )
                    ],
                  )

                ],
              ),
            )
          ),
        ),
      );
  }
}
