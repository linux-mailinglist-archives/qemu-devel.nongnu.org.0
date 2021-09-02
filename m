Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628403FEA79
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:15:10 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhsL-0001Af-G1
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLhq3-0008BX-86; Thu, 02 Sep 2021 04:12:47 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:39469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLhpw-00010D-V9; Thu, 02 Sep 2021 04:12:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 5FEC413EFCB;
 Thu,  2 Sep 2021 08:12:35 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 10:12:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013da31329-60e7-4193-8a9a-93acc3ee38b7,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
To: <pdel@fb.com>
References: <20210901225946.500125-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <60994ebb-d345-cc40-020e-2c14ed438097@kaod.org>
Date: Thu, 2 Sep 2021 10:12:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901225946.500125-1-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5dd25226-8b0b-46bb-9a23-5fa9d1b4905d
X-Ovh-Tracer-Id: 9760144817754245996
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, f4bug@amsat.org,
 qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 9/2/21 12:59 AM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> Adding a new Aspeed AST2600 machine type, uses MAC3 for ethernet1 and
> UART1 for the serial console, which is different than the existing
> ast2600-evb. Otherwise though, my usage so far hasn't required a
> different set of hardware strap registers or anything, so I just
> inherited the rest of the configuration from the ast2600-evb. If
> preferred, I can eliminate the inheritance and just declare Fuji
> completely independently.
> 
> I included more info in the commit message, but just for convenience,
> here's the DTS link and a link to an image I'm providing for the
> acceptance test.
> 
> https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-fuji.dts
> https://github.com/peterdelevoryas/openbmc/releases/download/fuji-v0.1-alpha/fuji.mtd

Are we sure the flash models fit what the machine expects ?

  [   41.314338] 6 fixed-partitions partitions found on MTD device spi0.0
  [   41.314600] Creating 6 MTD partitions on "spi0.0":
  [   41.314957] 0x000000000000-0x0000000e0000 : "u-boot"
  [   41.318355] 0x0000000e0000-0x0000000f0000 : "env"
  [   41.319747] 0x0000000f0000-0x000000100000 : "meta"
  [   41.321064] 0x000000100000-0x000007800000 : "fit"
  [   41.321247] mtd: partition "fit" extends beyond the end of device "spi0.0" -- size truncated to 0x3f00000
  [   41.322684] 0x000007800000-0x000008000000 : "data0"
  [   41.322827] mtd: partition "data0" is out of reach -- disabled
  [   41.324110] 0x000000000000-0x000008000000 : "flash0"
  [   41.324253] mtd: partition "flash0" extends beyond the end of device "spi0.0" -- size truncated to 0x4000000

More info in the log below.


Could we also define the list of expected I2C devices of the machine ? 

  [   42.336648] pca954x 2-0070: probe failed
  [   42.337169] pca954x 8-0070: probe failed
  [   42.337526] pca954x 11-0077: probe failed
  ...
  3-0048 (lm75) - no driver bound
  unable to find driver for 3-0048
  3-0049 (lm75) - no driver bound
  unable to find driver for 3-0049
  3-004a (lm75) - no driver bound
  unable to find driver for 3-004a
  3-004c (tmp422) - no driver bound
  Failed to open /sys/bus/i2c/devices/50-0052/eeprom: No such file or directory
  Failed to parse default EEPROM

QEMU has support for these devices 

Otherwise, it looks good. I have added an emmc drive and it is detected.

  Mounting /dev/mmcblk0 to /mnt/data1..
  [   65.611717] EXT4-fs (mmcblk0): mounted filesystem with ordered data mode. Opts: (null)
  /dev/mmcblk0 mounted successfully, device usage:
  Filesystem                Size      Used Available Use% Mounted on
  /dev/mmcblk0             15.7G     44.0M     14.8G   0% /mnt/data1


Here are some errors that would need investigation.

Is the Fuji using the Aspeed RTC ?

  hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument

That's a weird MMIO range for the ADC ?

  [   42.856022] aspeed_adc: probe of 1e6e9100.adc failed with error -110

And that's unexected :

  Error: unable to disable the 2nd watchdog: FMC_WDT2=0xFFFFFFFF


> 
> I'm not sure exactly what the requirements are on the image url
> provided, or the requirements of the image itself.
> 
> The existing OpenBMC acceptance tests mostly use images from the Linux
> Foundation repository's releases, e.g.
> 
> https://github.com/openbmc/openbmc/releases/download/2.9.0/obmc-phosphor-image-romulus.static.mtd
> 
> Although, I do see one image from a regular user's repo:
> 
> https://github.com/hskinnemoen/openbmc/releases/download/20200711-gsj-qemu-0/obmc-phosphor-image-gsj.static.mtd.gz
> 
> So maybe it's not that unreasonable? I also might be able to organize a
> release link on the official Facebook OpenBMC Github.

ok. That can come later but please split the patch in two : machine and
acceptance test and copy the maintainers on the second. Just add  :

    Cc: Cleber Rosa <crosa@redhat.com>
    Cc: Willian Rampazzo <willianr@redhat.com>


