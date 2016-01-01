# Squeeze Box Extensions
Simple extensions for [SqueezeBox/Logitech Media Server/Slimserver/SqueezeCentre](https://en.wikipedia.org/wiki/Logitech_Media_Server) for no real purpose other than playing :).

## CORS Header Plugin
The CORS header plugin (CorsHeader) is designed to add [HTTP access control headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) to the slim server HTTP responses in order to enable support for cross site scripting.  The plugin replaces the core function [`Slim::Web::HTTP::_stringifyHeaders`](https://github.com/Logitech/slimserver/blob/5aeaad530ced9e48984eb26fc86f1c8edd42367f/Slim/Web/HTTP.pm#LC1759) which creates the standard responses for the all HTTP requests. 

The core purpose was to enable a POST to the `/jsonrpc.js` from javascript loaded from a differnt origin, in my case locally hosted by a mobile app.   

### Install
To install; copy the content of the CorsHeader.zip in to the Plugins folder and restart the Logitect Media Service.  For information on installing plugins, see [Logitech Media Server Plugins](http://wiki.slimdevices.com/index.php/Logitech_Media_Server_Plugins).
