import Toybox.Application;

class DataManager {
    static function getSetCount() {
        return Application.Properties.getValue("setCount");
    }

    static function setSetCount(count) {
        Application.Properties.setValue("setCount", count);
    }

    static function getSetDuration() {
        return Application.Properties.getValue("setDuration");
    }

    static function setSetDuration(duration) {
        Application.Properties.setValue("setDuration", duration);
    }
}