import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyForm> {
  
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
   String? _lastName;
   String? _emailAddress;
   String? _phoneNumber;
   
   String? _password;
  //  String? _validateName(String? value){
  //    if (value?.isEmpty ?? false){
  //      return 'Name is Required';
  //    }
  //    return null;
  //  }


  @override
  Widget build(BuildContext context) {
   
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24,),
            TextFormField(textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What is your First name',
              labelText: 'first Name',
            ),

            validator: (value) {
              
            if (value == null || value.isEmpty) {

                  return 'Please enter first name';
               }
                   return null;
                 },
                  ),
              
              
            
            SizedBox(height: 24,),
            TextFormField(textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What is your Last Name',
              labelText: 'Last Name',
            ),
            validator: (value) {
            if (value == null || value.isEmpty) {
                  return 'Please enter last name';
               }
                   return null;
                 },
                 
           
            ),
            SizedBox(height: 24,),
            TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email_outlined),
              hintText: 'What is Email',
              labelText: 'email',
               
            ),
            validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value==null) {
            return 'Enter an email';
          } else if (!regExp.hasMatch(value)) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        },
            ),
            SizedBox(height: 24,),
            TextFormField(textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone_android),
              hintText: 'What is your phone number',
              labelText: 'Phone Number',
              prefixText:'+91', 
            ),
            ),
            SizedBox(height: 24,),
              TextFormField(textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.password_rounded),
              hintText: 'What is your password',
              labelText: 'Password',
              
            ),
            ),
            ElevatedButton(
             onPressed: () {
  
                if (_formKey.currentState!.validate()) {
      
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
                );
                }
                 },
                    child: const Text('Submit'),
),
           
            
    
            
          ],
        ),
        
      ),
    );
    
  }
}