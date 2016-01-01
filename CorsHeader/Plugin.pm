package Slim::Plugin::CorsHeader::Plugin;

# CORS Header plugin for Logitech Media Server Copyright 2016 Darren Gibson.
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# version 2.

use strict;
use base qw(Slim::Plugin::Base);

use Slim::Utils::Log;
use Slim::Utils::Prefs;
use Slim::Utils::Misc;
use Slim::Utils::Strings;
use vars qw($VERSION);

# A logger we will use to write plugin-specific messages. 
my $log = Slim::Utils::Log->addLogCategory({
	'category'     => 'plugin.CorsHeader',
	'defaultLevel' => 'ERROR',
	'description'  => getDisplayName(),
});

my $CRLF = "\015\012";   # "\r\n" is not portable	

sub getDisplayName { return 'PLUGIN_CORS_HEADER'; }

sub initPlugin {
	my $class = shift;

	$VERSION = $class->_pluginDataFor('version');

	$log->info("Initialising " . Slim::Utils::Strings::string('PLUGIN_CORS_HEADER') . " version $VERSION");

	$class->SUPER::initPlugin;
}

# core code taken from https://github.com/Logitech/slimserver/blob/public/7.9/Slim/Web/HTTP.pm
sub Slim::Web::HTTP::_stringifyHeaders {
	my $response = shift;

	main::DEBUGLOG && $log->is_debug && $log->info("running CorsHeader modified version of _stringifyHeaders");

	my $code = $response->code();
	my $data = '';

	$data .= sprintf("%s %s %s%s", $response->protocol(), $code, HTTP::Status::status_message($code) || "", $CRLF);

	$data .= sprintf("Server: Logitech Media Server (%s - %s)%s", $::VERSION, $::REVISION, $CRLF);
	# Add CORS headers
	$data .= sprintf("Access-Control-Allow-Origin: *%s", $CRLF);
	$data .= sprintf("Access-Control-Max-Age: 300%s", $CRLF);
	$data .= sprintf("Access-Control-Allow-Methods: GET, POST%s", $CRLF);
	$data .= sprintf("Access-Control-Allow-Headers: Accept, Origin, Content-type, Authorization%s", $CRLF);
    # End Add CORS headers
	$data .= $response->headers_as_string($CRLF);

	# hack to make xmms like the audio better, since it appears to be case sensitive on for headers.
	$data =~ s/^(Icy-.+\:)/\L$1/mg; 
	
	# hack for Reciva Internet Radios which glitch on metadata unless the
	# icy-name header comes before icy-metaint, so make sure icy-metaint
	# is the last of the headers.
	$data =~ s/^(icy-metaint:[^\n]*\n)(.+)/$2$1/ms;

	return $data;
}

1;

__END__
