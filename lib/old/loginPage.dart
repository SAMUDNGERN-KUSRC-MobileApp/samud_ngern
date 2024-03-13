import 'package:firebase_auth/firebase_auth.dart';
import '../pages/forgotPasswordPage.dart';
import '../pages/registPage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(); //เอาไว้ใส่email
  final passwordController = TextEditingController(); //เอาไว้ใส่ password

  Future<UserCredential> signInWithGoogle() async {
    // ---------------- ของ Google
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          //ให้แอปหมุนๆรอ
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      //try catch ถ้ากรอกถูกไป try กรอกผิดไป catch
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //e เป็นอะไรก็ได้ เอาไว้เก็บ error .code เอาไว้ดูโค้ดที่แอปส่งกลับมาว่าขึ้นว่าอะไร ถ้าขึ้น user not found (ต้องไปเช็คเอาว่าปัจจุบัน code error มีอะไรบ้าง) แต่ตอนนี้ใช้แบบนี้ก่อน
        print('No user found for this email.');
      } else if (e.code == 'worng password') {
        print('Worng password provided for this user');
      }
    }
    Navigator.pop(
        context); // pop กลับไปหน้า auth แล้วถ้า login เสร็จแล้วหน้า auth จะเปลี่ยนไป
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                      color: Colors.grey[100],
                      shape: BoxShape.circle),
                  child: const Icon(Icons.person,
                      size: 150, color: Color.fromRGBO(95, 141, 78, 0.5)),
                ),
              ),

              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'กรุณากรอก email';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'กรุณากรอกรหัสผ่าน';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const forgotPasswordPage()));
                            },
                            child: const Text('Forgot Password?')),
                      ],
                    ),

                    const SizedBox(height: 20),
                    /// This `ElevatedButton` widget is creating a button for the user to log in. Here's
                    /// a breakdown of what it does:
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUserIn(); //ผู้ใช้กดปุ่ม login แล้วเรียกใช้ signUserIn
                        } //ไว้สำหรับเช็คว่าผู้ใช้กรอกหรือยัง
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(164, 190, 123, 1)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text('Or continue with'),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromRGBO(229, 217, 182, 1),
                      child: Icon(Icons.mail_outline, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  /*CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromRGBO(229, 217, 182, 1),
                    child: Icon(Icons.facebook, color: Colors.white),
                  ),*/
                  const SizedBox(width: 10),
                  /*CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromRGBO(229, 217, 182, 1),
                    child: Icon(Icons.apple, color: Colors.white),
                  ),*/
                ],
              ),
              const SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const registPage()));
                      },
                      child: const Text('Register now'),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
