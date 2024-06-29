echo "Script executed by USER=$USER and XDG_SESSION_TYPE=$XDG_SESSION_TYPE"
if [ "$USER" = "username" ] && [ "$XDG_SESSION_TYPE" = "x11" ]; then
        echo "Executing pactl load-module commands..."
        pactl load-module module-echo-cancel
        pactl load-module module-null-sink sink_name=VirtualSink sink_propertie>
        pactl load-module module-remap-source master=VirtualSink.monitor source>
fi