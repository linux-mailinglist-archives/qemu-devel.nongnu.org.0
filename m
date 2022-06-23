Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CC55768F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:26:39 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4J6i-0005be-Kd
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Im1-00015N-Rb
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:05:13 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:44455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4Ilx-0001IN-Qd
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:05:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8F33224648;
 Thu, 23 Jun 2022 09:05:06 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 11:05:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00607219427-aa86-4329-87ed-9238eb1237f9,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7acbddd2-33ee-9646-ac2d-80a2a41ef8ef@kaod.org>
Date: Thu, 23 Jun 2022 11:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.
Content-Language: en-US
To: <pade@trifox.com>, 'Daniel Henrique Barboza' <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <00d101d88588$173538c0$459faa40$@trifox.com>
 <b2f5539f-2504-3c20-1f2b-5b7f03f2ea52@gmail.com>
 <01f201d8869d$4928fcc0$db7af640$@trifox.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <01f201d8869d$4928fcc0$db7af640$@trifox.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 54ae6753-17c7-4eea-addd-3b99984684c3
X-Ovh-Tracer-Id: 3225140284237056992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueefhfekgeevfeduvdekveekueekiefhuefgledtgfekuedtieehtdffuefffffhnecuffhomhgrihhnpehjrgiirghkrghllhgrhhdrihhnfhhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Paul,

On 6/23/22 03:05, Paul Dembry wrote:
> Hi Daniel,
>    It works! Using your -netdev and -device and https://www.jazakallah.info/post/how-to-setup-network-for-ibm-aix-vm-access-in-qemu with the addition of "ip route add 192.168.122.99 gw 192.168.122.1"

Excellent ! Could you try with a user netdev now ?

   -device spapr-vlan,netdev=net0,mac=52:54:00:49:53:14 -netdev user,id=net0


Thanks,

C.


