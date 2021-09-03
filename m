Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA943FFBCD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:22:43 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4TC-0000Ym-NZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8880d40211=pdel@fb.com>)
 id 1mM4RR-0007LJ-Dy
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:20:53 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:43974
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8880d40211=pdel@fb.com>)
 id 1mM4RM-0002V3-0r
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:20:53 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 18388esC012246
 for <qemu-devel@nongnu.org>; Fri, 3 Sep 2021 01:20:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=HfJOt8QcVlKbPYS/blhoZ7QpOC/RM69obHZffwd5ws8=;
 b=hfIzMSRvFEJewKPfD9bOE+vOj33C2tb1o8cNX2LWplu2ApWRnoYMrPK+6YQmpTA74S8A
 fcEyCcoRcXDRX5cGc/hiRWkMBHjOKiRcFih5GQyDh5mcDzdVhw/gI7rZ17XM/JuI7oIW
 joOt+8FbxWt2ywUY1rKebSAn2v2NNsJ12xA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 3atdyhn8vu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:20:46 -0700
Received: from intmgw002.46.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 3 Sep 2021 01:20:44 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 9529618C8388; Fri,  3 Sep 2021 01:20:42 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 0/1] hw/arm/aspeed: Add Fuji machine type
Date: Fri, 3 Sep 2021 01:20:26 -0700
Message-ID: <20210903082027.704397-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="UTF-8"
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-GUID: KJ-mN4se04KZ-NtyJy4hy5rU4nK5T8-y
X-Proofpoint-ORIG-GUID: KJ-mN4se04KZ-NtyJy4hy5rU4nK5T8-y
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_02:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109030049
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8880d40211=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Peter Delevoryas <pdel@fb.com>

v2:
  - Added supported i2c devices (lm75, tmp75, tmp422, 24c64, 24c02)
  - Switched flash model to mx66l1g45g (128MB)
  - Completely separated fuji class definition from ast2600-evb
  - Removed image acceptance test

Link: https://github.com/peterdelevoryas/qemu/tree/aspeed-next

I investigated the boot issues pointed out in the previous submission a
little, let me know if any of these are blockers for this patch:

>> Is the Fuji using the Aspeed RTC ?
>>=20
>> hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invali=
d argument

I don't understand exactly what's going on here, but running "hwclock --get"
and "hwclock --set --date 2021-01-01" both seem to work fine after booting,
so I think the Aspeed RTC is setup correctly and working. As far as I know
Fuji uses it, but I'm not really sure.

>>=20
>> That's a weird MMIO range for the ADC ?
>>=20
>> [   42.856022] aspeed_adc: probe of 1e6e9100.adc failed with error -110

I think there's 2 ADC's in the DTS, one at 1e6e9000 and one at 1e6e9100, but
I don't see explicit support for the Aspeed ADC in hw/adc/, and I'm not sure
that any of the existing emulators would work.

>>=20
>> And that's unexected :
>>=20
>> Error: unable to disable the 2nd watchdog: FMC_WDT2=3D0xFFFFFFFF

So, this is an OpenBMC script trying to disable the alternate boot watchdog
by writing 0x0 to 0x1e620064 (Aspeed SMC 0x64). It checks the register after
attempting to write it and prints this error message if the lowest bit is
not cleared. Since the Aspeed SMC is not simulating this register, I don't
think aspeed_smc_write() does anything, and aspeed_smc_read() returns -1. I
also testetd changing -1 to 0xdeadbeef locally to confirm.

https://github.com/facebook/openbmc/blob/helium/common/recipes-utils/openbm=
c-utils/files/aspeed-g6/disable_watchdog.sh

Let me know if there's anything else I should look into. I'm still planning
on submitting an image acceptance test for this too, but as a separate
patch.

I've also included a boot log at the end of this cover letter for
reference.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Add Fuji machine type

 hw/arm/aspeed.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

--=20
2.30.2



U-Boot 2019.04 fuji-b9c651226b (Aug 25 2021 - 17:27:02 +0000)

SOC: AST2600-A3=20
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RMII/NCSI, MAC1: RMII/NCSI, MAC2: RMII/NCSI, MAC3: RMII/NCSI
Model: Aspeed BMC
DRAM:  1.8 GiB (capacity:2048 MiB, VGA:64 MiB, ECC:on, ECC size:1806 MiB)
MMC:   emmc_slot0@100: 0
Loading Environment from SPI Flash... SF: Detected mx66l1g45g with page siz=
e 256 Bytes, erase size 4 KiB, total 128 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Model: Aspeed BMC
Net:=20=20=20
Warning: ftgmac@1e690000 (eth1) using random MAC address - 1a:19:0a:f9:79:b5
eth1: ftgmac@1e690000
autoboot in 2 seconds (stop with 'Delete' key)...
## Loading kernel from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x201000e0
     Data Size:    3658752 Bytes =3D 3.5 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80008000
     Entry Point:  0x80008000
     Hash algo:    sha256
     Hash value:   966d2c13359bc53400606850e418559791cf7d35106f4801bf98138c=
d6f6b5b8
   Verifying Hash Integrity ... sha256+ OK
## Loading ramdisk from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  RAMDISK
     Type:         RAMDisk Image
     Compression:  lzma compressed
     Data Start:   0x2047d5d0
     Data Size:    21939893 Bytes =3D 20.9 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha256
     Hash value:   d51f4729786df5c7c2f75eea1f0dddf3a4fffe79c6bf39fc535bf901=
284aff4c
   Verifying Hash Integrity ... sha256+ OK
## Loading fdt from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'fdt@1' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x21969d68
     Data Size:    58335 Bytes =3D 57 KiB
     Architecture: ARM
     Hash algo:    sha256
     Hash value:   2e5a1f658d5930bb0ffa31dd214d11934739504ad4553b1a057ce544=
ac1618c9
   Verifying Hash Integrity ... sha256+ OK
   Booting using the fdt blob at 0x21969d68
   Loading Kernel Image ... OK
   Loading Ramdisk to 8eb13000, end 8ffff6b5 ... OK
   Loading Device Tree to 8eb01000, end 8eb123de ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0xf00
[    0.000000] Linux version 5.10.23-fuji (oe-user@oe-host) (arm-fb-linux-g=
nueabi-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34.0.20200220) #1 SMP Wed A=
ug 25 09:15:46 UTC 2021
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Facebook Fuji BMC
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 16 MiB at 0xefc00000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000d77fffff]
[    0.000000]   HighMem  [mem 0x00000000d7800000-0x00000000f0dfffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000f0dfffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000f0dff=
fff]
[    0.000000] percpu: Embedded 20 pages/cpu s50380 r8192 d23348 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 459536
[    0.000000] Kernel command line: console=3DttyS0,9600n8 root=3D/dev/ram =
rw vmalloc=3D640M
[    0.000000] Dentry cache hash table entries: 262144 (order: 8, 1048576 b=
ytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 7, 524288 byt=
es, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1782940K/1849344K available (8192K kernel code, 711K=
 rwdata, 2036K rodata, 1024K init, 182K bss, 50020K reserved, 16384K cma-re=
served, 399360K highmem)
[    0.000000] random: get_random_u32 called from cache_alloc_refill+0x3d4/=
0x8e4 with crng_init=3D0
[    0.000000] ftrace: allocating 27560 entries in 54 pages
[    0.000000] ftrace: allocated 54 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] arch_timer: cp15 timer(s) running at 1200.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x114c1bbbeec, max_idle_ns: 440795229572 ns
[    0.000214] sched_clock: 56 bits at 1200MHz, resolution 0ns, wraps every=
 2199023255551ns
