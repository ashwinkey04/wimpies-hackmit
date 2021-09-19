import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as fgp;
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:tinder_app_flutter/data/db/entity/app_user.dart';
import 'package:tinder_app_flutter/data/db/entity/event.dart';
import 'package:tinder_app_flutter/data/provider/user_provider.dart';
import 'package:tinder_app_flutter/ui/widgets/bordered_text_field.dart';
import 'package:tinder_app_flutter/ui/widgets/custom_modal_progress_hud.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class AddEventDialog extends StatefulWidget {
  final Function(Event) onSavePressed;

  @override
  _AddEventDialogState createState() => _AddEventDialogState();

  AddEventDialog({
    @required this.onSavePressed,
  });
}

class _AddEventDialogState extends State<AddEventDialog> {
  String eventNameText = '';
  String eventLocationText = '';
  String eventDateText = '';
  String eventTimeText = '';
  String eventPlaceId = '';
  String eventDesc = '';
  final eventNameController = TextEditingController();
  final eventLocationController = TextEditingController();
  final eventDateController = TextEditingController();
  final eventTimeController = TextEditingController();
  final eventDescController = TextEditingController();

  String kGoogleApiKey;
  GoogleMapsPlaces _googleMapsPlaces;

  @override
  void initState() {
    super.initState();
    eventNameController.text = '';
    eventLocationController.text = '';
    getPlacesKey();
  }

  getPlacesKey() async {
    var k = new DotEnv();
    await k.load();
    kGoogleApiKey = k.env['PLACES_KEY'];
    _googleMapsPlaces = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      contentPadding: EdgeInsets.all(16.0),
      content: Container(
        height: 400,
        width: 330,
        child: Column(
          children: [
            BorderedTextField(
              textCapitalization: TextCapitalization.sentences,
              labelText: 'Event Name',
              prefixIcon: Icon(
                Icons.attractions_outlined,
                size: 24,
                color: Colors.white,
              ),
              autoFocus: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => {eventNameText = value},
              textController: eventNameController,
              isBorder: true,
            ),
            InkWell(
                onTap: () async {
                  var _selectedLocation = await fgp.PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    radius: 10000000,
                    types: [],
                    strictbounds: false,
                    mode: fgp.Mode.overlay,
                    language: "en",
                    decoration: InputDecoration(
                      fillColor: Colors.grey[900],
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    components: [],
                  );

                  setState(() {
                    eventLocationController.text =
                        _selectedLocation.description;
                    eventPlaceId = _selectedLocation.placeId;
                  });
                  debugPrint('Place ID: ' + eventPlaceId);
                  var placesDetail = await _googleMapsPlaces
                      .getDetailsByPlaceId(_selectedLocation.placeId);
                  debugPrint('Latitude: ' +
                      (placesDetail.result.geometry.location.lat).toString());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 24, bottom: 8),
                  // symmetric(vertical: 14, horizontal: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 18),
                      Container(
                        width: 200,
                        child: Text(
                          eventLocationController.text != ''
                              ? eventLocationController.text
                              : 'Location',
                          style: TextStyle(color: Colors.grey[200]),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                )),
            // BorderedTextField(
            //   textCapitalization: TextCapitalization.sentences,
            //   labelText: 'Location',
            //   prefixIcon: Icon(
            //     Icons.location_on,
            //     size: 24,
            //     color: Colors.white,
            //   ),
            //   // autoFocus: true,
            //   keyboardType: TextInputType.text,
            //   onChanged: (value) => {eventLocationText = value},
            //   textController: eventLocationController,
            // ),
            InkWell(
                onTap: () async {
                  var _date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2088-12-30 23:59:00'));
                  setState(() {
                    eventDateController.text =
                        '${_date.month}/${_date.day}/${_date.year}';
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 18),
                      Text(
                        eventDateController.text != ''
                            ? eventDateController.text
                            : 'Date',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                )),
            InkWell(
                onTap: () async {
                  var _time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  setState(() {
                    eventTimeController.text =
                        '${_time.hour}:${_time.minute.toString().padLeft(2, '0')}';
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8.0),
                        child: Icon(
                          Icons.timer,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 14),
                      Text(
                        eventTimeController.text != ''
                            ? eventTimeController.text
                            : 'Time',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                )),
            BorderedTextField(
              textCapitalization: TextCapitalization.sentences,
              labelText: 'Description',
              prefixIcon: Icon(
                Icons.notes,
                size: 24,
                color: Colors.white,
              ),
              autoFocus: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => {eventDesc = value},
              textController: eventDescController,
              isBorder: false,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          color: kColorPrimaryVariant,
          child: Text(
            'CANCEL',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Consumer<UserProvider>(builder: (context, userProvider, child) {
          return FutureBuilder<AppUser>(
              future: userProvider.user,
              builder: (context, userSnapshot) {
                return CustomModalProgressHUD(
                    inAsyncCall:
                        userProvider.user == null || userProvider.isLoading,
                    child: userSnapshot.hasData
                        ? FlatButton(
                            color: kAccentColor,
                            child: Text(
                              'SAVE',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            onPressed: () {
                              var _host = userSnapshot.data.name;
                              Event event = Event(
                                  hostName:
                                      _host == '' ? 'User' : _host ?? 'User',
                                  name: eventNameText,
                                  placeID: eventPlaceId,
                                  time: eventTimeController.text,
                                  date: eventDateController.text,
                                  eventDesc: eventDesc);
                              widget.onSavePressed(event);
                              Navigator.pop(context);
                            },
                          )
                        : Container());
              });
        }),
      ],
    );
  }
}