> Linux host:
> ens160: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>          inet 192.0.2.186  netmask 255.255.255.0  broadcast 192.0.2.255
>          inet6 fe80::20c:29ff:fef6:5732  prefixlen 64  scopeid 0x20<link>
>          ether 00:0c:29:f6:57:32  txqueuelen 1000  (Ethernet)
>          RX packets 140774  bytes 11726303 (11.7 MB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 182899  bytes 25127896 (25.1 MB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
>          inet 127.0.0.1  netmask 255.0.0.0
>          inet6 ::1  prefixlen 128  scopeid 0x10<host>
>          loop  txqueuelen 1000  (Local Loopback)
>          RX packets 591  bytes 53864 (53.8 KB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 591  bytes 53864 (53.8 KB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
>          inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
>          ether 52:54:00:29:24:24  txqueuelen 1000  (Ethernet)
>          RX packets 33073  bytes 3078013 (3.0 MB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 34789  bytes 2405189 (2.4 MB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> vnet10: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
>          inet6 fe80::b842:6ff:fe28:d7d4  prefixlen 64  scopeid 0x20<link>
>          ether ba:42:06:28:d7:d4  txqueuelen 1000  (Ethernet)
>          RX packets 0  bytes 0 (0.0 B)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 6  bytes 460 (460.0 B)
>          TX errors 0  dropped 2 overruns 0  carrier 0  collisions 0
> 
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> default         _gateway        0.0.0.0         UG    0      0        0 ens160
> 192.0.2.0       0.0.0.0         255.255.255.0   U     0      0        0 ens160
> 192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
> 192.168.122.99  tri862          255.255.255.255 UGH   0      0        0 virbr0
> 192.168.122.99  0.0.0.0         255.255.255.255 UH    0      0        0 vnet10
> 
> and on the AIX machine:
> 
> en0: flags=e084863,14c0<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,LARGESEND,CHAIN>
>          inet 192.168.122.99 netmask 0xffffff00 broadcast 192.168.122.255
>           tcp_sendspace 262144 tcp_recvspace 262144 rfc1323 1
> lo0: flags=e08084b,c0<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,LARGESEND,CHAIN>
>          inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255
>          inet6 ::1%1/64
>           tcp_sendspace 131072 tcp_recvspace 131072 rfc1323 1
> 
> Routing tables
> Destination        Gateway           Flags   Refs     Use  If   Exp  Groups
> 
> Route tree for Protocol Family 2 (Internet):
> default            192.168.122.1     UG        8      1864 en0      -      -
> 127/8              loopback          U         3       349 lo0      -      -
> 192.168.122.0      192.168.122.99    UHSb      0         0 en0      -      -   =>
> 192.168.122/24     192.168.122.99    U         4     10898 en0      -      -
> 192.168.122.99     loopback          UGHS      0         1 lo0      -      -
> 192.168.122.255    192.168.122.99    UHSb      0         4 en0      -      -
> 
> Route tree for Protocol Family 24 (Internet v6):
> loopback           loopback          UH        0         0 lo0      -      -
> 
> Thank you! Now to hack at the Windows attempt but this is lower priority now that Linux/AIX works.	
> Regards,
> Paul
> 
> 
> -----Original Message-----
> From: Paul Dembry <pade@trifox.com>
> Sent: Tuesday, June 21, 2022 8:24 PM
> To: 'Daniel Henrique Barboza' <danielhb413@gmail.com>; 'qemu-ppc@nongnu.org' <qemu-ppc@nongnu.org>; 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> Subject: RE: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.
> 
> Hi Daniel,
>    Thank your for your information. I decided to try to get this working on my linux esxi guest because qemu AIX comes up in 5 minutes vs 10-12 on my Windows machine and I am rebooting often. I used your -device spapr-vlan and -netdev tap options. My complete qemu startup is
> 
> /usr/local/bin/qemu-system-ppc64 -cpu POWER8 -machine pseries -m 3072 -serial stdio \  -drive file=/usr2/qemu/aix72/aix.img,if=none,id=drive-virtio-disk0 \  -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=drive-virtio-disk0 \  -drive file=/usr2/qemu/aix72/aix1.img,if=none,id=drive-virtio-disk1 \  -device scsi-hd,drive=drive-virtio-disk1 \  -display vnc=:1 -g 1280x1024 \  -cdrom /usr2/qemu/aix72/cdrom.iso \  -prom-env "boot-command=boot disk:" \  -device spapr-vlan,netdev=net0,mac=52:54:00:49:53:14 \  -netdev tap,id=net0,helper=/usr/local/libexec/qemu-bridge-helper,br=virbr0
> 
> Linux host (192.0.2.186) shows
> ens160: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>          inet 192.0.2.186  netmask 255.255.255.0  broadcast 192.0.2.255
>          inet6 fe80::20c:29ff:fef6:5732  prefixlen 64  scopeid 0x20<link>
>          ether 00:0c:29:f6:57:32  txqueuelen 1000  (Ethernet)
>          RX packets 11506150  bytes 30643403943 (30.6 GB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 1626763  bytes 21619253603 (21.6 GB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
>          inet 127.0.0.1  netmask 255.0.0.0
>          inet6 ::1  prefixlen 128  scopeid 0x10<host>
>          loop  txqueuelen 1000  (Local Loopback)
>          RX packets 2118  bytes 202514 (202.5 KB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 2118  bytes 202514 (202.5 KB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> tap0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>          inet6 fe80::fc04:20ff:fe9d:ee6d  prefixlen 64  scopeid 0x20<link>
>          ether 32:3b:ac:a5:d6:5f  txqueuelen 1000  (Ethernet)
>          RX packets 12  bytes 976 (976.0 B)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 4032  bytes 210056 (210.0 KB)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> virbr0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>          inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
>          ether 52:54:00:29:24:24  txqueuelen 1000  (Ethernet)
>          RX packets 262  bytes 21672 (21.6 KB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 2  bytes 84 (84.0 B)
>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> 
> vnet10: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
>          inet6 fe80::b842:6ff:fe28:d7d4  prefixlen 64  scopeid 0x20<link>
>          ether ba:42:06:28:d7:d4  txqueuelen 1000  (Ethernet)
>          RX packets 36  bytes 1956 (1.9 KB)
>          RX errors 0  dropped 0  overruns 0  frame 0
>          TX packets 25  bytes 1914 (1.9 KB)
>          TX errors 0  dropped 5 overruns 0  carrier 0  collisions 0 (I think vnet10 is a leftover from some of my attempts)
> 
> /usr/local/etc/qemu/bridge.conf has
> allow virbr0
> 
> netstat -r shows
> 
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
> default         _gateway        0.0.0.0         UG        0 0          0 ens160
> 192.0.2.0       0.0.0.0         255.255.255.0   U         0 0          0 ens160
> 192.0.2.96      0.0.0.0         255.255.255.255 UH        0 0          0 vnet10
> 192.168.122.0   0.0.0.0         255.255.255.0   U         0 0          0 virbr0
> 
> (tri862 = 192.0.2.186)
> 
> AIX shows:
> # /usr/sbin/ifconfig -a
> en0: flags=e084863,480<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHAIN>
>          inet 192.0.2.96 netmask 0xffffff00 broadcast 192.0.2.255
>           tcp_sendspace 262144 tcp_recvspace 262144 rfc1323 1
> lo0: flags=e08084b,c0<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,LARGESEND,CHAIN>
>          inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255
>          inet6 ::1%1/64
>           tcp_sendspace 131072 tcp_recvspace 131072 rfc1323 1
> 
> netstat -r shows
> 
> # netstat -r
> Routing tables
> Destination        Gateway           Flags   Refs     Use  If   Exp  Groups
> 
> Route Tree for Protocol Family 2 (Internet):
> 127/8              loopback          U         4      1676 lo0      -      -
> 192.0.2.0          tri6qemu          UHSb      0         0 en0      -      -   =>
> 192.0.2/24         tri6qemu          U         0        13 en0      -      -
> tri6qemu           loopback          UGHS      0         2 lo0      -      -
> 192.0.2.255        tri6qemu          UHSb      0         0 en0      -      -
> 
> (tri6qemu = 192.0.2.96).
> 
> 1. It seems to me that host linux needs to "connect" a route between virbr0 and 192.0.2.96 so that packets heading to Aix guest get routed to virbr0. Not clear where vibr0 got 192.168.122.1? Maybe assign 192.0.2.96 <-> 192.168.122.0 gateway?
> 2. And somehow guest AIX needs a gateway that somehow connects to virbr0 so that packets heading to Linux host get routed to virbr0.
> 3. I think this picture might do it: https://www.jazakallah.info/post/how-to-setup-network-for-ibm-aix-vm-access-in-qemu? AIX guest doesn't have to be 192.0.2.x, I can make it whatever it takes just so I can transfer files and xterm from it to my system.
> 
> I do not recall the command line I used to create the AIX images. I did it last year on Windows and when networking didn't work, I put it aside but my disk files are from that period. What really perplexes me is that this must have somehow worked at one point because my AIX disk images have the xlc v13 and v16 compilers which do not come with the base OS. Somehow I got the tar files to the AIX sytem to do those installs.
> Regards,
> Paul
> 
> -----Original Message-----
> From: Daniel Henrique Barboza <danielhb413@gmail.com>
> Sent: Tuesday, June 21, 2022 3:05 PM
> To: pade@trifox.com; qemu-ppc@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.
> 
> Hi Paul,
> 
> I'm CC'ing the overall QEMU mailing list as well to increase the chance of finding someone that runs QEMU on Windows.
> 
> On 6/21/22 13:00, Paul Dembry wrote:
>> I have AIX 7.2 installed and running fine however I cannot get any access to it via my LAN. I have tried multiple variations of -netdev and -device, the AIX system “sees” en0, but nothing more.
> 
> 
> This is a working example of an AIX guest with network using the spapr-vlan net device:
> 
> -M pseries,ic-mode=xics -cpu POWER9 -smp 2 \ -device spapr-vlan,netdev=net0,mac=52:54:00:49:53:14 \ -netdev tap,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0 \ -device virtio-scsi,id=scsi0 \ -drive file=./disk.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none \ -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1
> 
> 
> 
>> The examples I have found all use a linux host which I can use however when I set up the bridge device, I lost LAN connectivity to my linux machine (ESXi guest). What I want to accomplish is the AIX system appearing like any other machine on my LAN with bi-directional connectivity. Failing that, it would be ok if it spoke only to the Windows host because I could move files to/from the Windows host and AIX guest. Has anyone been successful at this at doing this or have any ideas of how I can accomplish this feat? This would be very handy because my “real” AIX box does not have an HMC and so I cannot remote boot it.
> 
> I've never tried to run QEMU using Windows. I'll give a try when I have the chance. I guess that one core difference is how you'll create the network bridge for the guest.
> 
> 
> Which command line did you use to create the AIX guest?
> 
> 
>>
>> That fact that AIX 7.2 even comes up on qemu ppc64 is a tremendous achievement 😊!!
> 
> An even greater achievement would be to make it work under a Windows 10 host :D
> 
> 
> Take care,
> 
> 
> Daniel
> 
>>
>> Paul
>>
> 
> 


