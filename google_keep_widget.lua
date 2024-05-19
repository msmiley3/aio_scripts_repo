-- google_keep_widget.lua
-- This script integrates the Google Keep widget into AIO Launcher

-- Assuming "com.google.android.keep/.activities.BrowseActivity" is the activity name
function on_resume()
    ui:show_android_widget("com.google.android.keep/.activities.BrowseActivity")
end