[    0.000489] Switching to timer-based delay loop, resolution 0ns
[    0.013358] Console: colour dummy device 80x30
[    0.015759] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 2400.00 BogoMIPS (lpj=3D12000000)
[    0.016061] pid_max: default: 32768 minimum: 301
[    0.018378] Mount-cache hash table entries: 4096 (order: 2, 16384 bytes,=
 linear)
[    0.018468] Mountpoint-cache hash table entries: 4096 (order: 2, 16384 b=
ytes, linear)
[    0.037425] CPU: Testing write buffer coherency: ok
[    0.050944] /cpus/cpu@f00 missing clock-frequency property
[    0.051095] /cpus/cpu@f01 missing clock-frequency property
[    0.051388] CPU0: thread -1, cpu 0, socket 15, mpidr 80000f00
[    0.062472] Setting up static identity map for 0x80100000 - 0x80100078
[    0.064618] rcu: Hierarchical SRCU implementation.
[    0.072933] smp: Bringing up secondary CPUs ...
[    0.077870] CPU1: thread -1, cpu 1, socket 15, mpidr 80000f01
[    0.082848] smp: Brought up 1 node, 2 CPUs
[    0.083023] SMP: Total of 2 processors activated (4800.00 BogoMIPS).
[    0.083111] CPU: All CPU(s) started in SVC mode.
[    0.101453] devtmpfs: initialized
[    0.138275] VFP support v0.3: implementor 41 architecture 2 part 30 vari=
ant 7 rev 5
[    0.158856] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750000 ns
[    0.160526] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.165927] pinctrl core: initialized pinctrl subsystem
[    0.177880] NET: Registered protocol family 16
[    0.192152] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.200847] No ATAGs?
[    0.203946] hw-breakpoint: CPU 0 debug is powered down!
[    0.381998] SCSI subsystem initialized
[    0.384174] usbcore: registered new interface driver usbfs
[    0.384643] usbcore: registered new interface driver hub
[    0.384906] usbcore: registered new device driver usb
[    0.386043] mc: Linux media interface: v0.10
[    0.386381] videodev: Linux video capture interface: v2.00
[    0.386929] EDAC MC: Ver: 3.0.0
[    0.417818] clocksource: Switched to clocksource arch_sys_counter
[    0.578872] NET: Registered protocol family 2
[    0.587497] tcp_listen_portaddr_hash hash table entries: 1024 (order: 1,=
 12288 bytes, linear)
[    0.587685] TCP established hash table entries: 16384 (order: 4, 65536 b=
ytes, linear)
[    0.588097] TCP bind hash table entries: 16384 (order: 5, 131072 bytes, =
linear)
[    0.588505] TCP: Hash tables configured (established 16384 bind 16384)
[    0.590034] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.590375] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, li=
near)
[    0.592507] NET: Registered protocol family 1
[    0.599669] Unpacking initramfs...
[   55.757263] Freeing initrd memory: 21428K
[   55.763655] workingset: timestamp_bits=3D30 max_order=3D19 bucket_order=
=3D0
[   55.766200] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   55.766320] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[   55.769572] NET: Registered protocol family 38
[   55.769978] bounce: pool size: 64 pages
[   55.770417] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)
[   55.770623] io scheduler mq-deadline registered
[   55.770759] io scheduler kyber registered
[   55.933476] Serial: 8250/16550 driver, 17 ports, IRQ sharing enabled
[   55.955232] printk: console [ttyS0] disabled
[   55.958013] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq =3D 40, base_=
baud =3D 1500000) is a 16550A
[   55.991106] printk: console [ttyS0] enabled
[   55.994784] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 41, base_=
baud =3D 1500000) is a 16550A
[   55.998706] 1e78d000.serial: ttyS1 at MMIO 0x1e78d000 (irq =3D 42, base_=
baud =3D 1500000) is a 16550A
[   56.025372] loop: module loaded
[   56.063247] aspeed-smc 1e620000.spi: Using bus width 2 and 50 MHz SPI fr=
equency
[   56.069619] aspeed-smc 1e620000.spi: mx66l1g45g (131072 Kbytes)
[   56.070311] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x2800000=
0 ] 128MB
[   56.070803] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x2c00000=
0 ] 64MB
[   56.071258] aspeed-smc 1e620000.spi: read control register: 203b0041
[   56.351736] 6 fixed-partitions partitions found on MTD device spi0.0
[   56.352240] Creating 6 MTD partitions on "spi0.0":
[   56.352877] 0x000000000000-0x0000000e0000 : "u-boot"
[   56.360379] 0x0000000e0000-0x0000000f0000 : "env"
[   56.365009] 0x0000000f0000-0x000000100000 : "meta"
[   56.369797] 0x000000100000-0x000007800000 : "fit"
[   56.374189] 0x000007800000-0x000008000000 : "data0"
[   56.378778] 0x000000000000-0x000008000000 : "flash0"
[   56.383438] aspeed-smc 1e620000.spi: Using bus width 2 and 50 MHz SPI fr=
equency
[   56.383989] aspeed-smc 1e620000.spi: mx66l1g45g (131072 Kbytes)
[   56.384700] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x3000000=
0 ] 128MB
[   56.385101] aspeed-smc 1e620000.spi: CE2 window [ 0x30000000 - 0x3000000=
0 ] 0MB (disabled)
[   56.385538] aspeed-smc 1e620000.spi: read control register: 203b0045
[   56.393593] aspeed-smc 1e620000.spi: Calibration area too uniform, using=
 low speed
[   56.394132] 1 fixed-partitions partitions found on MTD device spi0.1
[   56.394461] Creating 1 MTD partitions on "spi0.1":
[   56.394731] 0x000000000000-0x000008000000 : "flash1"
[   56.400972] aspeed-smc 1e630000.spi: Using bus width 1 and 5 MHz SPI fre=
quency
[   56.401459] aspeed-smc 1e630000.spi: mx66l1g45g (131072 Kbytes)
[   56.401854] aspeed-smc 1e630000.spi: CE0 window resized to 32MB
[   56.402507] aspeed-smc 1e630000.spi: CE0 window [ 0x30000000 - 0x3200000=
0 ] 32MB
[   56.402913] aspeed-smc 1e630000.spi: CE1 window [ 0x32000000 - 0x3200000=
0 ] 0MB (disabled)
[   56.403375] aspeed-smc 1e630000.spi: CE0 window too small for chip 128MB
[   56.403747] aspeed-smc 1e630000.spi: read control register: 000b0045
[   56.409682] aspeed-smc 1e630000.spi: Calibration area too uniform, using=
 low speed
[   56.410151] 1 fixed-partitions partitions found on MTD device spi1.0
[   56.410484] Creating 1 MTD partitions on "spi1.0":
[   56.410783] 0x000000000000-0x000002000000 : "spi-flash"
[   56.427849] 93xx46 spi2.2: 16-bit eeprom=20
[   56.432832] libphy: Fixed MDIO Bus: probed
[   56.435423] libphy: mdio-aspeed: probed
[   56.593227] ftgmac100 1e690000.ftgmac: Read MAC address 1a:19:0a:f9:79:b=
5 from chip
[   56.595943] RTL8211E Gigabit Ethernet 1e650008.mdio-1:0d: attached PHY d=
river [RTL8211E Gigabit Ethernet] (mii_bus:phy_addr=3D1e650008.mdio-1:0d, i=
rq=3DPOLL)
[   56.600377] ftgmac100 1e690000.ftgmac eth0: irq 32, mapped at (ptrval)
[   56.601572] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   56.601997] ehci-platform: EHCI generic platform driver
[   56.614872] ehci-platform 1e6a3000.usb: EHCI Host Controller
[   56.615785] ehci-platform 1e6a3000.usb: new USB bus registered, assigned=
 bus number 1
