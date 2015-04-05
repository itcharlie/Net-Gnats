package Net::Gnats::Command::LKDB;
use parent 'Net::Gnats::Command';
use strictures;
use Net::Gnats::Constants qw(CODE_OK CODE_CMD_ERROR CODE_GNATS_LOCKED);

=head1 NAME

Net::Gnats::Command::LKDB

=head1 DESCRIPTION

Locks the main gnats database. No subsequent database locks will
succeed until the lock is removed. Sessions that attempt to write to
the database will fail.

=head1 RESPONSES

The possible responses are:

200 (CODE_OK) The lock has been established.

440 (CODE_CMD_ERROR) One or more arguments were supplied to the
command.

431 (CODE_GNATS_LOCKED) The database is already locked, and the lock
could not be obtained after 10 seconds.

6xx (internal error) An internal error occurred, usually because of
permission or other filesystem-related problems. The lock may or may
not have been established.

=cut

my $c = 'LKDB';

sub new {
  my ( $class, %options ) = @_;

  my $self = bless {}, $class;
  return $self;
}

1;
