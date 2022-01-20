Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05AC494C71
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:03:37 +0100 (CET)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVE7-0008Bb-9K
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:03:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nATpO-0006dV-4i
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:34:01 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:49415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nATpE-0003sn-3u
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:33:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 996E420E71;
 Thu, 20 Jan 2022 09:33:42 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 10:33:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00157000dcc-7148-49eb-b749-60368e71cae0,
 55E834D54A8FC5F4505B49AAC2A2F9003410B5FE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2946064c-d08b-bc2c-959a-d54421b93b62@kaod.org>
Date: Thu, 20 Jan 2022 10:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/14] target/ppc: powerpc_excp improvements [40x] (3/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220118184448.852996-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c33782b2-ae63-48e5-88e1-d54fda6edc54
X-Ovh-Tracer-Id: 3203748185412635497
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehfeejledttddtiedtgeevudeggfeitdetueefudehfedtheegvefgtdeuvefgieenucffohhmrghinhepnhhonhhgnhhurdhorhhgpdgtohhnfhhighdrrhhunhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 19:44, Fabiano Rosas wrote:
> changes from v1:
> 
> - New patch that renames MSR_POW to MSR_WE for the 405.
> 
> - New patch that adds just MSR_ME to the msr_mask.
> 
> - New patches to cleanup exceptions I missed the first time around.
> 
> - Dropped the patch that added all the missing MSR bits. We have an
>    issue when two different MSR bits share the same number in different
>    CPUs. Described in v1 here:
> 
>    https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00503.html
> 
> - Dropped the patch that adds missing exception vectors because Linux
>    clearly cannot handle them. And I don't have access to real hardware
>    to confirm some of the questions raised, so let's keep things as they
>    are.
> 
> - Kept the split in two patches. One that copies powerpc_excp_legacy
>    and other that does the changes.
> 
> Based on legoater/ppc-7.0
> 
> With only the fixes from the above branch, the ref405ep machine boots
> until the shell. This series doesn't change that.


FYI, with a couple of extra patches, adding a hotfoot variant
machine and its PCI controller, network comes up with a rtl8139
and a virtio-net-pci devices. I2C seems fine. The only open issue
is the timer which is twice too fast.

I will merge this series, unless Fabiano wants to send a v3, and
the patch fixing the TLBs. The patches for the hotfoot variant can
come later.


Thanks,

C.


qemu-system-ppc -M ref405ep-hotfoot -serial null -kernel /path/to/linux.git/build_ppc40x/arch/powerpc/boot/cuImage.hotfoot.elf -initrd /home/legoater/work/buildroot/images//qemu_ppc_ref405ep-latest//rootfs.cpio -net nic,model=virtio-net-pci,netdev=net0,addr=3 -netdev bridge,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0 -device ds1338,address=0x68 -serial mon:stdio -nographic

Memory <- <0x0 0x8000000> (128MB)
CPU clock-frequency <- 0x7f28155 (133MHz)
CPU timebase-frequency <- 0x7f28155 (133MHz)
/plb: clock-frequency <- 1fca055 (33MHz)
/plb/opb: clock-frequency <- 1fca055 (33MHz)
/plb/ebc: clock-frequency <- 1fca055 (33MHz)
/plb/opb/serial@ef600300: clock-frequency <- 1d1079 (2MHz)
/plb/opb/serial@ef600400: clock-frequency <- 1d1079 (2MHz)
ethernet0: local-mac-address <- 00:00:00:00:00:00
ethernet1: local-mac-address <- 00:00:07:f2:81:55
Fixing devtree for 4M Flash

zImage starting: loaded at 0x00700000 (sp: 0xfff7ff98)
Decompression error: 'Not a gzip file'
No valid compressed data found, assume uncompressed data
Allocating 0x613ee0 bytes for kernel...
0x5f391c bytes of uncompressed data copied
Using loader supplied ramdisk at 0x1800000-0x1c6d800
initrd head: 0x30373037

Linux/PowerPC load:
Finalizing device tree... flat tree at 0xd1a960
Linux version 5.16.0-11200-g1d1df41c5a33-dirty (legoater@yukon) (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1), GNU ld version 2.35.2-1.fc34) #127 Thu Jan 20 10:19:47 CET 2022
Found initrd at 0xc1800000:0xc1c6d800
Using PowerPC 40x Platform machine description
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000100
   possible        = 0x0000000000000100
   always          = 0x0000000000000100
cpu_user_features = 0x86000000 0x00000000
mmu_features      = 0x00000004
-----------------------------------------------------
Zone ranges:
   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists, mobility grouping on.  Total pages: 32512
Kernel command line:
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Kernel virtual memory layout:
   * 0xffbdf000..0xfffff000  : fixmap
   * 0xc9000000..0xffbdf000  : vmalloc & ioremap
Memory: 119108K/131072K available (4372K kernel code, 248K rwdata, 1308K rodata, 168K init, 127K bss, 11964K reserved, 0K cma-reserved)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
UIC0 (32 IRQ sources) at DCR 0xc0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x1ec031343f, max_idle_ns: 440795203544 ns
clocksource: timebase mult[7800000] shift[24] registered
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
devtmpfs: initialized
random: get_random_u32 called from bucket_table_alloc.isra.0+0x74/0x170 with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
              