[   56.622341] ehci-platform 1e6a3000.usb: irq 33, io mem 0x1e6a3000
[   56.657189] ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
[   56.663753] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[   56.664237] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   56.664663] usb usb1: Product: EHCI Host Controller
[   56.664949] usb usb1: Manufacturer: Linux 5.10.23-fuji ehci_hcd
[   56.665267] usb usb1: SerialNumber: 1e6a3000.usb
[   56.672074] hub 1-0:1.0: USB hub found
[   56.673132] hub 1-0:1.0: 6 ports detected
[   56.684468] aspeed-rtc 1e781000.rtc: registered as rtc0
[   56.684949] aspeed-rtc 1e781000.rtc: hctosys: unable to read the hardwar=
e clock
[   56.686508] i2c /dev entries driver
[   56.691494] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 0 registered, irq 43
[   56.693744] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 1 registered, irq 44
[   56.698151] aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 2 registered, irq 45
[   56.700616] aspeed-i2c-bus 1e78a200.i2c-bus: i2c bus 3 registered, irq 46
[   56.702647] aspeed-i2c-bus 1e78a280.i2c-bus: i2c bus 4 registered, irq 47
[   56.704518] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 5 registered, irq 48
[   56.706500] aspeed-i2c-bus 1e78a380.i2c-bus: i2c bus 6 registered, irq 49
[   56.708985] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 registered, irq 50
[   56.712996] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 registered, irq 51
[   56.714917] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 registered, irq 52
[   56.717081] aspeed-i2c-bus 1e78a580.i2c-bus: i2c bus 10 registered, irq =
53
[   56.721782] aspeed-i2c-bus 1e78a600.i2c-bus: i2c bus 11 registered, irq =
54
[   56.723748] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registered, irq =
55
[   56.725738] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registered, irq =
56
[   56.728085] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 registered, irq =
57
[   56.735182] i2c i2c-2: Added multiplexed i2c bus 16
[   56.736189] i2c i2c-2: Added multiplexed i2c bus 17
[   56.737812] i2c i2c-2: Added multiplexed i2c bus 18
[   56.738760] i2c i2c-2: Added multiplexed i2c bus 19
[   56.739717] i2c i2c-2: Added multiplexed i2c bus 20
[   56.740665] i2c i2c-2: Added multiplexed i2c bus 21
[   56.741573] i2c i2c-2: Added multiplexed i2c bus 22
[   56.742529] i2c i2c-2: Added multiplexed i2c bus 23
[   56.742894] pca954x 2-0070: registered 8 multiplexed busses for I2C swit=
ch pca9548
[   56.748186] i2c i2c-24: Added multiplexed i2c bus 48
[   56.749230] i2c i2c-24: Added multiplexed i2c bus 49
[   56.751110] i2c i2c-24: Added multiplexed i2c bus 50
[   56.752115] i2c i2c-24: Added multiplexed i2c bus 51
[   56.753122] i2c i2c-24: Added multiplexed i2c bus 52
[   56.754087] i2c i2c-24: Added multiplexed i2c bus 53
[   56.755211] i2c i2c-24: Added multiplexed i2c bus 54
[   56.756334] i2c i2c-24: Added multiplexed i2c bus 55
[   56.756657] pca954x 24-0071: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.757641] i2c i2c-8: Added multiplexed i2c bus 24
[   56.760821] i2c i2c-25: Added multiplexed i2c bus 56
[   56.761796] i2c i2c-25: Added multiplexed i2c bus 57
[   56.762721] i2c i2c-25: Added multiplexed i2c bus 58
[   56.763655] i2c i2c-25: Added multiplexed i2c bus 59
[   56.764620] i2c i2c-25: Added multiplexed i2c bus 60
[   56.765586] i2c i2c-25: Added multiplexed i2c bus 61
[   56.766555] i2c i2c-25: Added multiplexed i2c bus 62
[   56.767992] i2c i2c-25: Added multiplexed i2c bus 63
[   56.768313] pca954x 25-0072: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.768904] i2c i2c-8: Added multiplexed i2c bus 25
[   56.771960] i2c i2c-26: Added multiplexed i2c bus 64
[   56.772961] i2c i2c-26: Added multiplexed i2c bus 65
[   56.773966] i2c i2c-26: Added multiplexed i2c bus 66
[   56.775360] i2c i2c-26: Added multiplexed i2c bus 67
[   56.776314] i2c i2c-26: Added multiplexed i2c bus 68
[   56.777804] i2c i2c-26: Added multiplexed i2c bus 69
[   56.778752] i2c i2c-26: Added multiplexed i2c bus 70
[   56.779702] i2c i2c-26: Added multiplexed i2c bus 71
[   56.780050] pca954x 26-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.780634] i2c i2c-8: Added multiplexed i2c bus 26
[   56.783542] i2c i2c-27: Added multiplexed i2c bus 72
[   56.784487] i2c i2c-27: Added multiplexed i2c bus 73
[   56.785442] i2c i2c-27: Added multiplexed i2c bus 74
[   56.787169] i2c i2c-27: Added multiplexed i2c bus 75
[   56.793043] i2c i2c-27: Added multiplexed i2c bus 76
[   56.794057] i2c i2c-27: Added multiplexed i2c bus 77
[   56.795045] i2c i2c-27: Added multiplexed i2c bus 78
[   56.795985] i2c i2c-27: Added multiplexed i2c bus 79
[   56.796299] pca954x 27-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.797185] i2c i2c-8: Added multiplexed i2c bus 27
[   56.798389] i2c i2c-8: Added multiplexed i2c bus 28
[   56.799364] i2c i2c-8: Added multiplexed i2c bus 29
[   56.800384] i2c i2c-8: Added multiplexed i2c bus 30
[   56.801424] i2c i2c-8: Added multiplexed i2c bus 31
[   56.801762] pca954x 8-0070: registered 8 multiplexed busses for I2C swit=
ch pca9548
[   56.805480] i2c i2c-40: Added multiplexed i2c bus 80
[   56.806516] i2c i2c-40: Added multiplexed i2c bus 81
[   56.807901] i2c i2c-40: Added multiplexed i2c bus 82
[   56.809034] i2c i2c-40: Added multiplexed i2c bus 83
[   56.810115] i2c i2c-40: Added multiplexed i2c bus 84
[   56.811196] i2c i2c-40: Added multiplexed i2c bus 85
[   56.812272] i2c i2c-40: Added multiplexed i2c bus 86
[   56.813234] i2c i2c-40: Added multiplexed i2c bus 87
[   56.813559] pca954x 40-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.814152] i2c i2c-11: Added multiplexed i2c bus 40
[   56.817349] i2c i2c-41: Added multiplexed i2c bus 88
[   56.818492] i2c i2c-41: Added multiplexed i2c bus 89
[   56.819447] i2c i2c-41: Added multiplexed i2c bus 90
[   56.820460] i2c i2c-41: Added multiplexed i2c bus 91
[   56.821494] i2c i2c-41: Added multiplexed i2c bus 92
[   56.822467] i2c i2c-41: Added multiplexed i2c bus 93
[   56.823432] i2c i2c-41: Added multiplexed i2c bus 94
[   56.824398] i2c i2c-41: Added multiplexed i2c bus 95
[   56.824699] pca954x 41-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.825326] i2c i2c-11: Added multiplexed i2c bus 41
[   56.828930] i2c i2c-42: Added multiplexed i2c bus 96
[   56.829957] i2c i2c-42: Added multiplexed i2c bus 97
[   56.830973] i2c i2c-42: Added multiplexed i2c bus 98
[   56.832067] i2c i2c-42: Added multiplexed i2c bus 99
[   56.833093] i2c i2c-42: Added multiplexed i2c bus 100
[   56.834055] i2c i2c-42: Added multiplexed i2c bus 101
[   56.835032] i2c i2c-42: Added multiplexed i2c bus 102
[   56.836025] i2c i2c-42: Added multiplexed i2c bus 103
[   56.836331] pca954x 42-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.837553] i2c i2c-11: Added multiplexed i2c bus 42
[   56.841322] i2c i2c-43: Added multiplexed i2c bus 104
[   56.842633] i2c i2c-43: Added multiplexed i2c bus 105
[   56.843608] i2c i2c-43: Added multiplexed i2c bus 106
[   56.844531] i2c i2c-43: Added multiplexed i2c bus 107
[   56.845572] i2c i2c-43: Added multiplexed i2c bus 108
[   56.846565] i2c i2c-43: Added multiplexed i2c bus 109
[   56.847990] i2c i2c-43: Added multiplexed i2c bus 110
[   56.849011] i2c i2c-43: Added multiplexed i2c bus 111
[   56.849332] pca954x 43-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.849970] i2c i2c-11: Added multiplexed i2c bus 43
[   56.852977] i2c i2c-44: Added multiplexed i2c bus 112
[   56.854069] i2c i2c-44: Added multiplexed i2c bus 113
[   56.855084] i2c i2c-44: Added multiplexed i2c bus 114
[   56.856046] i2c i2c-44: Added multiplexed i2c bus 115
[   56.857649] i2c i2c-44: Added multiplexed i2c bus 116
[   56.858722] i2c i2c-44: Added multiplexed i2c bus 117
[   56.859760] i2c i2c-44: Added multiplexed i2c bus 118
[   56.860753] i2c i2c-44: Added multiplexed i2c bus 119
[   56.861073] pca954x 44-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.861716] i2c i2c-11: Added multiplexed i2c bus 44
[   56.864955] i2c i2c-45: Added multiplexed i2c bus 120
[   56.866307] i2c i2c-45: Added multiplexed i2c bus 121
[   56.868131] i2c i2c-45: Added multiplexed i2c bus 122
[   56.869168] i2c i2c-45: Added multiplexed i2c bus 123
[   56.870225] i2c i2c-45: Added multiplexed i2c bus 124
[   56.871186] i2c i2c-45: Added multiplexed i2c bus 125
[   56.872183] i2c i2c-45: Added multiplexed i2c bus 126
[   56.873163] i2c i2c-45: Added multiplexed i2c bus 127
[   56.873489] pca954x 45-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.874148] i2c i2c-11: Added multiplexed i2c bus 45
[   56.877856] i2c i2c-46: Added multiplexed i2c bus 128
[   56.879078] i2c i2c-46: Added multiplexed i2c bus 129
[   56.880082] i2c i2c-46: Added multiplexed i2c bus 130
[   56.881089] i2c i2c-46: Added multiplexed i2c bus 131
[   56.882090] i2c i2c-46: Added multiplexed i2c bus 132
[   56.883132] i2c i2c-46: Added multiplexed i2c bus 133
[   56.884143] i2c i2c-46: Added multiplexed i2c bus 134
[   56.885116] i2c i2c-46: Added multiplexed i2c bus 135
[   56.885441] pca954x 46-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.886078] i2c i2c-11: Added multiplexed i2c bus 46
[   56.889924] i2c i2c-47: Added multiplexed i2c bus 136
[   56.891118] i2c i2c-47: Added multiplexed i2c bus 137
[   56.892118] i2c i2c-47: Added multiplexed i2c bus 138
[   56.893111] i2c i2c-47: Added multiplexed i2c bus 139
[   56.894129] i2c i2c-47: Added multiplexed i2c bus 140
[   56.895142] i2c i2c-47: Added multiplexed i2c bus 141
[   56.896117] i2c i2c-47: Added multiplexed i2c bus 142
[   56.897597] i2c i2c-47: Added multiplexed i2c bus 143
[   56.897909] pca954x 47-0076: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.898521] i2c i2c-11: Added multiplexed i2c bus 47
[   56.898821] pca954x 11-0077: registered 8 multiplexed busses for I2C swi=
tch pca9548
[   56.900550] Driver for 1-wire Dallas network protocol.
[   56.911042] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised:=
 dm-devel@redhat.com
