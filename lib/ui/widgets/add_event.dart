import 'package:flutter/material.dart';
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
        height: 330,
        width: 300,
        child: Column(
          children: [
            BorderedTextField(
              textCapitalization: TextCapitalization.sentences,
              labelText: 'Event Name',
              autoFocus: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => {eventNameText = value},
              textController: eventNameController,
            ),
            BorderedTextField(
              textCapitalization: TextCapitalization.sentences,
              labelText: 'Location',
              autoFocus: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => {eventLocationText = value},
              textController: eventLocationController,
            ),
            InkWell(
                onTap: () async {
                  var _date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2028-02-27 13:27:00'));
                  setState(() {
                    eventDateController.text =
                        '${_date.month}/${_date.day}/${_date.year}';
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 28, horizontal: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          eventDateController.text != ''
                              ? eventDateController.text
                              : 'Date',
                          style: TextStyle(color: Colors.grey[200]),
                        ),
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
                    eventTimeController.text = '${_time.hour}:${_time.minute}';
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          eventTimeController.text != ''
                              ? eventTimeController.text
                              : 'Time',
                          style: TextStyle(color: Colors.grey[200]),
                        ),
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