> As far as the actual requirements of the acceptance test, I didn't use
> the existing "do_test_arm_aspeed" because Fuji was sufficiently
> different (different U-Boot version, kernel address, CPU, SPI control
> register, doesn't use systemd), but I could try unifying them if there's
> interest or suggestions on how to do so.
> 
> By the way, Fuji takes a long time to boot on my Macbook:
> 
> (19/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_fuji_openbmc: PASS (85.13 s)

Yes. It also does on my laptop and QEMU is hogging my CPU. I don't know
why. May be the CPU are not correctly brought up. no cpuidle in the 
kernel ? I don't know much on this topic.

Output is below.

Thanks,

C.


> 
> The next longest boot time is <20 seconds:
> 
> 17/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast2500_romulus_openbmc_v2_9_0: PASS (17.46 s)
> 
> Not sure if that's a problem for the CIT infra time or not.
> 
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>   hw/arm/aspeed: Add Fuji machine type
> 
>  hw/arm/aspeed.c                        | 14 ++++++++++++++
>  tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 





U-Boot 2019.04 fuji-b9c651226b (Aug 25 2021 - 17:27:02 +0000)

SOC: AST2600-A3 
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
Model: Aspeed BMC
DRAM:  896 MiB (capacity:1024 MiB, VGA:64 MiB, ECC:on, ECC size:896 MiB)
MMC:   emmc_slot0@100: 0
Loading Environment from SPI Flash... SF: Detected w25q512jv with page size 256 Bytes, erase size 4 KiB, total 64 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Model: Aspeed BMC
Net:   
Warning: ftgmac@1e690000 (eth1) using random MAC address - 66:32:35:58:26:53
eth1: ftgmac@1e690000
autoboot in 2 seconds (stop with 'Delete' key)...
## Loading kernel from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x201000e0
     Data Size:    3658752 Bytes = 3.5 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80008000
     Entry Point:  0x80008000
     Hash algo:    sha256
     Hash value:   966d2c13359bc53400606850e418559791cf7d35106f4801bf98138cd6f6b5b8
   Verifying Hash Integrity ... sha256+ OK
## Loading ramdisk from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  RAMDISK
     Type:         RAMDisk Image
     Compression:  lzma compressed
     Data Start:   0x2047d5d0
     Data Size:    21939893 Bytes = 20.9 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha256
     Hash value:   d51f4729786df5c7c2f75eea1f0dddf3a4fffe79c6bf39fc535bf901284aff4c
   Verifying Hash Integrity ... sha256+ OK
## Loading fdt from FIT Image at 20100000 ...
   Using 'conf@1' configuration
   Trying 'fdt@1' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x21969d68
     Data Size:    58335 Bytes = 57 KiB
     Architecture: ARM
     Hash algo:    sha256
     Hash value:   2e5a1f658d5930bb0ffa31dd214d11934739504ad4553b1a057ce544ac1618c9
   Verifying Hash Integrity ... sha256+ OK
   Booting using the fdt blob at 0x21969d68
   Loading Kernel Image ... OK
   Loading Ramdisk to 8eb13000, end 8ffff6b5 ... OK
   Loading Device Tree to 8eb01000, end 8eb123de ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0xf00
[    0.000000] Linux version 5.10.23-fuji (oe-user@oe-host) (arm-fb-linux-gnueabi-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34.0.20200220) #1 SMP Wed Aug 25 09:15:46 UTC 2021
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Facebook Fuji BMC
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 16 MiB at 0xb7000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000b7ffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000b7ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000b7ffffff]
[    0.000000] percpu: Embedded 20 pages/cpu s50380 r8192 d23348 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 227584
[    0.000000] Kernel command line: console=ttyS0,9600n8 root=/dev/ram rw vmalloc=640M
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 859132K/917504K available (8192K kernel code, 711K rwdata, 2036K rodata, 1024K init, 182K bss, 41988K reserved, 16384K cma-reserved, 0K highmem)
[    0.000000] random: get_random_u32 called from cache_alloc_refill+0x3d4/0x8e4 with crng_init=0
[    0.000000] ftrace: allocating 27560 entries in 54 pages
[    0.000000] ftrace: allocated 54 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] arch_timer: cp15 timer(s) running at 1200.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x114c1bbbeec, max_idle_ns: 440795229572 ns
[    0.000182] sched_clock: 56 bits at 1200MHz, resolution 0ns, wraps every 2199023255551ns
[    0.000368] Switching to timer-based delay loop, resolution 0ns
[    0.008298] Console: colour dummy device 80x30
[    0.013127] Calibrating delay loop (skipped), value calculated using timer frequency.. 2400.00 BogoMIPS (lpj=12000000)
[    0.013387] pid_max: default: 32768 minimum: 301
[    0.014989] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.015047] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.028837] CPU: Testing write buffer coherency: ok
[    0.039491] /cpus/cpu@f00 missing clock-frequency property
[    0.039603] /cpus/cpu@f01 missing clock-frequency property
[    0.039801] CPU0: thread -1, cpu 0, socket 15, mpidr 80000f00
[    0.047978] Setting up static identity map for 0x80100000 - 0x80100078
[    0.048860] rcu: Hierarchical SRCU implementation.
[    0.054656] smp: Bringing up secondary CPUs ...
[    0.057899] CPU1: thread -1, cpu 1, socket 15, mpidr 80000f01
[    0.061573] smp: Brought up 1 node, 2 CPUs
[    0.061688] SMP: Total of 2 processors activated (4800.00 BogoMIPS).
[    0.061759] CPU: All CPU(s) started in SVC mode.
[    0.074798] devtmpfs: initialized
[    0.102350] VFP support v0.3: implementor 41 architecture 2 part 30 variant 7 rev 5
[    0.120576] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.121493] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.125917] pinctrl core: initialized pinctrl subsystem
[    0.135857] NET: Registered protocol family 16
[    0.159246] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.164901] No ATAGs?
[    0.165653] hw-breakpoint: CPU 0 debug is powered down!
[    0.283699] SCSI subsystem initialized
[    0.284914] usbcore: registered new interface driver usbfs
[    0.285188] usbcore: registered new interface driver hub
[    0.285355] usbcore: registered new device driver usb
[    0.285735] mc: Linux media interface: v0.10
[    0.285845] videodev: Linux video capture interface: v2.00
[    0.286081] EDAC MC: Ver: 3.0.0
[    0.305952] clocksource: Switched to clocksource arch_sys_counter
[    0.382130] NET: Registered protocol family 2
[    0.387793] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes, linear)
[    0.387897] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.388103] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.388279] TCP: Hash tables configured (established 8192 bind 8192)
[    0.389221] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.389434] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.390884] NET: Registered protocol family 1
[    0.395625] Unpacking initramfs...
[   41.082531] Freeing initrd memory: 21428K
[   41.086695] workingset: timestamp_bits=30 max_order=18 bucket_order=0
[   41.088151] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   41.088211] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[   41.089642] NET: Registered protocol family 38
[   41.089919] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
[   41.090043] io scheduler mq-deadline registered
[   41.090130] io scheduler kyber registered
[   41.169551] Serial: 8250/16550 driver, 17 ports, IRQ sharing enabled
[   41.183421] printk: console [ttyS0] disabled
[   41.185093] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq = 40, base_baud = 1500000) is a 16550A
[   41.202343] printk: console [ttyS0] enabled
[   41.204600] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 41, base_baud = 1500000) is a 16550A
[   41.206867] 1e78d000.serial: ttyS1 at MMIO 0x1e78d000 (irq = 42, base_baud = 1500000) is a 16550A
[   41.222532] loop: module loaded
[   41.244723] aspeed-smc 1e620000.spi: Using bus width 2 and 50 MHz SPI frequency
[   41.248653] aspeed-smc 1e620000.spi: w25q512jv (65536 Kbytes)
[   41.249022] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x24000000 ] 64MB
[   41.249518] aspeed-smc 1e620000.spi: CE1 window [ 0x24000000 - 0x2c000000 ] 128MB
[   41.249789] aspeed-smc 1e620000.spi: read control register: 203c0041
[   41.314338] 6 fixed-partitions partitions found on MTD device spi0.0
[   41.314600] Creating 6 MTD partitions on "spi0.0":
[   41.314957] 0x000000000000-0x0000000e0000 : "u-boot"
[   41.318355] 0x0000000e0000-0x0000000f0000 : "env"
[   41.319747] 0x0000000f0000-0x000000100000 : "meta"
[   41.321064] 0x000000100000-0x000007800000 : "fit"
[   41.321247] mtd: partition "fit" extends beyond the end of device "spi0.0" -- size truncated to 0x3f00000
[   41.322684] 0x000007800000-0x000008000000 : "data0"
[   41.322827] mtd: partition "data0" is out of reach -- disabled
[   41.324110] 0x000000000000-0x000008000000 : "flash0"
[   41.324253] mtd: partition "flash0" extends beyond the end of device "spi0.0" -- size truncated to 0x4000000
[   41.326150] aspeed-smc 1e620000.spi: Using bus width 2 and 50 MHz SPI frequency
[   41.326513] aspeed-smc 1e620000.spi: unrecognized JEDEC id bytes: 00 00 00 00 00 00
[   41.326870] Deleting MTD partitions on "spi0.0":
[   41.327042] Deleting u-boot MTD partition
[   41.422421] Deleting env MTD partition
[   41.509609] Deleting meta MTD partition
[   41.599398] Deleting fit MTD partition
[   41.686499] Deleting data0 MTD partition
[   41.776120] Deleting flash0 MTD partition
[   41.871368] aspeed-smc 1e620000.spi: Aspeed SMC probe failed -2
[   42.101595] aspeed-smc: probe of 1e620000.spi failed with error -2
[   42.102599] aspeed-smc 1e630000.spi: Using bus width 1 and 5 MHz SPI frequency
[   42.103010] aspeed-smc 1e630000.spi: mx25u51245g (65536 Kbytes)
[   42.103180] aspeed-smc 1e630000.spi: CE0 window resized to 32MB
[   42.103600] aspeed-smc 1e630000.spi: CE0 window [ 0x30000000 - 0x32000000 ] 32MB
[   42.103826] aspeed-smc 1e630000.spi: CE1 window [ 0x32000000 - 0x32000000 ] 0MB (disabled)
[   42.104031] aspeed-smc 1e630000.spi: CE0 window too small for chip 64MB
[   42.104207] aspeed-smc 1e630000.spi: read control register: 000c0045
[   42.106541] aspeed-smc 1e630000.spi: No good frequency, using dumb slow
[   42.106767] 1 fixed-partitions partitions found on MTD device spi1.0
[   42.106908] Creating 1 MTD partitions on "spi1.0":
[   42.107031] 0x000000000000-0x000002000000 : "spi-flash"
[   42.116997] 93xx46 spi2.2: 16-bit eeprom 
[   42.119923] libphy: Fixed MDIO Bus: probed
[   42.121446] libphy: mdio-aspeed: probed
[   42.222494] ftgmac100 1e690000.ftgmac: Read MAC address 66:32:35:58:26:53 from chip
[   42.224028] RTL8211E Gigabit Ethernet 1e650008.mdio-1:0d: attached PHY driver [RTL8211E Gigabit Ethernet] (mii_bus:phy_addr=1e650008.mdio-1:0d, irq=POLL)
[   42.226442] ftgmac100 1e690000.ftgmac eth0: irq 32, mapped at (ptrval)
[   42.227043] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   42.227243] ehci-platform: EHCI generic platform driver
[   42.238980] ehci-platform 1e6a3000.usb: EHCI Host Controller
[   42.239525] ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
[   42.242802] ehci-platform 1e6a3000.usb: irq 33, io mem 0x1e6a3000
[   42.266828] ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
[   42.286145] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.10
[   42.286649] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   42.287097] usb usb1: Product: EHCI Host Controller
[   42.287397] usb usb1: Manufacturer: Linux 5.10.23-fuji ehci_hcd
[   42.287769] usb usb1: SerialNumber: 1e6a3000.usb
[   42.294596] hub 1-0:1.0: USB hub found
[   42.295784] hub 1-0:1.0: 6 ports detected
[   42.303867] aspeed-rtc 1e781000.rtc: registered as rtc0
[   42.304079] aspeed-rtc 1e781000.rtc: hctosys: unable to read the hardware clock
[   42.304905] i2c /dev entries driver
[   42.308232] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 0 registered, irq 43
[   42.309791] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 1 registered, irq 44
[   42.312424] aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 2 registered, irq 45
[   42.313869] aspeed-i2c-bus 1e78a200.i2c-bus: i2c bus 3 registered, irq 46
[   42.315551] aspeed-i2c-bus 1e78a280.i2c-bus: i2c bus 4 registered, irq 47
[   42.317003] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 5 registered, irq 48
[   42.318378] aspeed-i2c-bus 1e78a380.i2c-bus: i2c bus 6 registered, irq 49
[   42.319791] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 registered, irq 50
[   42.322515] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 registered, irq 51
[   42.323873] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 registered, irq 52
[   42.325427] aspeed-i2c-bus 1e78a580.i2c-bus: i2c bus 10 registered, irq 53
[   42.328548] aspeed-i2c-bus 1e78a600.i2c-bus: i2c bus 11 registered, irq 54
[   42.330116] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registered, irq 55
[   42.332137] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registered, irq 56
[   42.333751] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 registered, irq 57
[   42.336648] pca954x 2-0070: probe failed
[   42.337169] pca954x 8-0070: probe failed
[   42.337526] pca954x 11-0077: probe failed
[   42.338165] Driver for 1-wire Dallas network protocol.
[   42.342045] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[   42.343645] sdhci: Secure Digital Host Controller Interface driver
[   42.343827] sdhci: Copyright(c) Pierre Ossman
[   42.343945] sdhci-pltfm: SDHCI platform and OF driver helper
[   42.346611] usbcore: registered new interface driver usbhid
[   42.346784] usbhid: USB HID core driver
[   42.348478] aspeed_adc 1e6e9000.adc: trim 8 
[   42.348960] sdhci-aspeed 1e750100.sdhci: Configured for slot 0
[   42.349652] aspeed_adc 1e6e9000.adc: cv 512 
[   42.379121] mmc0: SDHCI controller on 1e750100.sdhci [1e750100.sdhci] using ADMA
[   42.430954] mmc0: new high speed MMC card at address 0001
[   42.433626] mmcblk0: mmc0:0001 QEMU! 16.0 GiB 
[   42.434239] mmcblk0boot0: mmc0:0001 QEMU! partition 1 1.00 MiB
[   42.434735] mmcblk0boot1: mmc0:0001 QEMU! partition 2 1.00 MiB
[   42.435553] mmcblk0rpmb: mmc0:0001 QEMU! partition 3 128 KiB, chardev (246:0)
[   42.460224] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   42.460505] GPT:29624393 != 33550335
[   42.460635] GPT:Alternate GPT header not at the end of the disk.
[   42.460800] GPT:29624393 != 33550335
[   42.460901] GPT: Use GNU Parted to correct GPT errors.
[   42.461746]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
[   42.856022] aspeed_adc: probe of 1e6e9100.adc failed with error -110
[   42.869730] NET: Registered protocol family 10
[   42.881157] Segment Routing with IPv6
[   42.881766] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   42.884824] NET: Registered protocol family 17
[   42.885419] 8021q: 802.1Q VLAN Support v1.8
[   42.886106] Registering SWP/SWPB emulation handler
[   42.893191] printk: console [netcon0] enabled
[   42.893415] netconsole: network logging started
[   42.924329] Freeing unused kernel memory: 1024K
[   42.955558] Checked W+X mappings: passed, no W+X pages found
[   42.955940] Run /init as init process
INIT: version 2.96 booting
Starting udev
[   44.366969] udevd[83]: starting version 3.2.9
[   44.377459] random: udevd: uninitialized urandom read (16 bytes read)
[   44.382885] random: udevd: uninitialized urandom read (16 bytes read)
[   44.384584] random: udevd: uninitialized urandom read (16 bytes read)
[   44.443411] udevd[84]: starting eudev-3.2.9
[   45.164092] timeriomem_rng 1e6e2524.hwrng: 32bits from 0x(ptrval) @ 1us
[   45.351882] random: fast init done
[   45.644240] random: crng init done
[   45.646545] random: 1 urandom warning(s) missed due to ratelimiting
[   46.304972] aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in USB2 mode
[   49.607914] i2c_dev_sysfs: loading out-of-tree module taints kernel.
No data0/dataro partition found. /mnt/data not mounted.
Cannot open /dev/mtd1: No such file or directory
No filesystem found on /dev/mmcblk0 try: 1.
[   57.552408] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   57.554458] GPT:29624393 != 33550335
[   57.554625] GPT:Alternate GPT header not at the end of the disk.
[   57.554806] GPT:29624393 != 33550335
[   57.554935] GPT: Use GNU Parted to correct GPT errors.
[   57.555981]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
No filesystem found on /dev/mmcblk0 try: 2.
[   57.741084] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   57.741498] GPT:29624393 != 33550335
[   57.741646] GPT:Alternate GPT header not at the end of the disk.
[   57.741899] GPT:29624393 != 33550335
[   57.742054] GPT: Use GNU Parted to correct GPT errors.
[   57.742392]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
No filesystem found on /dev/mmcblk0 try: 3.
No filesystem found on /dev/mmcblk0 after 3 times try. Creating ext4 filesystem..
[   57.907546] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   57.907831] GPT:29624393 != 33550335
[   57.907981] GPT:Alternate GPT header not at the end of the disk.
[   57.908245] GPT:29624393 != 33550335
[   57.908404] GPT: Use GNU Parted to correct GPT errors.
[   57.908700]  mmcblk0: p1 p2 p3 p4 p5 p6 p7
[   58.006800] mmc_erase: group start error -110, status 0x0
[   58.047138] mmc_erase: group start error -110, status 0x0
[   58.047610] blk_update_request: I/O error, dev mmcblk0, sector 0 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.048590] mmc_erase: group start error -110, status 0x0
[   58.048888] blk_update_request: I/O error, dev mmcblk0, sector 4096 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.049715] mmc_erase: group start error -110, status 0x0
[   58.049959] blk_update_request: I/O error, dev mmcblk0, sector 8192 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.050692] mmc_erase: group start error -110, status 0x0
[   58.050889] blk_update_request: I/O error, dev mmcblk0, sector 12288 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.051522] mmc_erase: group start error -110, status 0x0
[   58.051720] blk_update_request: I/O error, dev mmcblk0, sector 16384 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.052321] mmc_erase: group start error -110, status 0x0
[   58.052494] blk_update_request: I/O error, dev mmcblk0, sector 20480 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.053187] mmc_erase: group start error -110, status 0x0
[   58.053383] blk_update_request: I/O error, dev mmcblk0, sector 24576 op 0x3:(DISCARD) flags 0x4800 phys_seg 1 prio class 0
[   58.053999] mmc_erase: group start error -110, status 0x0
[   58.054193] blk_update_request: I/O error, dev mmcblk0, sector 28672 op 0x3:(DISCARD) flags 0x800 phys_seg 1 prio class 0
Mounting /dev/mmcblk0 to /mnt/data1..
[   65.611717] EXT4-fs (mmcblk0): mounted filesystem with ordered data mode. Opts: (null)
/dev/mmcblk0 mounted successfully, device usage:
Filesystem                Size      Used Available Use% Mounted on
/dev/mmcblk0             15.7G     44.0M     14.8G   0% /mnt/data1
hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
Fri Mar  9 12:34:56 UTC 2018
Error: Could not open file `/dev/i2c-55' or `/dev/i2c/55': No such file or directory
Error: Could not open file `/dev/i2c-63' or `/dev/i2c/63': No such file or directory
Error: Read failed
[   70.851421] i2c i2c-0: new_device: Instantiated device slave-mqueue at 0x10
[   70.857562] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
[   70.860010] i2c i2c-1: new_device: Instantiated device mp2978 at 0x53
[   70.862020] i2c i2c-1: new_device: Instantiated device mp2978 at 0x59
[   70.869643] i2c i2c-2: new_device: Instantiated device scmcpld at 0x35
[   70.877706] i2c i2c-4: new_device: Instantiated device slave-mqueue at 0x10
[   70.880601] i2c i2c-4: new_device: Instantiated device smb_debugcardcpld at 0x27
[   70.884359] i2c i2c-13: new_device: Instantiated device iobfpga at 0x35
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-17/new_device: No such file or directory
[   70.901495] xdpe132g5c 1-0040: PMBus status register not found
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-17/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-19/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-20/new_device: No such file or directory
[   71.061245] i2c i2c-3: new_device: Instantiated device lm75 at 0x48
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-22/new_device: No such file or directory
[   71.707488] i2c i2c-3: new_device: Instantiated device lm75 at 0x49
[   71.762221] i2c i2c-3: new_device: Instantiated device lm75 at 0x4a
[   71.776395] tmp421 3-004c: Could not read configuration register (-6)
[   71.776815] i2c i2c-3: new_device: Instantiated device tmp422 at 0x4c
[   71.785568] ucd9000 5-0035: Failed to read device ID
[   71.785959] i2c i2c-5: new_device: Instantiated device ucd90160 at 0x35
[   71.795967] ucd9000 5-0036: Failed to read device ID
[   71.798393] i2c i2c-5: new_device: Instantiated device ucd90160 at 0x36
[   71.897336] i2c i2c-8: new_device: Instantiated device 24c64 at 0x51
[   72.007781] i2c i2c-8: new_device: Instantiated device lm75 at 0x4a
/etc/rcS.d/S59setup_i2c.sh: line 73: [: : integer expression expected
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-48/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-49/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-50/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-50/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-51/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-52/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-54/new_device: No such file or directory
Error: Could not open file `/dev/i2c-55' or `/dev/i2c/55': No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-53/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-56/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-57/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-59/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-60/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-62/new_device: No such file or directory
Error: Could not open file `/dev/i2c-63' or `/dev/i2c/63': No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-61/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-64/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-65/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-66/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-66/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-68/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-69/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-70/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-71/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-72/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-73/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-74/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-74/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-76/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-77/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-78/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-79/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-28/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-80/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-81/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-82/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-83/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-84/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-84/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-86/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-86/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-88/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-89/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-90/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-91/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-92/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-92/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-94/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-94/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-96/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-97/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-98/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-99/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-100/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-100/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-102/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-102/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-104/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-105/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-106/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-107/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-108/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-108/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-110/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-110/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-112/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-113/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-114/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-115/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-116/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-116/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-118/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-118/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-120/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-121/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-122/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-123/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-124/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-124/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-126/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-126/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-128/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-129/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-130/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-131/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-132/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-132/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-134/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-134/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-136/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-137/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-138/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-139/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-140/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-140/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-142/new_device: No such file or directory
/usr/local/bin/i2c-utils.sh: line 40: /sys/bus/i2c/devices/i2c-142/new_device: No such file or directory
[   72.841988] i2c i2c-12: new_device: Instantiated device smb_syscpld at 0x3e
checking i2c driver binding status
1-0040 (xdpe132g5c) - no driver bound
manually bind 1-0040 to driver xdpe132g5c
[   72.932837] xdpe132g5c 1-0040: PMBus status register not found
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
1-0053 (mp2978) - no driver bound
manually bind 1-0053 to driver mp2978
unable to locate i2c driver mp2978 in sysfs
1-0059 (mp2978) - no driver bound
manually bind 1-0059 to driver mp2978
unable to locate i2c driver mp2978 in sysfs
11-0077 (pca9548) - no driver bound
manually bind 11-0077 to driver pca954x
[   73.262603] pca954x 11-0077: probe failed
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
2-0070 (pca9548) - no driver bound
manually bind 2-0070 to driver pca954x
[   73.429842] pca954x 2-0070: probe failed
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
3-0048 (lm75) - no driver bound
unable to find driver for 3-0048
3-0049 (lm75) - no driver bound
unable to find driver for 3-0049
3-004a (lm75) - no driver bound
unable to find driver for 3-004a
3-004c (tmp422) - no driver bound
unable to find driver for 3-004c
5-0035 (ucd90160) - no driver bound
manually bind 5-0035 to driver ucd9000
[   73.910736] ucd9000 5-0035: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
5-0036 (ucd90160) - no driver bound
manually bind 5-0036 to driver ucd9000
[   74.082564] ucd9000 5-0036: Failed to read device ID
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
8-004a (lm75) - no driver bound
unable to find driver for 8-004a
8-0051 (24c64) - no driver bound
manually bind 8-0051 to driver at24
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
8-0070 (pca9548) - no driver bound
manually bind 8-0070 to driver pca954x
[   74.571980] pca954x 8-0070: probe failed
/usr/local/bin/i2c-utils.sh: line 168: echo: write error: No such device
total 18 i2c devices checked: 14 devices without drivers
exporting gpio (aspeed-gpio, GPIOF0), shadow=BMC_JTAG_MUX_IN
exporting gpio (aspeed-gpio, GPIOF1), shadow=BMC_UART_SEL_0
exporting gpio (aspeed-gpio, GPIOF2), shadow=BMC_FCM_1_SEL
exporting gpio (aspeed-gpio, GPIOF3), shadow=FCM_2_CARD_PRESENT
exporting gpio (aspeed-gpio, GPIOF4), shadow=FCM_1_CARD_PRESENT
exporting gpio (aspeed-gpio, GPIOF5), shadow=BMC_SCM_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOF6), shadow=FCM_2_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOF7), shadow=BMC_FCM_2_SEL
exporting gpio (aspeed-gpio, GPIOG0), shadow=FCM_1_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOG1), shadow=BMC_GPIO63
exporting gpio (aspeed-gpio, GPIOG2), shadow=UCD90160A_CNTRL
exporting gpio (aspeed-gpio, GPIOG3), shadow=BMC_UART_SEL_3
exporting gpio (aspeed-gpio, GPIOG4), shadow=SYS_CPLD_JTAG_EN_N
exporting gpio (aspeed-gpio, GPIOG6), shadow=BMC_I2C_SEL
exporting gpio (aspeed-gpio, GPIOG7), shadow=BMC_GPIO53
exporting gpio (aspeed-gpio, GPIOI5), shadow=FPGA_BMC_CONFIG_DONE
exporting gpio (aspeed-gpio, GPIOI7), shadow=FPGA_NSTATUS
exporting gpio (aspeed-gpio, GPIOM3), shadow=BMC_UART_SEL_1
exporting gpio (aspeed-gpio, GPION0), shadow=LM75_ALERT
exporting gpio (aspeed-gpio, GPION2), shadow=CPU_RST#
exporting gpio (aspeed-gpio, GPION3), shadow=GPIO123_USB2BVBUSSNS
exporting gpio (aspeed-gpio, GPION4), shadow=GPIO126_USB2APWREN
exporting gpio (aspeed-gpio, GPION5), shadow=GPIO125_USB2AVBUSSNS
exporting gpio (aspeed-gpio, GPIOP0), shadow=BMC_UART_SEL_2
exporting gpio (aspeed-gpio, GPIOP6), shadow=BMC_GPIO61
exporting gpio (aspeed-gpio, GPIOV1), shadow=UCD90160A_2_GPI1
exporting gpio (aspeed-gpio, GPIOV2), shadow=UCD90160A_1_GPI1
exporting gpio (aspeed-gpio, GPIOV3), shadow=PWRMONITOR_BMC
exporting gpio (aspeed-gpio, GPIOV4), shadow=BMC_PWRGD
exporting gpio (aspeed-gpio, GPIOV5), shadow=FPGA_DEV_CLR_N
exporting gpio (aspeed-gpio, GPIOV6), shadow=FPGA_DEV_OE
exporting gpio (aspeed-gpio, GPIOV7), shadow=FPGA_CONFIG_SEL
exporting gpio (aspeed-gpio, GPIOW0), shadow=LPCD0
exporting gpio (aspeed-gpio, GPIOW1), shadow=LPCD1
exporting gpio (aspeed-gpio, GPIOW2), shadow=LPCD2
exporting gpio (aspeed-gpio, GPIOW3), shadow=LPCD3
exporting gpio (aspeed-gpio, GPIOW4), shadow=LPCCLK
exporting gpio (aspeed-gpio, GPIOW5), shadow=LPCFRAME#
exporting gpio (aspeed-gpio, GPIOW6), shadow=LPCIRQ#
exporting gpio (aspeed-gpio, GPIOW7), shadow=LPCRST#
exporting gpio (aspeed-gpio, GPIOX6), shadow=BMC_FPGA_JTAG_EN
exporting gpio (aspeed-gpio, GPIOX7), shadow=BMC_TPM_SPI_PIRQ_N
exporting gpio (aspeed-gpio, GPIOY2), shadow=BMC_GPIO57
exporting gpio (aspeed-gpio, GPIOY3), shadow=BMC_EMMC_RST_N
Failed to open /sys/bus/i2c/devices/50-0052/eeprom: No such file or directory
Failed to parse default EEPROM
Cannot open /dev/mtd1: No such file or directory
Error: unable to read MAC address from EEPROM or uboot-env!
/etc/rcS.d/S80setup_board.sh: line 35: echo: write error: No such device or address
/etc/rcS.d/S80setup_board.sh: line 45: /sys/bus/i2c/devices/12-003e/cpld_usb_mux_sel_0: Permission denied
/etc/rcS.d/S80setup_board.sh: line 46: /sys/bus/i2c/devices/12-003e/cpld_usb_mux_sel_1: Permission denied
/etc/rcS.d/S80setup_board.sh: line 55: echo: write error: No such device or address
head: /sys/bus/i2c/devices/12-003e/board_type: No such file or directory
failed to export (54-0021, 0): No such device or address
failed to export (54-0021, 1): No such device or address
failed to export (54-0021, 2): No such device or address
failed to export (54-0021, 3): No such device or address
failed to export (54-0021, 4): No such device or address
failed to export (54-0021, 7): No such device or address
head: /sys/bus/i2c/devices/2-0035/come_pwr_ok_status: Input/output error
Wait a few seconds to setup management port LED...
failed to export (62-0021, 0): No such device or address
failed to export (62-0021, 1): No such device or address
failed to export (62-0021, 2): No such device or address
failed to export (62-0021, 3): No such device or address
failed to export (62-0021, 4): No such device or address
failed to export (62-0021, 7): No such device or address
Starting mTerm console server...done.
Write to PHY 0xe.0x1c, value is 0x8801
mTerm_log: mTerm: daemon started
Checking microserver power status ... 
off
Write to PHY 0xe.0x1c, value is 0xb435
Done!
Power on microserver .../usr/local/bin/wedge_power.sh: line 96: echo: write error: No such device or address
/usr/local/bin/wedge_power.sh: line 97: echo: write error: No such device or address
 Failed