[   56.913911] sdhci: Secure Digital Host Controller Interface driver
[   56.914282] sdhci: Copyright(c) Pierre Ossman
[   56.914607] sdhci-pltfm: SDHCI platform and OF driver helper
[   56.923487] sdhci-aspeed 1e750100.sdhci: Configured for slot 0
[   56.924396] usbcore: registered new interface driver usbhid
[   56.924718] usbhid: USB HID core driver
[   56.961355] mmc0: SDHCI controller on 1e750100.sdhci [1e750100.sdhci] us=
ing ADMA
[   57.430400] aspeed_adc: probe of 1e6e9000.adc failed with error -110
[   57.932559] aspeed_adc: probe of 1e6e9100.adc failed with error -110
[   57.942220] NET: Registered protocol family 10
[   57.953700] Segment Routing with IPv6
[   57.954552] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   57.959271] NET: Registered protocol family 17
[   57.959743] 8021q: 802.1Q VLAN Support v1.8
[   57.960854] Registering SWP/SWPB emulation handler
[   57.977674] printk: console [netcon0] enabled
[   57.977991] netconsole: network logging started
[   58.034142] Freeing unused kernel memory: 1024K
[   58.090824] Checked W+X mappings: passed, no W+X pages found
[   58.091658] Run /init as init process
INIT: version 2.96 booting
Starting udev
[   60.235148] udevd[82]: starting version 3.2.9
[   60.254131] random: udevd: uninitialized urandom read (16 bytes read)
[   60.262988] random: udevd: uninitialized urandom read (16 bytes read)
[   60.265370] random: udevd: uninitialized urandom read (16 bytes read)
[   60.389024] udevd[83]: starting eudev-3.2.9
[   62.294767] timeriomem_rng 1e6e2524.hwrng: 32bits from 0x(ptrval) @ 1us
[   62.454561] random: fast init done
[   62.753937] random: crng init done
[   62.755663] random: 1 urandom warning(s) missed due to ratelimiting
[   66.331373] aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in US=
B2 mode
[   75.422233] i2c_dev_sysfs: loading out-of-tree module taints kernel.
jffs2_mount /dev/mtdblock4 to /mnt/data..
Check jffs2 filesystem health on /dev/mtdblock4..
jffs2 health check passed: no error found.
Warning: Bad CRC, using default environment
No filesystem found on /dev/mmcblk0 try: 1.
No filesystem found on /dev/mmcblk0 try: 2.
No filesystem found on /dev/mmcblk0 try: 3.
No filesystem found on /dev/mmcblk0 after 3 times try. Creating ext4 filesy=
stem..
Error: failed to create ext4 on /dev/mmcblk0:
mke2fs 1.45.4 (23-Sep-2019)
The file /dev/mmcblk0 does not exist and no size was specified.
hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid a=
rgument
Fri Mar  9 12:34:56 UTC 2018
Error: Read failed
Error: Read failed
Error: Read failed
[  103.408334] i2c i2c-0: new_device: Instantiated device slave-mqueue at 0=
x10
[  103.412402] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
[  103.416336] i2c i2c-1: new_device: Instantiated device mp2978 at 0x53
[  103.419466] i2c i2c-1: new_device: Instantiated device mp2978 at 0x59
[  103.427250] i2c i2c-2: new_device: Instantiated device scmcpld at 0x35
[  103.432585] i2c i2c-4: new_device: Instantiated device slave-mqueue at 0=
x10
[  103.436528] i2c i2c-4: new_device: Instantiated device smb_debugcardcpld=
 at 0x27
