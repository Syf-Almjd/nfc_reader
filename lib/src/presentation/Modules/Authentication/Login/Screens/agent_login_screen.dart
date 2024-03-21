import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../config/utils/styles/app_colors.dart';
import '../../../../../data/remote/RemoteData_cubit/RemoteData_cubit.dart';
import '../../../../../domain/models/login/user_login_model.dart';
import '../../../../Shared/Components.dart';
import '../../../../Shared/WidgetBuilders.dart';

class AgentLoginScreen extends StatefulWidget {
  const AgentLoginScreen({super.key});

  @override
  State<AgentLoginScreen> createState() => _AgentLoginScreenState();
}

class _AgentLoginScreenState extends State<AgentLoginScreen> {
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _validateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _validateKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // SigningBloc.get(context)
                  //     .add(SignScreenChange(const LoginLayoutState()));
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                  size: getWidth(10, context),
                ),
              ),
              fadedText(
                  context: context,
                  text: "Welcome Back Agent!",
                  textColor: AppColors.darkColor,
                  textSize: getWidth(5, context),
                  fontWeight: FontWeight.w800),
              SizedBox(
                width: getWidth(10, context),
              )
            ],
          ),
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  showToast("Your Email is incorrect!", AppColors.primaryColor,
                      context);
                  return "Your Email is incorrect";
                }
                return null;
              },
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200)),
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length <= 3) {
                  // showToast(
                  //     "Wrong Password", AppColors.primaryColor, context);
                  return "Wrong Password";
                }
                return null;
              },
              controller: pass,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200)),
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
          getCube(5, context),
          loadButton(
              borderCurveSize: 10,
              buttonWidth: getWidth(100, context),
              textWeight: FontWeight.w600,
              textSize: getWidth(7, context),
              buttonText: "Login",
              onPressed: () {
                if (validateForm(_validateKey)) {
                  submitRequest();
                }
              }),
        ],
      ),
    );
  }

  submitRequest() {
    LoginModelRequest loginModel = LoginModelRequest(
      email: email.text,
      password: pass.text,
    );
    RemoteDataCubit.get(context).loginUser(loginModel, context);
  }
}
