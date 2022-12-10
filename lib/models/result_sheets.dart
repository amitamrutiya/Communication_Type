import 'package:Comm_type/models/result.dart';
import 'package:gsheets/gsheets.dart';

class ResultSheetsApi {
  static final _spreadsheetId = "1bTXBllMpWWxRRhUBiy6oucCDrhXtFEaysJp5gLCM01E";
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "communication-4166b",
  "private_key_id": "8752b2ab5df2ac431014a379d34652a1dd44ea01",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDRM+NBu4xKMrEP\nyiocaUwxs3SGB1Ry2T6ET314c9ccduWSaCkRmqwAaorCiaDny7H4Vb5/AjwgWWo+\nlJKwWHrQQFU2YIkxUaV8eoxezuPll/jJVHkjmOVKAWtLIHcYttQ1e8PcUX98S5b/\nowLkmGxHw5oN27GC6rmzx0sSo1kklCKJSIpwV4vtehrKmaAGX4iLyI7KaPkXgbhQ\nrsB5R1wrrXZQ9CiSHABYeTiprERqf5HcdOv7KZPJr83kofRXidToBSs5r386ahEq\nYib9/PNfDr5LJsSmY5b8Rjv7KRBkKPBMZjFza/5NbucGMGi4N45F/Jlit5HMWNLa\nVfcoUbqNAgMBAAECggEAAftBGXNrGq5oGXSFEw4VEHf7IUqnjE+62WP4Jv9QSQIi\nN/wuCyJxK9Er2lod5Ql7mqXxho9e7PQL2tXi4cvG4K41+gHOmchihZwKNHR67ukJ\nyCMw41b1l6xzok6Yerc+/ywFIEp9DcOYuLxUuWrCkaiBwirpIbVOxee+MhbL/OJ9\nGeydng2N8I9ZSFgM1XvzRi37BA99lSedDi2VjioN4Z9jGjjGuN0DtAvZYxXk7QmU\nMAV9gQpofQX1/PqgxpOnO98dlQCbuQPNQ4/rCQjiI9M/GX6tTfsJCDnxK72HReRT\ngjHablWXSE+ftW4zEzZPgSvpz5igq98TrKNc+ygafQKBgQD9zy92RMKm8pIt2GmM\n9g4rHCfLBOZ+GWxAwLQOqMsRk40TzLvw3EMvWztFn8pAEpaUiS7hQ/A6/dE1eaYZ\nua6QXOzGcFv2AfXIku0z3BxLFdqG+bL2K2xSkz3ICmck7RuKHwcXFWI/9kgTECCv\ni5YAC6Xk8mlv+e+dgIfCwJtR6wKBgQDTAiPTXX7Y1dywuP/w40ngT4T/TrCuQDWa\nkPPnSOEfNDYU0FGsTC9MxXKygj9F6wtR18OqtNc4pHouZZ2fOhFKLuZqElr2gEXs\nTtL7Qzv6AmldwIMC3GAuMmmQawn6HHVwBnuTmFg0m0s47PGS0J0Gnoxag7NIk1w5\n1wbc11UPZwKBgFXp0/8Mt3cblS+/mbsFbzZYiX/HYN4+bM5ebJSpvlNsxsx0+QlH\nBdb54s5mkGev4xjUdvH5tU/CqxaW3wrGN7jWO6/QSNC1SSVj1rc/QrSH6TjXPSTm\n/fvVq4wTOWbee/v9FMFTk7Zi/3K0etvxPA035Cfjhp1I1TtTTqE14V2RAoGBAKRa\nGFl7i1+NRDYKAqA4CMTEa00Il6lBrf7URIWzSFWrrywLDnJrbLQZXrsXo/zrlIeM\nzYTbEn+17MzSrTDmY60qVqHr5hn104C57K90sPSMiFFTrze9OtUAwySPmtfK7tXw\n1rQhhyKCitauB4NZJdWQDLY7upse3EjY6Sl+N2ylAoGAHa04UHyz8RDFXF4RMev0\nCjbSipUePikh821A7dBC/AkH1e3zlklaDdaRVH+hnsdG33QguHVEszdbX2sxRHAQ\nZuCqrWD78ATpN6VJ5+1NvXhmIsKTyeESr+IvYtKEDpKWyrMOeGkQtT2w3PKHeGMm\nPZbk/4qaNj5Yym0y5ln2gHU=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-qycic@communication-4166b.iam.gserviceaccount.com",
  "client_id": "103828983187641975555",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-qycic%40communication-4166b.iam.gserviceaccount.com"
}
''';
  static final _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Result');
      final firstRow = ResultFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(Map<String, dynamic> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRow(rowList);
  }

  static Future<bool> update(Map<String, dynamic> rowList) async {
    if (_userSheet == null) return false;
    return _userSheet!.values.map
        .insertRowByKey(rowList['Student ID'], rowList);
  }
}