[  103.443253] i2c i2c-13: new_device: Instantiated device iobfpga at 0x35
[  103.452518] lm75 17-004c: hwmon3: sensor 'lm75'
[  103.453188] i2c i2c-17: new_device: Instantiated device lm75 at 0x4c
[  103.458258] lm75 17-004d: hwmon4: sensor 'lm75'
[  103.458874] i2c i2c-17: new_device: Instantiated device lm75 at 0x4d
[  103.468497] at24 19-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  103.469261] i2c i2c-19: new_device: Instantiated device 24c64 at 0x52
[  103.489445] at24 20-0050: 256 byte 24c02 EEPROM, writable, 1 bytes/write
[  103.490262] i2c i2c-20: new_device: Instantiated device 24c02 at 0x50
[  103.500750] at24 22-0052: 256 byte 24c02 EEPROM, writable, 1 bytes/write
[  103.501503] i2c i2c-22: new_device: Instantiated device 24c02 at 0x52
[  103.507291] lm75 3-0048: hwmon5: sensor 'lm75'
[  103.507896] i2c i2c-3: new_device: Instantiated device lm75 at 0x48
[  103.510119] xdpe132g5c 1-0040: PMBus status register not found
[  103.610279] lm75 3-0049: hwmon6: sensor 'lm75'
[  103.616747] i2c i2c-3: new_device: Instantiated device lm75 at 0x49
[  103.828042] lm75 3-004a: hwmon7: sensor 'lm75'
[  103.835702] i2c i2c-3: new_device: Instantiated device lm75 at 0x4a
[  104.039224] i2c i2c-3: new_device: Instantiated device tmp422 at 0x4c
[  104.110957] ucd9000 5-0035: Failed to read device ID
[  104.120939] i2c i2c-5: new_device: Instantiated device ucd90160 at 0x35
[  104.153556] ucd9000 5-0036: Failed to read device ID
[  104.158188] i2c i2c-5: new_device: Instantiated device ucd90160 at 0x36
[  104.192930] at24 8-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  104.197150] i2c i2c-8: new_device: Instantiated device 24c64 at 0x51
[  104.299050] lm75 8-004a: hwmon9: sensor 'lm75'
[  104.303696] i2c i2c-8: new_device: Instantiated device lm75 at 0x4a
[  104.475496] i2c i2c-48: new_device: Instantiated device psu_driver at 0x=
58
/etc/rcS.d/S59setup_i2c.sh: line 73: [: : integer expression expected
[  104.693117] i2c i2c-49: new_device: Instantiated device psu_driver at 0x=
5a
[  104.875922] lm75 50-004c: hwmon12: sensor 'lm75'
[  104.880532] i2c i2c-50: new_device: Instantiated device lm75 at 0x4c
[  105.074775] at24 50-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  105.078502] i2c i2c-50: new_device: Instantiated device 24c64 at 0x52
[  105.309714] lm75 51-0048: hwmon13: sensor 'tmp75'
[  105.314068] i2c i2c-51: new_device: Instantiated device tmp75 at 0x48
[  105.539539] lm75 52-0049: hwmon14: sensor 'tmp75'
[  105.543289] i2c i2c-52: new_device: Instantiated device tmp75 at 0x49
[  105.743003] pca953x 54-0021: using no AI
[  105.763640] pca953x 54-0021: failed writing register
[  105.771337] i2c i2c-54: new_device: Instantiated device pca9534 at 0x21
Error: Read failed
[  105.904629] i2c i2c-53: new_device: Instantiated device smb_pwrcpld at 0=
x60
[  105.938029] i2c i2c-56: new_device: Instantiated device psu_driver at 0x=
58
[  105.950784] i2c i2c-57: new_device: Instantiated device psu_driver at 0x=
5a
[  105.957554] lm75 59-0048: hwmon18: sensor 'tmp75'
[  105.958147] i2c i2c-59: new_device: Instantiated device tmp75 at 0x48
[  105.974393] lm75 60-0049: hwmon19: sensor 'tmp75'
[  105.974989] i2c i2c-60: new_device: Instantiated device tmp75 at 0x49
[  105.985607] pca953x 62-0021: using no AI
[  105.987135] pca953x 62-0021: failed writing register
[  105.987883] i2c i2c-62: new_device: Instantiated device pca9534 at 0x21
Error: Read failed
[  106.068626] i2c i2c-61: new_device: Instantiated device smb_pwrcpld at 0=
x60
[  106.078011] i2c i2c-64: new_device: Instantiated device fcbcpld at 0x33
[  106.087128] at24 65-0053: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.087763] i2c i2c-65: new_device: Instantiated device 24c64 at 0x53
[  106.097377] lm75 66-0049: hwmon22: sensor 'tmp75'
[  106.097915] i2c i2c-66: new_device: Instantiated device tmp75 at 0x49
[  106.107584] lm75 66-0048: hwmon23: sensor 'tmp75'
[  106.108275] i2c i2c-66: new_device: Instantiated device tmp75 at 0x48
[  106.117168] at24 68-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.117897] i2c i2c-68: new_device: Instantiated device 24c64 at 0x52
[  106.126195] at24 69-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.127163] i2c i2c-69: new_device: Instantiated device 24c64 at 0x52
[  106.136107] at24 70-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.136737] i2c i2c-70: new_device: Instantiated device 24c64 at 0x52
[  106.146393] at24 71-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.147590] i2c i2c-71: new_device: Instantiated device 24c64 at 0x52
[  106.156131] i2c i2c-72: new_device: Instantiated device fcbcpld at 0x33
[  106.165104] at24 73-0053: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.165829] i2c i2c-73: new_device: Instantiated device 24c64 at 0x53
[  106.175408] lm75 74-0049: hwmon25: sensor 'tmp75'
[  106.175931] i2c i2c-74: new_device: Instantiated device tmp75 at 0x49
[  106.181999] lm75 74-0048: hwmon26: sensor 'tmp75'
[  106.182485] i2c i2c-74: new_device: Instantiated device tmp75 at 0x48
[  106.187840] at24 76-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.188415] i2c i2c-76: new_device: Instantiated device 24c64 at 0x52
[  106.193251] at24 77-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.193842] i2c i2c-77: new_device: Instantiated device 24c64 at 0x52
[  106.198919] at24 78-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.199486] i2c i2c-78: new_device: Instantiated device 24c64 at 0x52
[  106.204136] at24 79-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.204826] i2c i2c-79: new_device: Instantiated device 24c64 at 0x52
[  106.209572] at24 28-0050: 256 byte 24c02 EEPROM, writable, 1 bytes/write
[  106.210163] i2c i2c-28: new_device: Instantiated device 24c02 at 0x50
[  106.215038] i2c i2c-80: new_device: Instantiated device domfpga at 0x60
[  106.220733] at24 81-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.221365] i2c i2c-81: new_device: Instantiated device 24c64 at 0x56
[  106.227170] lm75 82-0048: hwmon28: sensor 'tmp75'
[  106.227636] i2c i2c-82: new_device: Instantiated device tmp75 at 0x48
[  106.233275] lm75 83-004b: hwmon29: sensor 'tmp75'
[  106.233802] i2c i2c-83: new_device: Instantiated device tmp75 at 0x4b
[  106.240058] lm75 84-004a: hwmon30: sensor 'tmp75'
[  106.240662] i2c i2c-84: new_device: Instantiated device tmp75 at 0x4a
[  106.244498] i2c i2c-84: new_device: Instantiated device adm1278 at 0x10
[  106.248383] ucd9000 86-0034: Failed to read device ID
[  106.248924] i2c i2c-86: new_device: Instantiated device ucd90160 at 0x34
[  106.253557] i2c i2c-86: new_device: Instantiated device mp2975 at 0x6b
[  106.257713] i2c i2c-88: new_device: Instantiated device domfpga at 0x60
[  106.262731] at24 89-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.263391] i2c i2c-89: new_device: Instantiated device 24c64 at 0x56
[  106.269413] lm75 90-0048: hwmon32: sensor 'tmp75'
[  106.269992] i2c i2c-90: new_device: Instantiated device tmp75 at 0x48
[  106.275524] lm75 91-004b: hwmon33: sensor 'tmp75'
[  106.275995] i2c i2c-91: new_device: Instantiated device tmp75 at 0x4b
[  106.282038] lm75 92-004a: hwmon34: sensor 'tmp75'
[  106.282554] i2c i2c-92: new_device: Instantiated device tmp75 at 0x4a
[  106.286134] i2c i2c-92: new_device: Instantiated device adm1278 at 0x10
[  106.290026] ucd9000 94-0034: Failed to read device ID
[  106.290533] i2c i2c-94: new_device: Instantiated device ucd90160 at 0x34
[  106.294826] i2c i2c-94: new_device: Instantiated device mp2975 at 0x6b
[  106.299078] i2c i2c-96: new_device: Instantiated device domfpga at 0x60
[  106.304643] at24 97-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[  106.305269] i2c i2c-97: new_device: Instantiated device 24c64 at 0x56
[  106.311676] lm75 98-0048: hwmon36: sensor 'tmp75'
[  106.312331] i2c i2c-98: new_device: Instantiated device tmp75 at 0x48
[  106.318718] lm75 99-004b: hwmon37: sensor 'tmp75'
[  106.319289] i2c i2c-99: new_device: Instantiated device tmp75 at 0x4b
[  106.325294] lm75 100-004a: hwmon38: sensor 'tmp75'
[  106.325883] i2c i2c-100: new_device: Instantiated device tmp75 at 0x4a
[  106.330115] i2c i2c-100: new_device: Instantiated device adm1278 at 0x10
[  106.333737] ucd9000 102-0034: Failed to read device ID
[  106.334262] i2c i2c-102: new_device: Instantiated device ucd90160 at 0x34
[  106.339074] i2c i2c-102: new_device: Instantiated device mp2975 at 0x6b
[  106.346101] i2c i2c-104: new_device: Instantiated device domfpga at 0x60
[  106.354733] at24 105-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/wri=
te
[  106.355550] i2c i2c-105: new_device: Instantiated device 24c64 at 0x56
[  106.362197] lm75 106-0048: hwmon40: sensor 'tmp75'
[  106.362697] i2c i2c-106: new_device: Instantiated device tmp75 at 0x48
[  106.372590] lm75 107-004b: hwmon41: sensor 'tmp75'
[  106.373086] i2c i2c-107: new_device: Instantiated device tmp75 at 0x4b
[  106.382201] lm75 108-004a: hwmon42: sensor 'tmp75'
[  106.386271] i2c i2c-108: new_device: Instantiated device tmp75 at 0x4a
[  106.390653] i2c i2c-108: new_device: Instantiated device adm1278 at 0x10
[  106.394670] ucd9000 110-0034: Failed to read device ID
[  106.395252] i2c i2c-110: new_device: Instantiated device ucd90160 at 0x34
[  106.403130] i2c i2c-110: new_device: Instantiated device mp2975 at 0x6b
[  106.410818] i2c i2c-112: new_device: Instantiated device domfpga at 0x60
[  106.419726] at24 113-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/wri=
te
[  106.420406] i2c i2c-113: new_device: Instantiated device 24c64 at 0x56
[  106.429747] lm75 114-0048: hwmon44: sensor 'tmp75'
[  106.430331] i2c i2c-114: new_device: Instantiated device tmp75 at 0x48
[  106.439565] lm75 115-004b: hwmon45: sensor 'tmp75'
[  106.440158] i2c i2c-115: new_device: Instantiated device tmp75 at 0x4b
[  106.449843] lm75 116-004a: hwmon46: sensor 'tmp75'
[  106.450419] i2c i2c-116: new_device: Instantiated device tmp75 at 0x4a
[  106.457741] i2c i2c-116: new_device: Instantiated device adm1278 at 0x10
[  106.462107] ucd9000 118-0034: Failed to read device ID
[  106.462811] i2c i2c-118: new_device: Instantiated device ucd90160 at 0x34
[  106.467577] adm1275 16-0010: Failed to read Manufacturer ID
[  106.471263] adm1275 67-0010: Failed to read Manufacturer ID
[  106.474279] adm1275 75-0010: Failed to read Manufacturer ID
[  106.477585] adm1275 84-0010: Failed to read Manufacturer ID
[  106.480376] adm1275 92-0010: Failed to read Manufacturer ID
[  106.483290] adm1275 100-0010: Failed to read Manufacturer ID
[  106.486485] adm1275 108-0010: Failed to read Manufacturer ID
[  106.489919] adm1275 116-0010: Failed to read Manufacturer ID
[  106.492510] i2c i2c-118: new_device: Instantiated device mp2975 at 0x6b
[  106.515973] i2c i2c-120: new_device: Instantiated device domfpga at 0x60
[  106.796727] at24 121-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/wri=
te
[  106.803300] i2c i2c-121: new_device: Instantiated device 24c64 at 0x56
[  107.075387] lm75 122-0048: hwmon48: sensor 'tmp75'
[  107.080642] i2c i2c-122: new_device: Instantiated device tmp75 at 0x48
[  107.310029] lm75 123-004b: hwmon49: sensor 'tmp75'
[  107.315955] i2c i2c-123: new_device: Instantiated device tmp75 at 0x4b
[  107.524654] lm75 124-004a: hwmon50: sensor 'tmp75'
[  107.533468] i2c i2c-124: new_device: Instantiated device tmp75 at 0x4a
[  107.731969] adm1275 124-0010: Failed to read Manufacturer ID
[  107.735641] i2c i2c-124: new_device: Instantiated device adm1278 at 0x10
[  107.893495] ucd9000 126-0034: Failed to read device ID
[  107.898665] i2c i2c-126: new_device: Instantiated device ucd90160 at 0x34
[  108.106725] i2c i2c-126: new_device: Instantiated device mp2975 at 0x6b
[  108.211908] i2c i2c-128: new_device: Instantiated device domfpga at 0x60
[  108.430994] at24 129-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/wri=
te
[  108.435596] i2c i2c-129: new_device: Instantiated device 24c64 at 0x56
[  108.679021] lm75 130-0048: hwmon52: sensor 'tmp75'
[  108.683356] i2c i2c-130: new_device: Instantiated device tmp75 at 0x48
[  108.956751] lm75 131-004b: hwmon53: sensor 'tmp75'
[  108.961664] i2c i2c-131: new_device: Instantiated device tmp75 at 0x4b
[  109.044895] lm75 132-004a: hwmon54: sensor 'tmp75'
[  109.045471] i2c i2c-132: new_device: Instantiated device tmp75 at 0x4a
[  109.111409] adm1275 132-0010: Failed to read Manufacturer ID
[  109.112147] i2c i2c-132: new_device: Instantiated device adm1278 at 0x10
[  109.147844] ucd9000 134-0034: Failed to read device ID
[  109.148428] i2c i2c-134: new_device: Instantiated device ucd90160 at 0x34
[  109.153248] i2c i2c-134: new_device: Instantiated device mp2975 at 0x6b
[  109.157522] i2c i2c-136: new_device: Instantiated device domfpga at 0x60
[  109.170923] at24 137-0056: 8192 byte 24c64 EEPROM, writable, 1 bytes/wri=
te
[  109.171537] i2c i2c-137: new_device: Instantiated device 24c64 at 0x56
[  109.177598] lm75 138-0048: hwmon56: sensor 'tmp75'
[  109.178167] i2c i2c-138: new_device: Instantiated device tmp75 at 0x48
[  109.191556] lm75 139-004b: hwmon57: sensor 'tmp75'
[  109.192135] i2c i2c-139: new_device: Instantiated device tmp75 at 0x4b
[  109.212129] lm75 140-004a: hwmon58: sensor 'tmp75'
[  109.212719] i2c i2c-140: new_device: Instantiated device tmp75 at 0x4a
[  109.217666] adm1275 140-0010: Failed to read Manufacturer ID
[  109.218199] i2c i2c-140: new_device: Instantiated device adm1278 at 0x10
[  109.221974] ucd9000 142-0034: Failed to read device ID
[  109.222519] i2c i2c-142: new_device: Instantiated device ucd90160 at 0x34
[  109.227289] i2c i2c-142: new_device: Instantiated device mp2975 at 0x6b
[  109.232552] i2c i2c-12: new_device: Instantiated device smb_syscpld at 0=
x3e
checking i2c driver binding status
1-0040 (xdpe132g5c) - no driver bound
manually bind 1-0040 to driver xdpe132g5c
[  109.466703] xdpe132g5c 1-0040: PMBus status register not found
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
1-0053 (mp2978) - no driver bound
manually bind 1-0053 to driver mp2978
unable to locate i2c driver mp2978 in sysfs
1-0059 (mp2978) - no driver bound
manually bind 1-0059 to driver mp2978
unable to locate i2c driver mp2978 in sysfs
100-0010 (adm1278) - no driver bound
manually bind 100-0010 to driver adm1275
[  109.954811] adm1275 100-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
102-0034 (ucd90160) - no driver bound
manually bind 102-0034 to driver ucd9000
[  110.158551] ucd9000 102-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
102-006b (mp2975) - no driver bound
manually bind 102-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
108-0010 (adm1278) - no driver bound
manually bind 108-0010 to driver adm1275
[  110.592659] adm1275 108-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
110-0034 (ucd90160) - no driver bound
manually bind 110-0034 to driver ucd9000
[  110.807774] ucd9000 110-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
110-006b (mp2975) - no driver bound
manually bind 110-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
116-0010 (adm1278) - no driver bound
manually bind 116-0010 to driver adm1275
[  111.294368] adm1275 116-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
118-0034 (ucd90160) - no driver bound
manually bind 118-0034 to driver ucd9000
[  111.546569] ucd9000 118-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
118-006b (mp2975) - no driver bound
manually bind 118-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
124-0010 (adm1278) - no driver bound
manually bind 124-0010 to driver adm1275
[  112.019873] adm1275 124-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
126-0034 (ucd90160) - no driver bound
manually bind 126-0034 to driver ucd9000
[  112.247666] ucd9000 126-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
126-006b (mp2975) - no driver bound
manually bind 126-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
132-0010 (adm1278) - no driver bound
manually bind 132-0010 to driver adm1275
[  112.677662] adm1275 132-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
134-0034 (ucd90160) - no driver bound
manually bind 134-0034 to driver ucd9000
[  112.908971] ucd9000 134-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
134-006b (mp2975) - no driver bound
manually bind 134-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
140-0010 (adm1278) - no driver bound
manually bind 140-0010 to driver adm1275
[  113.340879] adm1275 140-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
142-0034 (ucd90160) - no driver bound
manually bind 142-0034 to driver ucd9000
[  113.563058] ucd9000 142-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
142-006b (mp2975) - no driver bound
manually bind 142-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
16-0010 (adm1278) - no driver bound
manually bind 16-0010 to driver adm1275
[  113.971779] adm1275 16-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
5-0035 (ucd90160) - no driver bound
manually bind 5-0035 to driver ucd9000
[  114.241678] ucd9000 5-0035: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
5-0036 (ucd90160) - no driver bound
manually bind 5-0036 to driver ucd9000
[  114.454173] ucd9000 5-0036: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
50-0014 (lp5012) - no driver bound
unable to find driver for 50-0014
54-0021 (pca9534) - no driver bound
manually bind 54-0021 to driver pca953x
[  114.806304] pca953x 54-0021: using no AI
[  114.807954] pca953x 54-0021: failed writing register
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
62-0021 (pca9534) - no driver bound
manually bind 62-0021 to driver pca953x
[  115.071450] pca953x 62-0021: using no AI
[  115.072682] pca953x 62-0021: failed writing register
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
67-0010 (adm1278) - no driver bound
manually bind 67-0010 to driver adm1275
[  115.290951] adm1275 67-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
75-0010 (adm1278) - no driver bound
manually bind 75-0010 to driver adm1275
[  115.535958] adm1275 75-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
84-0010 (adm1278) - no driver bound
manually bind 84-0010 to driver adm1275
[  115.762210] adm1275 84-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
86-0034 (ucd90160) - no driver bound
manually bind 86-0034 to driver ucd9000
[  115.960587] ucd9000 86-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
86-006b (mp2975) - no driver bound
manually bind 86-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
92-0010 (adm1278) - no driver bound
manually bind 92-0010 to driver adm1275
[  116.418662] adm1275 92-0010: Failed to read Manufacturer ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
94-0034 (ucd90160) - no driver bound
manually bind 94-0034 to driver ucd9000
[  116.632715] ucd9000 94-0034: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
94-006b (mp2975) - no driver bound
manually bind 94-006b to driver mp2975
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
total 134 i2c devices checked: 35 devices without drivers
exporting gpio (aspeed-gpio, GPIOF0), shadow=3DBMC_JTAG_MUX_IN
exporting gpio (aspeed-gpio, GPIOF1), shadow=3DBMC_UART_SEL_0
exporting gpio (aspeed-gpio, GPIOF2), shadow=3DBMC_FCM_1_SEL
exporting gpio (aspeed-gpio, GPIOF3), shadow=3DFCM_2_CARD_PRESENT
exporting gpio (aspeed-gpio, GPIOF4), shadow=3DFCM_1_CARD_PRESENT
exporting gpio (aspeed-gpio, GPIOF5), shadow=3DBMC_SCM_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOF6), shadow=3DFCM_2_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOF7), shadow=3DBMC_FCM_2_SEL
exporting gpio (aspeed-gpio, GPIOG0), shadow=3DFCM_1_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOG1), shadow=3DBMC_GPIO63
exporting gpio (aspeed-gpio, GPIOG2), shadow=3DUCD90160A_CNTRL
exporting gpio (aspeed-gpio, GPIOG3), shadow=3DBMC_UART_SEL_3
exporting gpio (aspeed-gpio, GPIOG4), shadow=3DSYS_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOG6), shadow=3DBMC_I2C_SEL
exporting gpio (aspeed-gpio, GPIOG7), shadow=3DBMC_GPIO53
exporting gpio (aspeed-gpio, GPIOI5), shadow=3DFPGA_BMC_CONFIG_DONE
exporting gpio (aspeed-gpio, GPIOI7), shadow=3DFPGA_NSTATUS
exporting gpio (aspeed-gpio, GPIOM3), shadow=3DBMC_UART_SEL_1
exporting gpio (aspeed-gpio, GPION0), shadow=3DLM75_ALERT
exporting gpio (aspeed-gpio, GPION2), shadow=3DCPU_RST#
exporting gpio (aspeed-gpio, GPION3), shadow=3DGPIO123_USB2BVBUSSNS
exporting gpio (aspeed-gpio, GPION4), shadow=3DGPIO126_USB2APWREN
exporting gpio (aspeed-gpio, GPION5), shadow=3DGPIO125_USB2AVBUSSNS
exporting gpio (aspeed-gpio, GPIOP0), shadow=3DBMC_UART_SEL_2
exporting gpio (aspeed-gpio, GPIOP6), shadow=3DBMC_GPIO61
exporting gpio (aspeed-gpio, GPIOV1), shadow=3DUCD90160A_2_GPI1
exporting gpio (aspeed-gpio, GPIOV2), shadow=3DUCD90160A_1_GPI1
exporting gpio (aspeed-gpio, GPIOV3), shadow=3DPWRMONITOR_BMC
exporting gpio (aspeed-gpio, GPIOV4), shadow=3DBMC_PWRGD
exporting gpio (aspeed-gpio, GPIOV5), shadow=3DFPGA_DEV_CLR_N
exporting gpio (aspeed-gpio, GPIOV6), shadow=3DFPGA_DEV_OE
exporting gpio (aspeed-gpio, GPIOV7), shadow=3DFPGA_CONFIG_SEL
exporting gpio (aspeed-gpio, GPIOW0), shadow=3DLPCD0
exporting gpio (aspeed-gpio, GPIOW1), shadow=3DLPCD1
exporting gpio (aspeed-gpio, GPIOW2), shadow=3DLPCD2
exporting gpio (aspeed-gpio, GPIOW3), shadow=3DLPCD3
exporting gpio (aspeed-gpio, GPIOW4), shadow=3DLPCCLK
exporting gpio (aspeed-gpio, GPIOW5), shadow=3DLPCFRAME#
exporting gpio (aspeed-gpio, GPIOW6), shadow=3DLPCIRQ#
exporting gpio (aspeed-gpio, GPIOW7), shadow=3DLPCRST#
exporting gpio (aspeed-gpio, GPIOX6), shadow=3DBMC_FPGA_JTAG_EN
exporting gpio (aspeed-gpio, GPIOX7), shadow=3DBMC_TPM_SPI_PIRQ_N
exporting gpio (aspeed-gpio, GPIOY2), shadow=3DBMC_GPIO57
exporting gpio (aspeed-gpio, GPIOY3), shadow=3DBMC_EMMC_RST_N
Unexpected magic word 0x0: Bad address
Failed to parse default EEPROM
Warning: Bad CRC, using default environment
Error: unable to read MAC address from EEPROM or uboot-env!
/etc/rcS.d/S80setup_board.sh: line 35: echo: write error: No such device or=
 address
