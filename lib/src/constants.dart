import 'package:flutter/material.dart';
import 'package:my_aplication/src//size_config.dart';


const kPrimaryColor = Color(0xFF00BCD4);
const kPrimaryLightColor = Color(0xFF00838F);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
    fontSize: getProportionatedScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp curpValidatorRegExp =
    RegExp(r"^([a-zA-Z]{4})+(\d{6})+([a-zA-Z]{6})+(\d{2})$");
const String kEmailNullError = "introduzca su correo";
const String kInvalidEmailError = "introduzca un correo valido";
const String kPassNullError = "introduzca su clave";
const String kShortPassError = "Clave debe de ser mayor o igual a 8 caracteres";
const String kMatchPassError = "Password no pudo ser macheado";
const String kNameNullError = "Introduzca su nombre";
const String klastnameNullError = "Introduzca su apellido";
const String kPhoneNumberNullError = "Introduzca su numero de telefono";
const String kAddressNullError = "Introduzca su dirección";
const String kDateBirthNullError = "Introduzca su fecha de nacimiento";
const String kBirthPlacethNullError = "Introduzca lugar de nacimiento";
const String kTravelDestinationhNullError = "Introduzca el destino";
const String kDaysTriphNullError = "Introduzca cantidad de dias";
const String kCurpNullError = "Introduzca su CURP";
const String kInvalidCurpError = "Introduzca un CURP valido";
const String kCompanyNameNullError = "Introduzca su CURP";