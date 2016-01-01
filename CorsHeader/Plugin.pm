#line 1 "Plugins/CorsHeader/Plugin.pm"
# CorsHeader::Plugin.pm by Darren Gibson
#
use strict;

package Plugins::CorsHeader::Plugin;
use base qw(Slim::Plugin::Base);

use vars qw($VERSION);

use File::Basename;
use Slim::Utils::Strings qw (string);
use Slim::Utils::Prefs;

use constant CORS_HEADER_MENU => 'CorsHeader.CorsHeaderMenu';

# A logger we will use to write plugin-specific messages. 
my $log = Slim::Utils::Log->addLogCategory( 
 { 
     'category'     => 'plugin.CorsHeader', 
     'defaultLevel' => 'WARN',
     'description'  => 'PLUGIN_CORS_HEADER' 
 }
);

sub getDisplayName { return 'PLUGIN_CORS_HEADER'; }

sub initPlugin {
	my $class = shift;
	my $client = shift;

	$VERSION = $class->_pluginDataFor('version');

	$log->info("Initialising " . Slim::Utils::Strings::string('PLUGIN_CORS_HEADER') . " version $VERSION");

	$class->SUPER::initPlugin(shift);
}

1;