/etc/rcS.d/S80setup_board.sh: line 45: /sys/bus/i2c/devices/12-003e/cpld_us=
b_mux_sel_0: Permission denied
/etc/rcS.d/S80setup_board.sh: line 46: /sys/bus/i2c/devices/12-003e/cpld_us=
b_mux_sel_1: Permission denied
/etc/rcS.d/S80setup_board.sh: line 55: echo: write error: No such device or=
 address
head: /sys/bus/i2c/devices/12-003e/board_type: No such file or directory
failed to export (54-0021, 0): No such device or address
failed to export (54-0021, 1): No such device or address
failed to export (54-0021, 2): No such device or address
failed to export (54-0021, 3): No such device or address
failed to export (54-0021, 4): No such device or address
head: /sys/bus/i2c/devices/2-0035/come_pwr_ok_status: Input/output error
Wait a few seconds to setup management port LED...
failed to export (54-0021, 7): No such device or address
failed to export (62-0021, 0): No such device or address
failed to export (62-0021, 1): No such device or address
failed to export (62-0021, 2): No such device or address
failed to export (62-0021, 3): No such device or address
failed to export (62-0021, 4): No such device or address
Write to PHY 0xe.0x1c, value is 0x8801
failed to export (62-0021, 7): No such device or address
Starting mTerm console server...done.
mTerm_log: mTerm: daemon started
Checking microserver power status ...=20
Write to PHY 0xe.0x1c, value is 0xb435
Done!
off
Power on microserver .../usr/local/bin/wedge_power.sh: line 96: echo: write=
 error: No such device or address
