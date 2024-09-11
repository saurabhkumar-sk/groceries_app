import 'package:eshop/Helper/Session.dart';
import 'package:eshop/Helper/String.dart';
import 'package:eshop/Screen/Dashboard.dart';
import 'package:eshop/settings.dart';
import 'package:eshop/ui/styles/Validators.dart';
import 'package:eshop/ui/widgets/AppBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../Helper/Color.dart';
import '../app/routes.dart';
import 'SendOtp.dart';

class SignInUpAcc extends StatefulWidget {
  const SignInUpAcc({Key? key}) : super(key: key);

  @override
  _SignInUpAccState createState() => _SignInUpAccState();
}

class _SignInUpAccState extends State<SignInUpAcc> {
  final mobileController = TextEditingController();
  String defaultCountryCode = AppSettings.defaultCountryCode;
  String? mobile, id, countrycode, countryName, mobileno;
  _subLogo() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 30.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              "assets/images/Splash_Logo.png",
            ),
          ),
        ),
      ),
    );
  }

  welcomeEshopTxt() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20.0),
      child: Text(
        getTranslated(context, 'Welcome Back')!,
        // getTranslated(context, 'WELCOME_ESHOP')!,

        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.fontColor,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              fontFamily: "Poppins",
            ),
      ),
    );
  }

  eCommerceforBusinessTxt() {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      child: Text(
        getTranslated(
          context,
          'Login to your account with using your registered number',
        )!,
        textAlign: TextAlign.center,
        // getTranslated(context, 'ECOMMERCE_APP_FOR_ALL_BUSINESS')!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  // signInyourAccTxt() {
  //   return Padding(
  //     padding: const EdgeInsetsDirectional.only(top: 80.0, bottom: 40),
  //     child: Text(
  //       getTranslated(context, 'SIGNIN_ACC_LBL')!,
  //       style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //           color: Theme.of(context).colorScheme.fontColor,
  //           fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }

  signInBtn() {
    return CupertinoButton(
      child: Container(
          width: deviceWidth! * 0.8,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primarytheme,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(getTranslated(context, 'SIGNIN_LBL')!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: colors.whiteTemp, fontWeight: FontWeight.normal))),
      onPressed: () {
        Navigator.pushNamed(context, Routers.loginScreen,
            arguments: {"isPop": false});
      },
    );
  }

  verifyOtp() {
    return CupertinoButton(
      child: Container(
        width: deviceWidth! * 0.8,
        height: 45,
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(
          color: Color(0Xff4BA203),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Text(
          getTranslated(context, 'SEND_OTP_TITLE')!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: colors.whiteTemp,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontFamily: "Poppins",
              ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routers.loginScreen,
            arguments: {"isPop": false});
      },
    );
  }

  createAccBtn() {
    return CupertinoButton(
      child: Container(
          width: deviceWidth! * 0.8,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primarytheme,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(getTranslated(context, 'CREATE_ACC_LBL')!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: colors.whiteTemp, fontWeight: FontWeight.normal))),
      onPressed: () {
        Navigator.pushNamed(context, Routers.sendOTPScreen,
            arguments: {"title": getTranslated(context, 'SEND_OTP_TITLE')});
      },
    );
  }

  skipSignInBtn() {
    return CupertinoButton(
      child: Container(
          width: deviceWidth! * 0.8,
          height: 45,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primarytheme,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(getTranslated(context, 'SKIP_SIGNIN_LBL')!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: colors.whiteTemp, fontWeight: FontWeight.normal))),
      onPressed: () {
        Dashboard.dashboardScreenKey = GlobalKey<HomePageState>();

        Navigator.pushReplacementNamed(
          context,
          Routers.dashboardScreen,
        );
      },
    );
  }

  // backBtn() {
  //   return Container(
  //     padding: const EdgeInsetsDirectional.only(top: 34.0, start: 5.0),
  //     alignment: Alignment.topLeft,
  //     width: 60,
  //     child: Material(
  //         color: Colors.transparent,
  //         child: Container(
  //           margin: const EdgeInsets.all(10),
  //           decoration: shadow(),
  //           child: Card(
  //             elevation: 0,
  //             child: InkWell(
  //               borderRadius: BorderRadius.circular(4),
  //               onTap: () => Navigator.of(context).pop(),
  //               child: const Center(
  //                 child: Icon(
  //                   Icons.keyboard_arrow_left,
  //                   color: Theme.of(context).colorScheme.primarytheme,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )),
  //   );
  // }
  // setCodeWithMono() {
  // return Padding(
  //   padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
  //   child: IntlPhoneField(
  //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
  //           color: Theme.of(context).colorScheme.fontColor,
  //           fontWeight: FontWeight.normal),
  //       controller: mobileController,
  //       decoration: InputDecoration(
  // prefixIcon: Text(
  //   "+91-",
  //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
  //         color: Theme.of(context).colorScheme.fontColor,
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //       ),
  // ),
  //         hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
  //             color: Theme.of(context).colorScheme.fontColor.withOpacity(0.6),
  //             fontWeight: FontWeight.normal),
  //         hintText: getTranslated(context, 'MOBILEHINT_LBL'),
  //         border: OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.circular(10)),
  //         fillColor: Theme.of(context).colorScheme.lightWhite,
  //         filled: true,
  //         contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
  //       ),
  //       initialCountryCode: defaultCountryCode,
  // onSaved: (phoneNumber) {
  //   setState(() {
  //     countrycode =
  //         phoneNumber!.countryCode.toString().replaceFirst('+', '');
  //     mobile = phoneNumber.number;
  //   });
  // },
  // // onCountryChanged: (country) {
  // //   setState(() {
  // //     // countrycode = country.dialCode;
  // //     countrycode = "+91";
  // //   });
  // // },
  // autovalidateMode: AutovalidateMode.onUserInteraction,
  // autofocus: true,
  // disableLengthCheck: false,
  // validator: (val) => validateMobIntl(
  //     val!,
  //     getTranslated(context, 'MOB_REQUIRED'),
  //     getTranslated(context, 'VALID_MOB')),
  // onChanged: (phone) {},
  //       showDropdownIcon: false,
  //       //invalidNumberMessage: getTranslated(context, 'VALID_MOB'),
  //       keyboardType: TextInputType.number,
  //       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //       flagsButtonMargin: const EdgeInsets.only(left: 20, right: 20),
  //       showCountryFlag: false,
  //       pickerDialogStyle: PickerDialogStyle(
  //         countryNameStyle:
  //             TextStyle(color: Theme.of(context).colorScheme.fontColor),
  //         padding: const EdgeInsets.only(left: 10, right: 10),
  //       ),
  //     ),
  //   );
  // }

  setCodeWithMono() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * 0.2,
            top: 20,
          ),
          child: TextFormField(
            controller: mobileController,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.fontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Text(
                "+91 - ",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.fontColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                    ),
              ),
              hintText: "00000-00000",
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.11),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onSaved: (phoneNumber) {
              setState(() {
                countrycode = "91".toString().replaceFirst('+', '');
                mobile = phoneNumber;
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            validator: (val) {
              if (val == null || val.replaceAll('-', '').length < 10) {
                // return getTranslated(context, 'MOB_REQUIRED');
                return getTranslated(context, 'VALID_MOB');
              }
              return null;
            },
            onChanged: (phone) {},
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              _PhoneNumberInputFormatter(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.lightWhite,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.lightWhite,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _subLogo(),
                welcomeEshopTxt(),
                eCommerceforBusinessTxt(),
                setCodeWithMono(),
                verifyOtp(),
                // signInyourAccTxt(),
                Text(
                  "OR",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                ),
                signInBtn(),
                createAccBtn(),
                skipSignInBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any existing dashes
    String newText = newValue.text.replaceAll('-', '');

    if (newText.length > 5) {
      // Add a dash after the 5th digit
      newText = '${newText.substring(0, 5)}-${newText.substring(5)}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
// class SignInUpAcc extends StatefulWidget {
//   const SignInUpAcc({Key? key}) : super(key: key);

//   @override
//   _SignInUpAccState createState() => _SignInUpAccState();
// }

// class _SignInUpAccState extends State<SignInUpAcc> {
//   _subLogo() {
//     return Padding(
//         padding: const EdgeInsetsDirectional.only(top: 30.0),
//         child: SvgPicture.asset(
//           'assets/images/homelogo.svg',
//           colorFilter: ColorFilter.mode(
//               Theme.of(context).colorScheme.primarytheme, BlendMode.srcIn),
//         ));
//   }

//   welcomeEshopTxt() {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(top: 30.0),
//       child: Text(
//         getTranslated(context, 'WELCOME_ESHOP')!,
//         style: Theme.of(context).textTheme.titleMedium!.copyWith(
//             color: Theme.of(context).colorScheme.fontColor,
//             fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   eCommerceforBusinessTxt() {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(
//         top: 5.0,
//       ),
//       child: Text(
//         getTranslated(context, 'ECOMMERCE_APP_FOR_ALL_BUSINESS')!,
//         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//             color: Theme.of(context).colorScheme.fontColor,
//             fontWeight: FontWeight.normal),
//       ),
//     );
//   }

//   signInyourAccTxt() {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(top: 80.0, bottom: 40),
//       child: Text(
//         getTranslated(context, 'SIGNIN_ACC_LBL')!,
//         style: Theme.of(context).textTheme.titleMedium!.copyWith(
//             color: Theme.of(context).colorScheme.fontColor,
//             fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   signInBtn() {
//     return CupertinoButton(
//       child: Container(
//           width: deviceWidth! * 0.8,
//           height: 45,
//           alignment: FractionalOffset.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primarytheme,
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           ),
//           child: Text(getTranslated(context, 'SIGNIN_LBL')!,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   color: colors.whiteTemp, fontWeight: FontWeight.normal))),
//       onPressed: () {
//         Navigator.pushNamed(context, Routers.loginScreen,
//             arguments: {"isPop": false});
//       },
//     );
//   }

//   createAccBtn() {
//     return CupertinoButton(
//       child: Container(
//           width: deviceWidth! * 0.8,
//           height: 45,
//           alignment: FractionalOffset.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primarytheme,
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           ),
//           child: Text(getTranslated(context, 'CREATE_ACC_LBL')!,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   color: colors.whiteTemp, fontWeight: FontWeight.normal))),
//       onPressed: () {
//         Navigator.pushNamed(context, Routers.sendOTPScreen,
//             arguments: {"title": getTranslated(context, 'SEND_OTP_TITLE')});
//       },
//     );
//   }

//   skipSignInBtn() {
//     return CupertinoButton(
//       child: Container(
//           width: deviceWidth! * 0.8,
//           height: 45,
//           alignment: FractionalOffset.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primarytheme,
//             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           ),
//           child: Text(getTranslated(context, 'SKIP_SIGNIN_LBL')!,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   color: colors.whiteTemp, fontWeight: FontWeight.normal))),
//       onPressed: () {
//         Dashboard.dashboardScreenKey = GlobalKey<HomePageState>();

//         Navigator.pushReplacementNamed(
//           context,
//           Routers.dashboardScreen,
//         );
//       },
//     );
//   }

//   // backBtn() {
//   //   return Container(
//   //     padding: const EdgeInsetsDirectional.only(top: 34.0, start: 5.0),
//   //     alignment: Alignment.topLeft,
//   //     width: 60,
//   //     child: Material(
//   //         color: Colors.transparent,
//   //         child: Container(
//   //           margin: const EdgeInsets.all(10),
//   //           decoration: shadow(),
//   //           child: Card(
//   //             elevation: 0,
//   //             child: InkWell(
//   //               borderRadius: BorderRadius.circular(4),
//   //               onTap: () => Navigator.of(context).pop(),
//   //               child: const Center(
//   //                 child: Icon(
//   //                   Icons.keyboard_arrow_left,
//   //                   color: Theme.of(context).colorScheme.primarytheme,
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //         )),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     deviceHeight = MediaQuery.of(context).size.height;
//     deviceWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         color: Theme.of(context).colorScheme.lightWhite,
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _subLogo(),
//                 welcomeEshopTxt(),
//                 eCommerceforBusinessTxt(),
//                 signInyourAccTxt(),
//                 signInBtn(),
//                 createAccBtn(),
//                 skipSignInBtn(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
