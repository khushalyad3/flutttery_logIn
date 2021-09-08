import 'package:flutter/material.dart';

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
    return Scaffold(
       body: Form(
         key: _formKey,
         child:GestureDetector(
           onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
           child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Spacer(),
               Container(
                 width: MediaQuery.of(context).size.width,
                 padding: EdgeInsets.all(10),
                 child:Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Center(
                         child: Text('Signup',style:TextStyle(
                           fontSize: 18,
                           fontWeight:FontWeight.bold,
                         )),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: TextFormField(
                         decoration: InputDecoration(
                           labelText: 'Email',
                           suffixIcon: email==0?Icon(Icons.cancel,color: Colors.red,):Icon( Icons.check_circle,color: Colors.green,),
                           border: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.grey,
                             width: 1,),
                           ),
                           errorBorder:UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.red,
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
                               return 'Field should not be empty';
                             }
                          else if (!regex.hasMatch(value)) {
                             return 'Enter Valid Email Id';
                           }
                           return null;
                         },),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: TextFormField(
                         decoration: InputDecoration(
                           labelText: 'Password',
                           suffixIcon: password==0?Icon(Icons.cancel,color: Colors.red,):Icon( Icons.check_circle,color: Colors.green,),
                           border: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.grey,
                               width: 1,),
                           ),
                           errorBorder:UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.red,
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
                           Pattern pattern =
                               r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                           regex = new RegExp(pattern);
                           if(value.isEmpty || value==''){
                             return 'Field should not be empty';
                           }
                           else if (!regex.hasMatch(value)) {
                             return 'Enter Valid Email Id';
                           }
                           return null;
                         },),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Container(
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
                     ),
                   ],
                 ),
               ),
               Spacer(),
               BottomAppBar(

                 color: Colors.pink,
                 elevation: 20,
                 child: Container(
                   width: MediaQuery.of(context).size.width,

                   child: TextButton(
                     child:Text('Signup',style:TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                     )),
                     onPressed: (){
                       if (_formKey.currentState.validate()){

                       }
                       else{
                         final snackBar = SnackBar(
                           content: Text(
                               'One or more fields have an error. Please check and try again.'),
                           duration: Duration(seconds: 5),
                           action: SnackBarAction(
                             label: 'ok',
                             onPressed: () {
                               // Some code to undo the change.
                             },
                           ),
                         );
                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       }
                     },
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
