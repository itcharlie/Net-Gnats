use strict;
use warnings;
use Test::More;
use Test::MockObject;
use Test::MockObject::Extends;
use Net::Gnats;

use File::Basename;
use lib dirname(__FILE__);
use Net::Gnats::TestData::Gtdata qw(connect_standard);

my $module = Test::MockObject::Extends->new('IO::Socket::INET');
$module->fake_new( 'IO::Socket::INET' );
$module->set_true( 'print' );
$module->set_true( 'close' );
$module->set_series( 'getline',
                     @{ connect_standard() },
                     "201 CODE_CLOSING\r\n"
                   );

my $g = Net::Gnats->new();
$g->gnatsd_connect;

# According to the GNATS documentation, this command "can never fail"
is $g->disconnect, 1, '201 CODE_CLOSING';

done_testing();