thermal_sys: Registered thermal governor 'step_wise'
PCI host bridge /plb/pci@ec000000 (primary) ranges:
  MEM 0x0000000080000000..0x000000009fffffff -> 0x0000000080000000
   IO 0x00000000e8000000..0x00000000e800ffff -> 0x0000000000000000
4xx PCI DMA offset set to 0x00000000
4xx PCI DMA window base to 0x0000000000000000
DMA window size 0x0000000080000000
PCI: Probing PCI hardware
PCI host bridge to bus 0008:00
pci_bus 0008:00: root bus resource [io  0x0000-0xffff]
pci_bus 0008:00: root bus resource [mem 0x80000000-0x9fffffff]
pci_bus 0008:00: root bus resource [bus 00-ff]
pci_bus 0008:00: busn_res: [bus 00-ff] end is updated to ff
pci 0008:00:00.0: [1014:027f] type 00 class 0x068000
PCI: Hiding 4xx host bridge resources 0008:00:00.0
pci 0008:00:03.0: [1af4:1000] type 00 class 0x020000
pci 0008:00:03.0: reg 0x10: [io  0x0000-0x001f]
pci 0008:00:03.0: reg 0x20: [mem 0x00000000-0x00003fff 64bit pref]
pci 0008:00:03.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
pci_bus 0008:00: busn_res: [bus 00-ff] end is updated to 00
pci 0008:00:03.0: BAR 6: assigned [mem 0x80000000-0x8003ffff pref]
pci 0008:00:03.0: BAR 4: assigned [mem 0x80040000-0x80043fff 64bit pref]
pci 0008:00:03.0: BAR 0: assigned [io  0x1000-0x101f]
pci_bus 0008:00: resource 4 [io  0x0000-0xffff]
pci_bus 0008:00: resource 5 [mem 0x80000000-0x9fffffff]
vgaarb: loaded
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
clocksource: Switched to clocksource timebase
NET: Registered PF_INET protocol family
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
PCI: CLS 0 bytes, default 32
Trying to unpack rootfs image as initramfs...
workingset: timestamp_bits=30 max_order=15 bucket_order=0
io scheduler mq-deadline registered
io scheduler kyber registered
virtio-pci 0008:00:03.0: enabling device (0000 -> 0003)
Freeing initrd memory: 4532K
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xef600400 (irq = 16, base_baud = 119047) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [udbg0] disabled
printk: bootconsole [udbg0] disabled
serial8250.0: ttyS1 at MMIO 0xef600300 (irq = 17, base_baud = 119047) is a 16550A
printk: console [ttyS0] disabled
printk: console [ttyS0] enabled
ef600300.serial: ttyS1 at MMIO 0xef600300 (irq = 17, base_baud = 119047) is a 16550
brd: module loaded
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
i2c_dev: i2c /dev entries driver
rtc-ds1307 0-0068: registered as rtc0
rtc-ds1307 0-0068: setting system clock to 2022-01-20T09:22:34 UTC (1642670554)
ibm-iic ef600500.i2c: using standard (100 kHz) mode
lm75: probe of 0-004a failed with error -121
NET: Registered PF_PACKET protocol family
drmem: No dynamic reconfiguration memory found
Freeing unused kernel image (initmem) memory: 168K
Kernel memory protection not selected by kernel config.
Run /init as init process
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: random: dd: uninitialized urandom read (512 bytes read)
OK
Starting network: udhcpc: started, v1.34.1
random: mktemp: uninitialized urandom read (6 bytes read)
udhcpc: broadcasting discover
udhcpc: broadcasting select for 192.168.199.76, server 192.168.199.1
udhcpc: lease of 192.168.199.76 obtained from 192.168.199.1, lease time 3600
deleting routers
random: mktemp: uninitialized urandom read (6 bytes read)
adding dns 192.168.199.1
OK

Welcome to Buildroot
buildroot login: root
# cat /proc/cpuinfo
processor	: 0
cpu		: 405EP
clock		: 133.333333MHz
revision	: 9.80 (pvr 5121 0950)
bogomips	: 266.66

timebase	: 133333333
platform	: PowerPC 40x Platform
model		: est,hotfoot
Memory		: 128 MB
# cat /proc/interrupts
            CPU0
  16:       1552       UIC   1 Level     ttyS0
  23:         12       UIC   2 Level     IBM IIC
  27:          8       UIC  27 Level     virtio0
LOC:      52166   Local timer interrupts for timer event device
BCT:          0   Broadcast timer interrupts for timer event device
LOC:          0   Local timer interrupts for others
SPU:          0   Spurious interrupts
PMI:          0   Performance monitoring interrupts
MCE:          0   Machine check exceptions
NMI:          0   System Reset interrupts
# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
     link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
     inet 192.168.199.76/24 brd 192.168.199.255 scope global eth0
        valid_lft forever preferred_lft forever
# hwclock random: fast init done

Thu Jan 20 09:22:53 2022  0.000000 seconds
#


