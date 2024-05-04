import 'package:Comm_type/models/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsheets/gsheets.dart';

class ResultSheetsApi {
//   static final _spreadsheetId = "1V5B0ToSco3tgej1_exd4uf50o7LhsGciAP9Acm4GLpQ";
//   static const _credentials = r'''
// {
//   "type": "service_account",
//   "project_id": "communication-4166b",
//   "private_key_id": "301484e9ec96c5634182eeca6b2f1b7e6210d8e7",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCWX5njj7fntk11\nTj4m+tQ0V3WcXCzRBbtYuz03p5e4rRXcbeCl/tSnh7d6kg8eHLgO8TLqeaCy6YhM\nUxFkMyrSKFdYjwPS+ZWqBzknnwJx09Lu1ZxPG78J55iQzW57AOyu3l6sdyFg8pQ+\n6d64xYJaMsjcYR4txm9hehd/qK06p8hVrJ5ImsELntK8I6QcG1ZkcbqTMuv3J1A+\n0rXppfuRiORKE9piY3zRpx63GehJ8K7yUQ3b3shwBKy3FMiVEedtq0ZG3uO/kPSz\npu9RulJNcAvT0+SyOAsdfpl4d+B0keYs8SpNqzsk6yZA5wJRjjk+vFOLo3+ktDhi\n215FaFWXAgMBAAECggEAAxPIxUM91bmW2IrgiGauAguKJh2CyJzv6mRxNRrdEX6a\nnxdb4g8W0KjdLzPJqGmZC1aR9AIc25xzhBsCakUGdXo1iLlAhZ2YRlGohfA3RMIQ\nzn9uQqDZkNJ9qPTzSQQfU9gheDEQl03PjSwMY/FIIMq/mTb0Pvvmb/MSLl7IJhZH\nN3+fcw/Bw+Pr26vv5K4m5Xg2OtTQmyEVmSCT2KgMC0INhPtNvuJtqkjCcyAx7ztX\nMZWj2x18fdhrz27TQGyzbpYlZIDhPtLEtRfkaQ32/jNDEnH+8YCe34mV4XgME1Bh\nwKVSrKUBdbiNkux0lz6S1nw0VyT3EocsVhSybED5VQKBgQDGhRSoiosewmx8yF15\njvJxw38qQpm5B2joimZdPSlh3XIM13lN4DFOWBYjuscLa63qL2OVDg4suCg626vP\nfXkoOWev+LoA+qgkuvliM3DSl6BpF8QndNrhGVHGcksETddjqg61S115aG4+MXUZ\nCye4Rid3kIGD3cnvjLfSmIIGFQKBgQDB6cGtRNBTvju0e6e1bMwUY4cPn2QVQ/r3\nNIBENIIQ2VLqVovnPET5PidhQTwrJHOdrWwBAsALiqO5XnRDZEZ5SajJ4KevguUF\nUQkj9FFQ2Y1ZTV7pVT5MHyDxG+Kx9jjDZ5s65IYsXMKFWUcOZQFKZnzXhjFvYxo4\nkDUS7Bmj+wKBgHKFrVA5dF5PTOSDdiE9DLICVKbdeu7ZznRv+vOI6AmUBUpRN6Js\nViVa/ZKpGlCFUvQJWIpRbG3x4wtpVGlDehRxYVaLx0nvT/a4gktbX5etbxWRZ1BX\nwjkfMSSpJIucGEhff1Ko4oi6bPal82Z6H/TXS8dW7tBSrz7pT9ZGsqOtAoGADOyX\njATaHbrAH/dd5imqMHGxvsjQ0toFEBTft6wIPzc834GFMZRCxJnv5fuDFx0G16uH\nV0nnot1KrEAvX45/Y/YU2d+vTXNb8E7GXS8bfFgDo8AUY1jbHhe1ClzhbxsKDXwK\nTJKOnsZP8LNSmRMCUwMhrvuyr8nbJYn2/5vc2aECgYAoCzNlW4db6FLMHtrjdv2y\nQPEiuBureks2nAwX7E0N4fvVjuypNz3JijQW9mazXReKPlMjAAdbW8rJY4iDwK8T\nHZ8XFna1mCNj4QeCqosmpVMFP/hmefeNWUWAA17Bt6ZERRNbeNOkynfTtR6AXh9m\nsLV5YXV9YuBU7rTOODMfbQ==\n-----END PRIVATE KEY-----\n",
//   "client_email": "comm-type@communication-4166b.iam.gserviceaccount.com",
//   "client_id": "116200773074173307705",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/comm-type%40communication-4166b.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// }
// ''';
static final _spreadsheetId = "1McHNYJrwE6iFSDbKGLSN17z8RcKJJ6DmAZjhJpoS3i4";
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "chatzone-42a30",
  "private_key_id": "95581f9d7f1631c29d209479a29e8e4576a606de",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDcRNpzHQYpRI7A\nIDawkbI2KdsE9Yrs5R9bB3j+KZRLAJ2ZLr3EM5FJC9wGxZq6Aajlyl7nRV5WzGrY\nuRl0WuOKhbCaJ87WiXGH19Xoi9eFV0TBb7VQ9+jULpaa6X5QALoeHNVbecv2Wlz4\nLKgzYfUfHwoMKbRm3g0zaUZ9aXjGcyLUVVz/l2RZH2xkqNkJZZoWb62BDe9v9DLl\nhoe2o1bOnmzz9yTVi45qDPnY3XDUaHBhmQrR5wTDMreFCHj3XfYQRDsPDZ6I5HtK\npOEC5jGZOJd9E+111RitI2FxKWSEgeecbuowlPffi7YNLO6KBEFCk4DXOr3FFI5g\nz4tf4WnTAgMBAAECggEAEQ27pAHxQiyuqK1VzqHZHFxtOpsQIHs0zEVt1q+9bXkk\nuoFl69TaQL+MT3HpItGSFAhxBJLYVPwKobDjCaEn0Me8/pJqby3A/nV1eEWrcAVr\nq1ZMwXIQMq1Qt7mwL91+i2pMEoMBiZdBb211sFS7N6edjYeFEhnLB9n0vSz3TtXi\nXIkYMyLCMTtXXaKvTrYDADg6+Zbxow22nLl8OhNlew8y6V4+CEskUNxsRhwMY+ju\nsU6Ss2YPrw8HttbFiCjiJrZs5vzNQPXlIHUTz6D1eioRYpxAyjXia5fFFJLR3fZ+\nZMNvM7X0HKKBmb6gYZ8K4Q8mrPW8MWwP8IS66FrpIQKBgQD8CsfqHeEqvI422gpU\nONYj5GLeMkXjLSnWjuhqBWuuYv0fIccDMjEvOmtMCHeqt/Lm+K5pqrdX8z3U9bZb\nEsvzx5NeFWQ4vjqPtzQwYbhwa4hT2XmvSOVOHzzPwAwF5NyWMyHT+nAqBJpeaSoP\nUKYIIyk2+nHqgJOKIAc5olYAmwKBgQDfulfUjDISQi2vYymFP7Fhf3vy1gAXDts6\nnQunDFrli/ygO62WqaagXx8McAP4XWBQ49uYEqnrUWI6jpcEatsmh6Ci+8uxlaE8\n44y6e5pGN7OEFYtWxfpaxrOTyydWT05RjLpeznRT1FpF+Cfl+Or2axf2TmJypEBe\nIatjWCSDKQKBgEbQDJz1aibktRwqJI7HLTsGVtTQ0Rvju4aBvkDTZw6m1zEg/1Yh\nivoW8sB4/I4lgoRsSCx9/2chezTTGDn8TPsgDoJ3hiH/KFrqgSo6umQzgij0yCB8\nXZiWZDKGZZpeU6+LjCyPh2X2xxxRdbS51vwgTNsagFj/aPR8zSrfNkSTAoGBANm8\nm1oqj1ihu6Cj23bpRBLlZZYym6fVN5tV2E9dgOFCWjz/l7O3rIkLykXqhpKjHefb\nuo3ILELu07C1sVgFPv/Co527fMR6IZAGzaF4Re7sqvNznEZ5K2xJUeAWqVQgntJT\nKda3CxPC6ZCLMRlqJhJoq8t1Ae8c1+BE2G45DF/xAoGBAIixV0MDDizd7Dk+04lU\nChTiglR5QxZl92rlTOmFz6DRIVT6NZIIuruD7iz0UQByJ6W9hj7PWoDjXO7MVAX6\nEOptGJgtdEJJA+vtzONGf0d5F4MI9A6PmZHE9baIRGPnekyI4c3C+j/2Ab8pNNde\nteqUXvPAFoJjewCltqcYGIfx\n-----END PRIVATE KEY-----\n",
  "client_email": "comm-370@chatzone-42a30.iam.gserviceaccount.com",
  "client_id": "114499619726190852339",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/comm-370%40chatzone-42a30.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static final _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final String sheetName = await FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(2)
              .startsWith('d')
          ? FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(0, 5)
          : FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(0, 4);
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: sheetName.toUpperCase());
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
