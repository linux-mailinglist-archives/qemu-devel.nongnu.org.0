Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68D60C4AA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 09:03:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onDuC-0007Jq-6z; Tue, 25 Oct 2022 02:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1onDNs-0004JX-6r
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 02:26:07 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1onDNp-0000VV-3u
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 02:25:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id ED39313606656;
 Tue, 25 Oct 2022 08:25:47 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 25 Oct
 2022 08:25:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00226c2a5d3-0204-4393-8388-68fc922207ae,
 C51D709EDC378CBF81E5C879F3A6BC578FFA89E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <527a218f-96b8-8123-730d-ade3fe7f0d39@kaod.org>
Date: Tue, 25 Oct 2022 08:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: soc_name for supermicrox11-bmc machine: ast2400-a1 or ast2500-a1 ?
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
CC: Erik Smit <erik.lucas.smit@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <f9a80497-bdfa-f3e3-1e32-75687d5f7256@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f9a80497-bdfa-f3e3-1e32-75687d5f7256@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a2d16413-b255-4610-b0fd-2bb1be262fa0
X-Ovh-Tracer-Id: 9325547455003462624
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedthedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleekleevteegtdehjeeviedtffeigeffgefgtdefhfeiffeujeegfffgveeuvdevnecuffhomhgrihhnpehsuhhpvghrmhhitghrohdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpvghrihhkrdhluhgtrghsrdhsmhhithesghhmrghilhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Guenter

On 10/24/22 22:56, Guenter Roeck wrote:
> Hi,
> 
> I always wondered why I am having trouble running Linux on supermicrox11-bmc.
> Building the kernel with aspeed_g4_defconfig results in its clock running
> at ~20x the real clock speed, and kernels built with aspeed_g5_defconfig
> do not boot at all.
> 
> I ended up spending some time on it last weekend and noticed that the SOC
> is configured to ast2400-a1. However, the Supermicro documentation as well
> as the devicetree file in the Linux kernel suggest that the SOC on the X11
> board is an ast2500.

It is true that the Linux DT file includes an AST2500 SoC.

However, the QEMU BMC machine was added to support such boards :

    https://www.supermicro.com/en/products/motherboard/X11SSL-F

where it says ASPEED AST2400 BMC for IPMI and graphics. The firmware
detects the SoC as an AST2300, which means it doesn't have support for
the ast2400 ...

  
> Indeed, it turns out that all my problems are gone if I change the SOC
> to ast2500-a1 and use aspeed_g5_defconfig to build the Linux kernel.
> 
> Was there a reason to select ast2400-a1 for this machine, or is that
> a bug ?


May be there were multiple generations of the X11 mother boards.

It wouldn't be difficult adding a new supermicrox11-<something>-bmc
machine with an AST2500 SoC for your needs.

Thanks,

C.



U-Boot 2009.01 ( 4月 02 2019 - 15:29:02) ASPEED (v.0.21)

I2C:   ready
DRAM:  128 MB
Flash: 32 MB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
H/W:   AST2400 series chip
COM:   port1 and port2
PWM:   port[ABCDH]
Hit any key to stop autoboot:  0
## Booting kernel from Legacy Image at 21400000 ...
    Image Name:   21400000
    Image Type:   ARM Linux Kernel Image (gzip compressed)
    Data Size:    1536645 Bytes =  1.5 MB
    Load Address: 40008000
    Entry Point:  40008000
    Verifying Checksum ... cramfs size 15032320
cramfs size 7315456
OK
    Uncompressing Kernel Image ... OK

Starting kernel ...

Linux version 2.6.28.9 (root@localhost) (gcc version 4.9.1 (crosstool-NG 1.20.0) ) #1 Wed Nov 20 18:20:38 CST 2019
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
CPU: VIVT data cache, VIVT instruction cache
Machine: ASPEED-AST2300
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 20066
Kernel command line: console=ttyS1,115200 root=/dev/mtdblock2 rootfstype=cramfs noinitrd rw mem=79M
PID hash table entries: 512 (order: 9, 2048 bytes)
Console: colour dummy device 80x30
console [ttyS1] enabled
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 79MB = 79MB total
Memory: 76736KB available (2848K code, 358K data, 112K init)
SLUB: Genslabs=12, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Calibrating delay loop... 1012.53 BogoMIPS (lpj=5062656)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 636 bytes
NET: Registered protocol family 16
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
NET: Registered protocol family 1
NetWinder Floating Point Emulator V0.97 (extended precision)
NTFS driver 2.1.29 [Flags: R/W].
JFFS2 version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
fuse init (API version 7.10)
msgmni has been set to 149
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Non-volatile memory driver v1.2
ttyS0 at MMIO 0x1e783000 (irq = 9) is a ASPEED UART
ttyS1 at MMIO 0x1e784000 (irq = 10) is a ASPEED UART
brd: module loaded
loop: module loaded
nbd: registered device at major 43
Driver 'sd' needs updating - please use bus_type methods
Driver 'sr' needs updating - please use bus_type methods
BMC flash ID:0xc21920c2
  platform_flash: MX25L25635E (32768 Kbytes)
Creating 7 MTD partitions on "spi0.0":
0x00000000-0x00100000 : "bootloader"
0x00100000-0x00400000 : "nvram"
0x00400000-0x01400000 : "rootFS"
0x01400000-0x01700000 : "kernel"
0x01700000-0x01f40000 : "webpage"
0x00000000-0x01fc0000 : "all_part"
0x01fc0000-0x01fd0000 : "uboot_env"
mice: PS/2 mouse device common for all mice
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP cubic registered
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
ip6_tables: (C) 2000-2006 Netfilter Core Team
IPv6 over IPv4 tunneling driver


