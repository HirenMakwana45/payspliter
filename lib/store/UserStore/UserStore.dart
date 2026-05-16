import 'package:mobx/mobx.dart';

import '../../../utils/app_constants.dart';
import '../../extensions/shared_pref.dart';

part 'UserStore.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  String userId = '';

  @observable
  String userNativeLanguage = '';

  @observable
  String userEnglishProficiency = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String fName = '';

  @observable
  String lName = '';

  @observable
  String designation = '';

  @observable
  bool isMobileVerify = false;

  @observable
  String profileImage = '';

  @observable
  String token = '';

  @observable
  String username = '';

  @observable
  String displayName = '';

  @observable
  String phoneNo = '';

  @observable
  String isTTSPlaying = '';

  @observable
  String previousSentence = '';

  @observable
  String currencyPosition = '';

  @observable
  String privacyPolicy = "";

  @observable
  bool isPlaying = false;

  @action
  Future<void> setPhoneNo(String val, {bool isInitialization = false}) async {
    phoneNo = val;
    if (!isInitialization) await setValue(pHONENUMBER, val);
  }

  @action
  Future<void> setTTSPlaying(String val,
      {bool isInitialization = false}) async {
    isTTSPlaying = val;
    if (!isInitialization) await setValue(isTTSPlaying, val);
  }

  @action
  Future<void> setPreviousSentence(String val,
      {bool isInitialization = false}) async {
    previousSentence = val;
    if (!isInitialization) await setValue(pREVIOUSSENTENCE, val);
  }

  @action
  Future<void> setToken(String val, {bool isInitialization = false}) async {
    token = val;
    if (!isInitialization) await setValue(tOKEN, val);
  }

  @action
  Future<void> setUserID(String val, {bool isInitialization = false}) async {
    userId = val;
    if (!isInitialization) await setValue(uSERID, val);
  }

  @action
  Future<void> setUserNativeLanguage(String val,
      {bool isInitialization = false}) async {
    userNativeLanguage = val;
    if (!isInitialization) await setValue(uSERNATIVELANGUAGE, val);
  }

  @action
  Future<void> setUserEnglishProficiency(String val,
      {bool isInitialization = false}) async {
    userEnglishProficiency = val;
    if (!isInitialization) await setValue(uSERENGLISHPROFICIENCY, val);
  }

  @action
  Future<void> setLogin(bool val, {bool isInitializing = false}) async {
    isLoggedIn = val;
    if (!isInitializing) await setValue(iSLOGIN, val);
  }

  @action
  Future<void> setFirstName(String val, {bool isInitialization = false}) async {
    fName = val;
    if (!isInitialization) await setValue(fIRSTNAME, val);
  }

  @action
  Future<void> setLastName(String val, {bool isInitialization = false}) async {
    lName = val;
    if (!isInitialization) await setValue(lASTNAME, val);
  }

  @action
  Future<void> clearUserData() async {
    fName = '';
    lName = '';
    profileImage = '';
    token = '';
    username = '';
    displayName = '';
    phoneNo = '';
  }
}
