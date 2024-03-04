import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class hom extends StatefulWidget {
  const hom({super.key});

  @override
  State<hom> createState() => _homState();
}

class _homState extends State<hom> {

  bool _obsecure = true;
  var size,height,width;
  final _key = GlobalKey<FormState>();
  bool _isSaveButtonEnabled = false;

  void _toggleSaveButton() {
    setState(() {
      _isSaveButtonEnabled = _key.currentState!.validate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("T A S K D E T A I L S ",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600,fontSize: 23)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.yellowAccent,),
                  hintText: "Enter the Name",hintStyle: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)
                  )
                ),
                validator: (name) {
                  if (name == null || name.isEmpty || name.length>16 || name.length<3) {
                    return 'Please enter your name';
                  }

                  final RegExp nameRegex = RegExp(r"^[a-zA-Z ]+$");
                  if (!nameRegex.hasMatch(name)) {
                    return 'Only letters and single spaces are allowed';
                  }

                  if (name.contains('  ')) {
                    return 'Only one space is allowed between names';
                  }

                  return null; // Name is valid
                },
                  onChanged: (_) => _toggleSaveButton(),
               
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,color: Colors.yellowAccent),
                    hintText: "Enter the Mobile Number",hintStyle: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
                validator: (phone){
                final regExp = RegExp(r'^[6789][0-9]+$');
                if (!regExp.hasMatch(phone!)) {
                   return 'Phone number must start with 6, 7, 8, or 9';
                 }

                  return null;
              },
                onChanged: (_) => _toggleSaveButton(),


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail,color: Colors.yellowAccent),
                    hintText: "Enter the Email",hintStyle: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
                validator: (mail)
                {
                  if(mail == null || mail.isEmpty || ! RegExp(r"^[a-z0-9.a-z0-9!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+")
                  .hasMatch(mail))
                  {
                    return "please enter valid name";
                  }
                  if (!EmailValidator.validate(mail)) {
                    return 'Please enter a valid email address';
                  }

                },
                onChanged: (_) => _toggleSaveButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.lock,color: Colors.yellowAccent),
                    prefixIcon: Icon(Icons.lock,color: Colors.yellowAccent,),
                    hintText: "Enter the Password",hintStyle: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
                validator: (passw){
                  if(passw == null || passw.isEmpty || passw.length >16 || passw.length<8 || ! RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(passw)){
                    return "please enter valid correct password";
                  }

                },
                onChanged: (_) => _toggleSaveButton(),
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: _isSaveButtonEnabled,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
              ,onPressed: () {
                setState(() {
                  if (_key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                        ),
                          content: Text('Successfully done',style: TextStyle(color: Colors.white),)),
                    );
                  }
                });
              },
              child: Text('Click Here',style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage("https://d2ms8rpfqc4h24.cloudfront.net/flutter_sdk2_9578b31bc8.jpg"),fit: BoxFit.fill
                  )
                ),

              ),
            )
            
          ],
        ),
      ),
    
    );
  }
}



