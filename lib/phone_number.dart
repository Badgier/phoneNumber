class PhoneNumber {
  String clean(String number) {
    String phoneNumber = number;
    phoneNumber = phoneNumber.replaceAll('.', '');
    phoneNumber = phoneNumber.replaceAll(' ', '');
    phoneNumber = phoneNumber.replaceAll('(', '');
    phoneNumber = phoneNumber.replaceAll(')', '');
    phoneNumber = phoneNumber.replaceAll('-', '');
    phoneNumber = phoneNumber.replaceAll('+', '');

    if (phoneNumber.contains(
      RegExp(r'[a-zA-Z]'),
    )) {
      throw FormatException("letters not permitted");
    }
    if (number.contains(
      RegExp(r'[@:!]'),
    )) {
      throw FormatException("punctuations not permitted");
    }

    if (phoneNumber.length != 10) {
      if (phoneNumber.length < 10) {
        throw FormatException("incorrect number of digits");
      }
      if (phoneNumber.length > 10) {
        if (phoneNumber.length == 11) {
          if (phoneNumber.startsWith('1')) {
            phoneNumber = phoneNumber.substring(1);
            if (phoneNumber.startsWith('0')) {
              throw FormatException("area code cannot start with zero");
            }
            if (phoneNumber.startsWith('1')) {
              throw FormatException("area code cannot start with one");
            }
            if (phoneNumber[3] == '0') {
              throw FormatException("exchange code cannot start with zero");
            }
            if (phoneNumber[3] == '1') {
              throw FormatException("exchange code cannot start with one");
            } else {
              return phoneNumber;
            }
          } else {
            throw FormatException("11 digits must start with 1");
          }
        }
        if (phoneNumber.length > 11) {
          throw FormatException("more than 11 digits");
        } else {
          if (phoneNumber.startsWith('+1')) {
            phoneNumber = phoneNumber.substring(2);
          }
        }
      }
    }
    if (phoneNumber.startsWith('0') ||
        phoneNumber.startsWith('1') ||
        phoneNumber[3] == '0' ||
        phoneNumber[3] == '1') {
      if (phoneNumber.startsWith('0')) {
        throw FormatException("area code cannot start with zero");
      }
      if (phoneNumber.startsWith('1')) {
        throw FormatException("area code cannot start with one");
      }
      if (phoneNumber[3] == '0') {
        throw FormatException("exchange code cannot start with zero");
      } else {
        throw FormatException("exchange code cannot start with one");
      }
    } else {
      return phoneNumber;
    }
  }
}
