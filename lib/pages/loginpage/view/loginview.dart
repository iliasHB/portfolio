

import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_style.dart';


class GuestLogin extends StatelessWidget {
  const GuestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white60,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            //key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Guest Login',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0.0, bottom: 20),
                          child: Text(
                              'To view my portfolio as guest use the credentials below: username: Guest, password: guest123', style: AppStyle.InfoHandle,)
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 5.0),
                        //   child: Text(''),
                        // )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),

                  child: TextFormField(
                      //controller: controller.email_phoneNo,
                      decoration: const InputDecoration(
                          hintText: '',
                          labelText: 'Email/PhoneNo',
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email/phoneNo is empty";
                        }
                        return null;
                      }),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Colors.grey[300],
                  ),
                  child: TextFormField(
                      //controller: controller.pwd,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'password',
                          labelText: 'Password',
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is empty";
                        }
                        return null;
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BackButton(
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                    Spacer(),
                    ElevatedButton.icon(
                        onPressed: () {
                          //handleLogIn(context);
                        },
                        icon: Icon(Icons.input),
                        label: Text('Login')),


                  ],
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Text("New to Spotlighter?"),
                // OutlinedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/registerpage');
                //     },
                //     child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dev_assessment/dashboard_page.dart';
// import 'package:flutter_dev_assessment/service/firebase_auth.dart';
//
// import 'controller/login_controller.dart';
//
// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);
//   final _signInFormKey = GlobalKey<FormState>();
//
//   LoginController controller = LoginController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.white60,
//       body: Align(
//         alignment: Alignment.center,
//         child: Container(
//           margin: EdgeInsets.all(20),
//           alignment: Alignment.center,
//           child: Form(
//             key: _signInFormKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               'SportLighter',
//                               style: TextStyle(
//                                   fontSize: 35,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                         Padding(
//                           padding: EdgeInsets.only(top: 10.0, bottom: 50),
//                           child: Text(
//                               'Flutter Development Assessment\nLoginIn here'),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 5.0),
//                           child: Text('Phone number login format(+234 0000000000)'),
//                         )
//                       ],
//                     )),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey[300],
//                   ),
//
//                   child: TextFormField(
//                       controller: controller.email_phoneNo,
//                       decoration: const InputDecoration(
//                           hintText: '',
//                           labelText: 'Email/PhoneNo',
//                           border: InputBorder.none
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Email/phoneNo is empty";
//                         }
//                         return null;
//                       }),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color:  Colors.grey[300],
//                   ),
//                   child: TextFormField(
//                       controller: controller.pwd,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                           hintText: 'password',
//                           labelText: 'Password',
//                           border: InputBorder.none
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Password is empty";
//                         }
//                         return null;
//                       }),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton.icon(
//                         onPressed: () {
//                           handleLogIn(context);
//                         },
//                         icon: Icon(Icons.input),
//                         label: Text('Login')),
//                     SizedBox(width: 20,),
//                     OutlinedButton(
//                         onPressed: (){
//                           Navigator.pushNamed(context, '/forgotpasswordpage');
//                         },
//                         child: Text('Forgot Password')),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text("New to Spotlighter?"),
//                 OutlinedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/registerpage');
//                     },
//                     child: Text('Register'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void handleLogIn(BuildContext context) async {
//     final password = controller.pwd.text;
//     final email_phone = controller.email_phoneNo.text;
//     if (_signInFormKey.currentState!.validate()) {
//       controller.createUserLogin(password: password, email_phone: email_phone, context: context);
//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => DashboardPage()));
//     }
//   }
// }