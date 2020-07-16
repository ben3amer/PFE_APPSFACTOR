import 'package:pfe_appsfactor/ui/shared/ui_helpers.dart';
import 'package:pfe_appsfactor/ui/widgets/busy_button.dart';
import 'package:pfe_appsfactor/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:pfe_appsfactor/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';
import 'package:pfe_appsfactor/viewmodels/signup_view_model.dart';
import 'package:pfe_appsfactor/ui/widgets/expansion_list.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  /*final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  */
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              
              // Add additional user data here to save (episode 2)
               InputField(
                placeholder: 'FullName',
                controller: fullNameController,
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
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceSmall,
              ExpansionList<String>(
                  items: ['Femme', 'Homme'],
                  title: model.selectedGender,
                  onItemSelected: model.setSelectedGender),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        fullName: fullNameController.text,
                      );
                    },
                  )
                ],
              ),
              verticalSpaceSmall,
                 _divider(),
                 verticalSpaceSmall,
                TextLink(
                  'Already have an account ?',
                  onPressed: () {
                    model.navigateToLogin();
                  },
                )
            ],
          ),
        ),
      ),
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