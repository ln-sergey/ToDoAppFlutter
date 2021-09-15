import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/domain/core/value_validators.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
                (l) {
                      FlushbarHelper.createError(
                          message: l.map(
                              cancelledByUser: (_) => 'Cancelled',
                              serverError: (_) => 'Server error',
                              emailAlreadyInUse: (_) => 'Email already in use',
                              invalidPasswordAndEmailCombination: (_) =>
                                  'Invalid Password and Email combination')).show(context);
                    },
                (_) => {
                      // TODO: Navigate
                    }));
      },
      builder: (context, state) {
        return Form(
            autovalidate: state.showErrorMessages,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(children: [
                const Text(
                  '📔',
                  style: TextStyle(fontSize: 130),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email), labelText: 'Email'),
                  autocorrect: false,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                      .state
                      .emailAddress
                      .value
                      .fold(
                          (l) => l.maybeMap(
                                invalidEmail: (_) => 'Invalid Email',
                                orElse: () => null,
                              ),
                          (_) => null),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.passwordChanged(value)),
                  validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                      .state
                      .password
                      .value
                      .fold(
                          (l) => l.maybeMap(
                                shortPassword: (_) => 'Short Password',
                                orElse: () => null,
                              ),
                          (_) => null),
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () =>
                                BlocProvider.of<SignInFormBloc>(context).add(
                                    const SignInFormEvent
                                        .signInWithEmailAndPasswordPressed()),
                            child: const Text('SIGN IN'))),
                    Expanded(
                        child: TextButton(
                            onPressed: () =>
                                BlocProvider.of<SignInFormBloc>(context).add(
                                    const SignInFormEvent
                                        .registerWithEmailAndPasswordPressed()),
                            child: const Text('REGISTER'))),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => BlocProvider.of<SignInFormBloc>(context)
                        .add(const SignInFormEvent.signInWithGooglePressed()),
                    child: const Text('SIGN IN WITH GOOGLE')),
              ]),
            ));
      },
    );
  }
}