Error: Read failed
/etc/rcS.d/S86setup_avs.sh: line 28: [: : integer expression expected
Check AVS voltage...
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No such file or directory
Invalid AVS-Volt , re-create xdpe132g5c 1 times
[   82.496320] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[   82.500273] xdpe132g5c 1-0040: PMBus status register not found
[   82.500745] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No such file or directory
Invalid AVS-Volt , re-create xdpe132g5c 2 times
[   83.561020] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[   83.563241] xdpe132g5c 1-0040: PMBus status register not found
[   83.563581] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No such file or directory
Invalid AVS-Volt , re-create xdpe132g5c 3 times
[   84.661966] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[   84.665578] xdpe132g5c 1-0040: PMBus status register not found
[   84.666012] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No such file or directory
Invalid AVS-Volt , re-create xdpe132g5c 4 times
[   85.751988] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[   85.755831] xdpe132g5c 1-0040: PMBus status register not found
[   85.756250] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
cat: can't open '/sys/bus/i2c/devices/1-0040/hwmon/hwmon*/in3_input': No such file or directory
Invalid AVS-Volt , re-create xdpe132g5c 5 times
[   86.800715] i2c i2c-1: delete_device: Deleting device xdpe132g5c at 0x40
[   86.805334] xdpe132g5c 1-0040: PMBus status register not found
[   86.805741] i2c i2c-1: new_device: Instantiated device xdpe132g5c at 0x40
Error: Read failed
Invalid AVS value[126,130,134,138,142]
Starting USB Serial Console: usbcons.
Remove poweroff command from .bash
INIT: Entering runlevel: 5
[   88.102378] using random self ethernet address
[   88.104132] using random host ethernet address
[   88.107481] using host ethernet address: 02:00:00:00:00:02
[   88.108302] using self ethernet address: 02:00:00:00:00:01
[   89.030433] usb0: HOST MAC 02:00:00:00:00:02
[   89.032446] usb0: MAC 02:00:00:00:00:01
[   89.052630] g_cdc gadget: CDC Composite Gadget, version: King Kamehameha Day 2008
[   89.053131] g_cdc gadget: g_cdc ready
Configuring network interfaces... Setting vendor information in /etc/dhcp/dhclient.conf
Initializing Bridge-IC I2C Frequency...
Failed to open /sys/bus/i2c/devices/50-0052/eeprom: No such file or directory
Failed to parse default EEPROM
[   91.525079] ftgmac100 1e690000.ftgmac eth0: Link is Up - 100Mbps/Full - flow control rx/tx
[   91.526102] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
net.ipv6.conf.usb0.autoconf = 0
net.ipv6.conf.usb0.router_solicitations = 0
done.
Starting random number generator daemon.
Setup dhclient for IPv6... done.
reloading rsyslogd ... done
Starting OpenBSD Secure Shell server: sshd
  generating ssh RSA key...
  generating ssh ECDSA key...
  generating ssh DSA key...
  generating ssh ED25519 key...
done.
Starting ntpd: done
starting rsyslogd ... rsyslogd: imfile: on startup file '/var/log/mTerm_fuji.log' does not exist but is configured in static file monitor - this may indicate a misconfiguration. If the file appears at a later time, it will automatically be processed. Reason: No such file or directory [v8.2002.0]
done
Setup IPMI message handler... done.
Starting IPMB Rx/Tx Daemon
Setup Caching for Bridge IC info..done.
Setup Front Panel Daemon...done.
Setup bic monitoring... done.
[  106.568880] i2c i2c-4: delete_device: Deleting device slave-mqueue at 0x10
[  106.572161] i2c i2c-4: new_device: Instantiated device slave-mqueue at 0x10
[  106.654619] i2c i2c-0: delete_device: Deleting device slave-mqueue at 0x10
[  106.658349] i2c i2c-0: new_device: Instantiated device slave-mqueue at 0x10
Setting fan speed to 50%...
/usr/local/bin/set_fan_speed.sh: line 76: /sys/bus/i2c/devices/64-0033/fan1_pwm: No such file or directory
Done setting fan speed
Error: Read failed
Starting fscd...
done.
Setup sensor monitoring for FUJI... done.
Setup crond...starting Busybox Periodic Command Scheduler: crond... done.
done.
ok: run: restapi: (pid 1060) 1s
Error: unable to disable the 2nd watchdog: FMC_WDT2=0xFFFFFFFF
Setup eMMC Daemon..
eMMC /dev/mmcblk0 Device Summary:
- Vendor/Product: MFR(0XAA) QEMU!
- eMMC Revision: v4.41
- Secure Feature: secure-trim,auto-erase,secure-purge
- Device Health (PRE_EOL): Undefined
- Estimated Life Time (Type A): Undefined
- Bus Width: 4
- H/W Reset Function: temporarily disabled (default)
- Cache Control: OFF
emmcd not started: device life time estimates not supported.

OpenBMC Release fuji-b9c651226b

bmc-oob login: Error: Cannot access Bridge-IC.
root
Password: 
root@bmc-oob:~# lscpu
Architecture:        armv7l
Byte Order:          Little Endian
CPU(s):              2
On-line CPU(s) list: 0,1
Thread(s) per core:  1
Core(s) per socket:  2
Socket(s):           1
Vendor ID:           ARM
Model:               5
Model name:          Cortex-A7
Stepping:            r0p5
BogoMIPS:            2400.00
Flags:               half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
root@bmc-oob:~# uname -a 
Linux bmc-oob. 5.10.23-fuji #1 SMP Wed Aug 25 09:15:46 UTC 2021 armv7l GNU/Linux



