import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailAddress = TextEditingController();
  var Password =TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultFormFeild(
                      controller: emailAddress,
                      label: 'email address',
                      prefix: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                      validate: ( String value){
                        if(value.isEmpty){
                          return ' email must be not empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultFormFeild(
                      controller: Password,
                      label: 'password',
                      prefix: Icons.lock,
                      type: TextInputType.emailAddress,
                      isPassword: isPasswordShow,
                      suffix: isPasswordShow ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      iconButton: (){
                        setState(() {
                          isPasswordShow = ! isPasswordShow;
                        });
                      },
                      validate: ( String value){
                        if(value.isEmpty){
                          return ' password must be not empty';
                        }
                        return null;
                      }

                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultButton(
                    text: 'login',
                    function: ()
                    {
                      if(formKey.currentState.validate()){
                        print(emailAddress.text);
                        print(Password.text);
                      }
                    },

                  ),
                  SizedBox(
                    height: 25,
                  ),
                  defaultButton(
                    text: 'login',
                    function: ()
                    {
                      print(emailAddress.text);
                      print(Password.text);
                    },
                    isUpperCase: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        child: Text(
                          'Sign Up',
                        ),
                        onPressed: (){},
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


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  @required Function function,
  @required String text,
  double raduis = 20.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
    );

Widget defaultFormFeild({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isClickable = true,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Function iconButton,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: iconButton,
        )
            : null,
      ),
    );
