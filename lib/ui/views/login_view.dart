import 'package:pfe_appsfactor/ui/shared/ui_helpers.dart';
import 'package:pfe_appsfactor/ui/widgets/busy_button.dart';
import 'package:pfe_appsfactor/ui/widgets/input_field.dart';
import 'package:pfe_appsfactor/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:pfe_appsfactor/viewmodels/login_view_model.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginView extends StatelessWidget {
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

  @override

Widget build(BuildContext context){
  return ViewModelBuilder<LoginViewModel>.reactive(
    viewModelBuilder: () => LoginViewModel(),
   builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 130,
                  child: Image.asset('assets/images/logo.png'),
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
                verticalSpaceSmall,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                 
                  children: [
                    
                    BusyButton(
                      
                      title: 'Login',
                      busy: model.busy,
                      onPressed: () {
                        model.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    )
                  ],
                ),
                verticalSpaceSmall,
                _divider(),
                SignInButton(
                   Buttons.Google,
                   padding: const EdgeInsets.fromLTRB(50, 3, 50, 3),
                   
                     onPressed: () {
                       model.signInGoogle();
                     },
                  ),
                  verticalSpaceSmall,
                SignInButton(
                  Buttons.Facebook,
                  padding: const EdgeInsets.fromLTRB(50, 13, 50, 13),
                  onPressed: () {
                    model.signInFacebook();
                  },
                ),
                  verticalSpaceSmall,
                  _divider(),
                TextLink(
                  'Create an Account if you\'re new.',
                  onPressed: () {
                    model.navigateToSignUp();
                  },
                )
              ],
            ),
          )),
    );
  }
}
 Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }