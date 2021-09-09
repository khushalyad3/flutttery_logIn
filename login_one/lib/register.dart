import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterUserId extends StatefulWidget {
  @override
  _RegisterUserIdState createState() => _RegisterUserIdState();
}

class _RegisterUserIdState extends State<RegisterUserId> {
  RegExp regex;
  var email=0;
  var password=0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GestureDetector(
           onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
           child: AnnotatedRegion<SystemUiOverlayStyle>(
             value: SystemUiOverlayStyle.light,
             child: Form(
               key: _formKey,
               child:Stack(
                 children: [
                   // Container(
                   //   height: double.infinity,
                   //   width: double.infinity,
                   //   decoration: BoxDecoration(
                   //     gradient: LinearGradient(
                   //       begin: Alignment.topCenter,
                   //       end: Alignment.bottomCenter,
                   //       colors: [
                   //
                   //
                   //         Color(0xFFFCE4EC),
                   //         Color(0xFFF48FB1),
                   //       ],
                   //       stops: [0.5, 0.9],
                   //     ),
                   //   ),
                   // ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Spacer(),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         child:Column(
                           children: [
                             Center(
                               child: Text('Signup',style:TextStyle(
                                 fontSize: 22,
                                 fontWeight:FontWeight.bold,
                               )),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:25.0,right:25),
                               child: TextFormField(
                                 decoration: InputDecoration(
                                   labelText: 'Email',
                                   suffixIcon: email==0?Icon(Icons.cancel,color: Colors.red[300],):Icon( Icons.check_circle,color: Colors.green[300],),
                                   border: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.grey,
                                     width: 1,),
                                   ),
                                   errorBorder:UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.pink[600],
                                       width: 1,),
                                   ),
                                 ),
                                 onChanged: (String value){
                                   Pattern pattern =
                                       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                   regex = new RegExp(pattern);
                                   if(value.isEmpty || value==''){
                                     email=0;
                                     return 'Field should not be empty';
                                   }
                                   else if (!regex.hasMatch(value)) {
                                     email=0;
                                     return 'Enter Valid Email Id';
                                   }
                                   email=1;
                                   return null;
                                 },
                                 validator: (String value) {
                                   Pattern pattern =
                                       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                   regex = new RegExp(pattern);
                                   if(value.isEmpty || value==''){
                                     email=0;
                                     return 'Field should not be empty';
                                   }
                                   else if (!regex.hasMatch(value)) {
                                     email=0;
                                     return 'Enter Valid Email Id';
                                   }
                                   email=1;
                                   return null;
                                 },),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:25.0,right:25),
                               child: TextFormField(
                                 decoration: InputDecoration(
                                   labelText: 'Password',
                                   suffixIcon: password==0?Icon(Icons.cancel,color: Colors.red[300],):Icon( Icons.check_circle,color: Colors.green[300],),
                                   border: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.grey,
                                       width: 1,),
                                   ),
                                   errorBorder:UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.pink[600],
                                       width: 1,),
                                   ),
                                 ),
                                 onChanged: (String value){

                                   if(value.isEmpty || value==''){
                                     password=0;
                                     return 'Field should not be empty';
                                   }
                                   password=1;
                                   return null;
                                 },
                                 validator: (String value) {

                                   if(value.isEmpty || value==''){
                                     password=0;
                                     return 'Field should not be empty';
                                   }
                                   password=1;
                                   return null;
                                 },),
                             ),
                             SizedBox(height: 20,),
                             Container(
                               color: Colors.pink[200],
                               child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Password must be 6 characters long',style:TextStyle(
                                        color: Colors.white,
                                      )),
                                    ),
                                  ],
                               ),
                             ),
                           ],
                         ),
                       ),
                       Spacer(),
                       Padding(
                         padding: const EdgeInsets.only(left:25.0,right:25,bottom:15, ),
                         child: SizedBox(
                           width: double.infinity,
                           height: MediaQuery.of(context).size.height*1/18,
                           child: ElevatedButton(
                             onPressed: (){
                               if (_formKey.currentState.validate()){

                               }
                               else{
                                 final snackBar = SnackBar(
                                   backgroundColor: Colors.pink[100],

                                   content: Text(
                                       'One or more fields have an error. Please check and try again.',style:TextStyle(
                                     color: Colors.black,
                                   )),
                                   duration: Duration(seconds: 5),
                                   action: SnackBarAction(
                                      textColor: Colors.black,
                                     label: 'ok',
                                     onPressed: () {
                                       // Some code to undo the change.
                                     },
                                   ),
                                 );
                                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               }
                             },
                             style: ElevatedButton.styleFrom(
                               primary: Colors.pink,
                               onPrimary: Colors.white,
                             ),
                             child: Center(
                               child: Text('Signup'),
                             ),
                           ),
                         ),
                       ),

                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),

      ),
    );
  }
}
