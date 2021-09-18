import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as fgp;
import 'package:tinder_app_flutter/ui/widgets/bordered_text_field.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class AddEventDialog extends StatefulWidget {
  final String labelText;
  final Function(String) onSavePressed;
  final String startInputText;

  @override
  _AddEventDialogState createState() => _AddEventDialogState();

  AddEventDialog(
      {@required this.labelText,
      @required this.onSavePressed,
      this.startInputText = ''});
}

class _AddEventDialogState extends State<AddEventDialog> {
  String eventNameText = '';
  String eventLocationText = '';
  String eventDateText = '';
  String eventTimeText = '';
  final eventNameController = TextEditingController();
  final eventLocationController = TextEditingController();
  final eventDateController = TextEditingController();
  final eventTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    eventNameController.text = '';
    eventLocationController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      contentPadding: EdgeInsets.all(16.0),
      content: Container(
        height: 390,
        width: 300,
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
            ),
            InkWell(
                onTap: () async {
                  final kGoogleApiKey = '';
                  // = "";
                  var _selectedLocation = await fgp.PlacesAutocomplete.show(
                    context: context,
                    apiKey: kGoogleApiKey,
                    radius: 10000000,
                    types: [],
                    strictbounds: false,
                    mode: fgp.Mode.overlay,
                    language: "en",
                    decoration: InputDecoration(
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
                  });

                  debugPrint('Place ID: ' + _selectedLocation.placeId);
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
        FlatButton(
          color: kAccentColor,
          child: Text(
            'SAVE',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            widget.onSavePressed(eventNameText);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
