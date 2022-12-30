import 'package:flutter/material.dart';
import 'package:my_aplication/src/constants.dart';
import 'package:my_aplication/src/form_error.dart';
import 'package:my_aplication/src//screens/custom_sufix_icon.dart';
import 'package:my_aplication/src//size_config.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String lastname;
  late String phoneNumber;
  late String email;
  late String curp;
  late String company;
  final List<String> errors = [];

  void removeError({required String error}) {
    if (error.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (error.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  SizedBox _buttonAcept() {
    return SizedBox(
      width: 400,
      height: getProportionatedScreenHeight(50),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
        child: Text(
          'Aceptar',
          style: TextStyle(
              fontSize: getProportionatedScreenWidth(20), color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildNameformField(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
          _buildLastnameformField(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
          _buildCurpformField(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
          _buildEmailformField(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
          _buildPhoneNumberformField(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
          _buildCompanyNameformField(),
          SizedBox(
            height: getProportionatedScreenHeight(10),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionatedScreenHeight(20),
          ),
          _buttonAcept(),
          SizedBox(
            height: getProportionatedScreenHeight(30),
          ),
        ],
      ),
    );
  }

  TextFormField _buildNameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Nombre",
          hintText: "Tu Nombre",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _buildLastnameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: klastnameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: klastnameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Apellido",
          hintText: "Tu Apellido",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField _buildCurpformField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCurpNullError);
        } else if (curpValidatorRegExp.hasMatch(value)) {
          removeError(error: kCurpNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kCurpNullError);
          return "";
        } else if (!curpValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidCurpError)) {
          addError(error: kInvalidCurpError);
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "CURP",
          hintText: "Ingresa tu curp",
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Question mark.svg")),
    );
  }

  TextFormField _buildEmailformField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Correo",
          hintText: "Tu correo",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField _buildPhoneNumberformField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Número Telefónico",
          hintText: "Tu número",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg")),
    );
  }

  TextFormField _buildCompanyNameformField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCompanyNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kCompanyNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Nombre de la empresa",
          hintText: "Ingresa el nombre",
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Heart Icon_2.svg")),
    );
  }
}
