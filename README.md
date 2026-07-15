# Restaurant Tip Calculator — Flutter `Slider` Demo

## About the widget

- A `Slider` lets a user choose a numeric value by dragging a thumb along a track.
- In this demo, that value represents a restaurant tip percentage.
- As the percentage changes, the app recalculates the tip amount and the final bill total immediately.
- 
## How it works

The app keeps the selected tip percentage in `_tipPercent`. The `Slider` starts with that value, and its `onChanged` callback updates it when the user drags the thumb. Calling `setState` rebuilds the page, so the calculation card displays the new tip and total.

The calculation used is:

```text
tip amount = bill total × tip percentage ÷ 100
total to pay = bill total + tip amount
```

## Three `Slider` attributes demonstrated

This presentation covers exactly three `Slider` attributes.

| Attribute | Value in this app | What it changes on screen |
| --- | --- | --- |
| `min` | `0` | The far-left end of the slider represents a 0% tip. |
| `max` | `30` | The far-right end represents a 30% tip, which limits the available range. |
| `divisions` | `30` | The slider stops at whole-number percentage values instead of arbitrary decimal values. |

## Run the project

1. Install Flutter and start an emulator or connect a physical device.
2. Clone this repository and open the project folder in a terminal.
3. Run:

   ```bash
   flutter create .
   flutter pub get
   flutter run
   ```

4. Enter a bill total and drag the slider to choose a tip percentage.
