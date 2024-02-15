import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class FingerBoardDelegate extends WatchUi.BehaviorDelegate {
    private var _inProgress = false;

    private var _currentDuration;
    private var _currentSet; 

    private var _timer;
    private var _view = getView();

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Boolean {
        if (_inProgress == false){
            _inProgress = true;
            startCountdown();
        }

        return true;
    }

    //Starts Countdown
    function startCountdown() {
        _currentDuration = DataManager.getSetDuration()-1; //Remove???
        _currentSet = DataManager.getSetCount()-1;

        _view.updateSetsValue(_currentSet);
        _view.setTimerValue(_currentDuration);

        _timer = new Timer.Timer();
        _timer.start(method(:updateCountdownValue), 1000, true);
    }

    function updateCountdownValue() as Void{
        if (_currentDuration == 0 && _currentSet == 0){
            _timer.stop();
            return;
        }

        if (_currentDuration == 0){
            _currentDuration = DataManager.getSetDuration();

            _currentSet--;
            _view.updateSetsValue(_currentSet);
            _view.setModeTypeValue(_currentSet % 2 == 0 ? ModeType.Hang : ModeType.Rest);
        }

        _currentDuration--;
        _view.setTimerValue(_currentDuration);
        
    }
}