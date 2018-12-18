# ZappGeneralIPHookPlugin-iOS

### Description

This plugin is a hook plugin that check validation via IP address. It gets list of valid IPs from plugin configuration parameters (see below), and URL as API that return device IP address. Then it checkes if device IP is exist on valid IPs list. If Yes application flow continue, else error message is shown and app gets stack.

### plugin configuration

1. entry_point - api for the request
2. unauthorized_message - error message that shown if user not authorized
3. authorize_ip_array - array of ip’s \[ “12.11.11.1”, “1.1.1.1” \]
4. text_style - unauthorized_message key style from Zapp
5. dialog_bg_color - dialog bg color.
