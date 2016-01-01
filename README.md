# SqueezeBoxExtensions
Simple extensions for SqueezeBox/Logitech Media Server/Slimserver/SqueezeCentre for nothing but playing 

## CorsHeader
The CORS header plugin is designed to add headers to the slim server HTTP responses in order to support cross site scripting.  
The plugin replaces the core function Slim::Web::HTTP::_stringifyHeaders which creates the standard responses for the all HTTP 
requests. 

### Install
To install, copy the content of the CorsHeader.zip in to the Plugins folder and restart the Logitect Media Service.