/usr/local/bin/wedge_power.sh: line 97: echo: write error: No such device o=
r address
 Failed
Error: Read failed
/etc/rcS.d/S86setup_avs.sh: line 28: [: : integer expression expected
Check AVS voltage...
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No su=
ch file or directory
Invalid AVS-Volt , re-create xdpe132g5c 1 times
[  128.987334] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[  129.005270] xdpe132g5c 1-0040: PMBus status register not found
[  129.005917] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No su=
ch file or directory
Invalid AVS-Volt , re-create xdpe132g5c 2 times
[  130.116449] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[  130.126471] xdpe132g5c 1-0040: PMBus status register not found
[  130.127397] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No su=
ch file or directory
Invalid AVS-Volt , re-create xdpe132g5c 3 times
[  131.216661] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[  131.222308] xdpe132g5c 1-0040: PMBus status register not found
[  131.222976] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No su=
ch file or directory
Invalid AVS-Volt , re-create xdpe132g5c 4 times
[  132.306346] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[  132.311651] xdpe132g5c 1-0040: PMBus status register not found
[  132.312474] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No su=
ch file or directory
Invalid AVS-Volt , re-create xdpe132g5c 5 times
[  133.450737] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[  133.459698] xdpe132g5c 1-0040: PMBus status register not found
[  133.460493] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
Error: Read failed
Invalid AVS value[126,130,134,138,142]
Starting USB Serial Console: usbcons.
Remove poweroff command from .bash
INIT: Entering runlevel: 5
[  134.564191] using random self ethernet address
[  134.566483] using random host ethernet address
[  134.571369] using host ethernet address: 02:00:00:00:00:02
[  134.572205] using self ethernet address: 02:00:00:00:00:01
[  135.597489] usb0: HOST MAC 02:00:00:00:00:02
[  135.607682] usb0: MAC 02:00:00:00:00:01
Configuring network interfaces... [  138.022046] g_cdc gadget: CDC Composit=
e Gadget, version: King Kamehameha Day 2008
[  138.022700] g_cdc gadget: g_cdc ready
Initializing Bridge-IC I2C Frequency...
Setting vendor information in /etc/dhcp/dhclient.conf
Unexpected magic word 0x0: Bad address
Failed to parse default EEPROM
[  145.769535] ftgmac100 1e690000.ftgmac eth0: Link is Up - 100Mbps/Full - =
flow control rx/tx
[  145.770602] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
net.ipv6.conf.usb0.autoconf =3D 0
net.ipv6.conf.usb0.router_solicitations =3D 0
done.
Starting random number generator daemon.
Setup dhclient for IPv6... done.
reloading rsyslogd ... done
Starting OpenBSD Secure Shell server: sshd
done.
Starting ntpd: done
starting rsyslogd ... rsyslogd: imfile: on startup file '/var/log/mTerm_fuj=
i.log' does not exist but is configured in static file monitor - this may i=
ndicate a misconfiguration. If the file appears at a later time, it will au=
tomatically be processed. Reason: No such file or directory [v8.2002.0]
done
Setup IPMI message handler... done.
Starting IPMB Rx/Tx Daemon
Setup Caching for Bridge IC info..done.
[  153.956518] i2c i2c-4: delete_device: Deleting device slave-mqueue at 0x=
10
[  153.972178] i2c i2c-4: new_device: Instantiated device slave-mqueue at 0=
x10
Setup Front Panel Daemon...done.
Setup bic monitoring... done.
[  154.305608] i2c i2c-0: delete_device: Deleting device slave-mqueue at 0x=
10
[  154.341113] i2c i2c-0: new_device: Instantiated device slave-mqueue at 0=
x10
Setting fan speed to 50%...
/usr/local/bin/set_fan_speed.sh: line 76: echo: write error: No such device=
 or address
Done setting fan speed
Error: Read failed
Starting fscd...
done.
Setup sensor monitoring for FUJI... done.
Setup crond...starting Busybox Periodic Command Scheduler: crond... done.
done.
ok: run: restapi: (pid 1136) 0s
Error: unable to disable the 2nd watchdog: FMC_WDT2=3D0xFFFFFFFF
Setup eMMC Daemon..
/dev/mmcblk0 does not exist. Exiting.

OpenBMC Release fuji-b9c651226b

bmc-oob login: root
Password:=20
Error: Cannot access Bridge-IC.
root@bmc-oob:~# exit
logout
qemu-system-arm: terminating on signal 2

