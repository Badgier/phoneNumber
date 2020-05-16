class PhoneNumber {
  String clean(String number){
    String phoneNumber = number;

    if (phoneNumber.startsWith('+1')) {
      phoneNumber = phoneNumber.substring(2);  
    } else if (phoneNumber.startsWith('1')){
      phoneNumber = phoneNumber.substring(1);
    }

    phoneNumber = phoneNumber.replaceAll('.', '');
    phoneNumber = phoneNumber.replaceAll(' ', '');
    phoneNumber = phoneNumber.replaceAll('(', '');
    phoneNumber = phoneNumber.replaceAll(')', '');
    phoneNumber = phoneNumber.replaceAll('-', '');
    return phoneNumber;
  }
}
