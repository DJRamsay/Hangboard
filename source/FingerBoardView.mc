import Toybox.Graphics;
import Toybox.WatchUi;

class FingerBoardView extends WatchUi.View {
    private var _typeTitleElement;
    private var _currentTimerElement;
    private var _setsLeftElement;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _typeTitleElement = findDrawableById("type_title");
        _currentTimerElement = findDrawableById("current_timer");
        _setsLeftElement = findDrawableById("sets_left");

        setModeTypeValue((DataManager.getSetCount() - 1) % 2 == 0 ? ModeType.Hang : ModeType.Rest);
        setTimerValue(DataManager.getSetDuration());
        updateSetsValue(DataManager.getSetCount());
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function setModeTypeValue(modeType) as Void{
        var label, color;

        if (modeType == ModeType.Hang){
            label = "HANG";
            color = Graphics.COLOR_DK_RED;
        }
        else {
            label = "REST";
            color = Graphics.COLOR_BLUE;
        } 

        _typeTitleElement.setText(label);
        _typeTitleElement.setColor(color);

        WatchUi.requestUpdate();
    }

    function setTimerValue(value) as Void{
        var minutes = value/60;

        var seconds = value%60;
        var secondsFormatted = seconds > 9 ? seconds.toString() : "0" + seconds.toString();

        var formattedValue = minutes.toString() + ":" + secondsFormatted;

        _currentTimerElement.setText(formattedValue);

        WatchUi.requestUpdate();   
    }

    function updateSetsValue(sets) as Void{
        var multipleSign = sets == 1 ? "" : "s";
        var formattedValue = sets.toString() + " set" + multipleSign + " left";

        _setsLeftElement.setText(formattedValue);

        WatchUi.requestUpdate();
    }
}
