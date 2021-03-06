use Test::More tests => 5;

use_ok 'Rex::Commands';
use_ok 'Rex::Commands::Run';

$::QUIET = 1;

Rex::Commands->import;
Rex::Commands::Run->import;

my $command = ( $^O =~ /MSWin/ ) ? 'dir' : 'ls -l';
run($command);

my $s = last_command_output();
like( $s, qr/ChangeLog/ms );

$command .= ' t';
run($command);

$s = last_command_output();
unlike( $s, qr/ChangeLog/ms );
like( $s, qr/base\.t/ms );
