Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FF434E2D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:44:16 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCpD-0007Fm-Kp
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdCmv-0004dE-VB
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:41:55 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdCmt-0003Ry-E4
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:41:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 118E5C5E1186;
 Wed, 20 Oct 2021 16:41:50 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 16:41:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b8dd0763-eee8-4c4d-b688-6f7b2ff3eb33,
 92A7CFA44A7A8A14732DBB4BB7777608D4B8F25C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b713a091-848d-8164-2ff8-7953ac605ad2@kaod.org>
Date: Wed, 20 Oct 2021 16:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU?
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, LEROY
 Christophe <christophe.leroy@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <YWQB1FMhQfmqRYxN@yekko> <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
 <19612059-3e61-f920-339c-63162a94dd22@eik.bme.hu>
 <a4d1571d-0419-054d-b127-8c0b57425f6b@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a4d1571d-0419-054d-b127-8c0b57425f6b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 82ea5ca4-78bd-4911-b1ed-e38519b4a796
X-Ovh-Tracer-Id: 3075114124328274750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveekueeljeetjeekkedthfetudfgfedvudegudfgtdekvedvvddutedtuddvveeinecuffhomhgrihhnpegtohhnfhhighdrrhhunhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 16:34, Thomas Huth wrote:
> On 20/10/2021 16.31, BALATON Zoltan wrote:
>> On Wed, 20 Oct 2021, LEROY Christophe wrote:
>>> Le 20/10/2021 à 12:10, Cédric Le Goater a écrit :
>>>> I dont understand how
>>>>
>>>>    static bd_t bd;
>>>>
>>>> can be updated in the kernel.
>>>>
>>>
>>> It's not updated in the kernel.
>>>
>>> It is supposed to be provided by UBoot to Linux Kernel. But modern
>>> kernels don't take that anymore, they take a device tree. For this
>>> reason cuboot takes the content of bd to build/update the device tree.
>>>
>>> Looks like QEMU also provides the bd, see ref405ep_init()
>>>
>>> I managed to get a kernel booting with the following change (and with
>>> CONFIG_ETHERNET removed)
>>>
>>> diff --git a/arch/powerpc/boot/cuboot-hotfoot.c
>>> b/arch/powerpc/boot/cuboot-hotfoot.c
>>> index 888a6b9bfead..63a9545ff55d 100644
>>> --- a/arch/powerpc/boot/cuboot-hotfoot.c
>>> +++ b/arch/powerpc/boot/cuboot-hotfoot.c
>>> @@ -132,6 +132,12 @@ void platform_init(unsigned long r3, unsigned long
>>> r4, unsigned long r5,
>>>                    unsigned long r6, unsigned long r7)
>>>  {
>>>         CUBOOT_INIT();
>>> +        bd.bi_intfreq = 133333333;
>>> +        bd.bi_busfreq = 33333333;
>>> +        bd.bi_procfreq = 133333333;
>>> +        bd.bi_plb_busfreq = 33333333;
>>> +        bd.bi_pci_busfreq = 33333333;
>>> +        bd.bi_opbfreq = 33333333;
>>>         platform_ops.fixups = hotfoot_fixups;
>>>          platform_ops.exit = ibm40x_dbcr_reset;
>>>         fdt_init(_dtb_start);
>>
>> So maybe taihu should also provide this boot info when linux_boot is true (i.e. using -kernel) like the ref405ep does? Usually when using -kernel without -bios then QEMU has to also emulate enough of what the firmware would otherwise do like setting up devices and setting boot environment. Or if we have both -bios and -kernel then maybe -kernel should tell the firmware to boot a kernel but that may need a way to do that like setting variables in nvram but we don't have models of that in taihu. This taihu machine seems to be an early skeleton that wasn't finished, the ref405ep seems to be more advanced.
> 
> I agree, looking code, the ref405ep board seems to be in a better shape than the taihu board. My u-boot image seems to run fine with both machines, so I'd suggest that we deprecate (and later remove) the taihu board, and keep the ref405ep board in QEMU if it is still helpful for Christophe (or anybody else).

Yes. It could nearly run userspace, if one was available.

Thanks,

C.

U-Boot 2015.10-00236-g677f970bc6-dirty (Oct 06 2021 - 08:59:53 +0200)

CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
        I2C boot EEPROM disabled
        Internal PCI arbiter enabled
        16 KiB I-Cache 16 KiB D-Cache
Board: Taihu - AMCC PPC405EP Evaluation Board
I2C:   ready
DRAM:  128 MiB
Flash: ## Unknown FLASH on Bank 0 - Size = 0x00000000 = 0 MB
## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
0 Bytes
*** Warning - bad CRC, using default environment

PCI:   Bus Dev VenId DevId Class Int
PCI:
Net:   No ethernet found.

Type run flash_nfs to mount root filesystem over NFS

Hit any key to stop autoboot:  0
=> bootm 0x1000000
## Booting kernel from Legacy Image at 01000000 ...
    Image Name:   Linux-5.15.0-rc6-dirty
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    3870579 Bytes = 3.7 MiB
    Load Address: 00800000
    Entry Point:  00801ad0
    Verifying Checksum ... OK
    Uncompressing Kernel Image ... OK
Memory <- <0x0 0x8000000> (128MB)
CPU clock-frequency <- 0x7f28155 (133MHz)
CPU timebase-frequency <- 0x7f28155 (133MHz)
/plb: clock-frequency <- 1fca055 (33MHz)
/plb/opb: clock-frequency <- 1fca055 (33MHz)
/plb/ebc: clock-frequency <- 1fca055 (33MHz)
/plb/opb/serial@ef600300: clock-frequency <- 1d1079 (2MHz)
/plb/opb/serial@ef600400: clock-frequency <- 1d1079 (2MHz)
ethernet0: local-mac-address <- 00:00:00:00:00:00
ethernet1: local-mac-address <- 00:00:2d:e5:44:80
Fixing devtree for 4M Flash

zImage starting: loaded at 0x00800000 (sp: 0x07eaabb0)
Decompression error: 'Not a gzip file'
No valid compressed data found, assume uncompressed data
Allocating 0x73f274 bytes for kernel...
0x71c0f0 bytes of uncompressed data copied

Linux/PowerPC load:
Finalizing device tree... flat tree at 0xf43960
Linux version 5.15.0-rc6-dirty (legoater@yukon) (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1), GNU ld version 2.35.2-1.fc34) #4 Wed Oct 20 16:37:46 CEST 2021
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
Memory: 122444K/131072K available (4908K kernel code, 224K rwdata, 1300K rodata, 852K init, 136K bss, 8628K reserved, 0K cma-reserved)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
UIC0 (32 IRQ sources) at DCR 0xc0
random: get_random_u32 called from start_kernel+0x498/0x5f8 with crng_init=0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x1ec031343f, max_idle_ns: 440795203544 ns
clocksource: timebase mult[7800000] shift[24] registered
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
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
pci_bus 0008:00: busn_res: [bus 00-ff] end is updated to 00
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
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
workingset: timestamp_bits=30 max_order=15 bucket_order=0
io scheduler mq-deadline registered
io scheduler kyber registered
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
libphy: Fixed MDIO Bus: probed
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
drmem: No dynamic reconfiguration memory found
Freeing unused kernel image (initmem) memory: 852K
Kernel memory protection not selected by kernel config.
Run /init as init process
init[1]: illegal instruction (4) at 10038380 nip 10038380 lr 10034be0 code 1 in busybox[10000000+61000]
init[1]: code: 6129c000 7f914840 419d0350 562be13e 380bffff 2b800020 409d0314 3d204330
init[1]: code: 6c008000 91210018 3d201006 9001001c <c1a9b834> c8010018 fc006828 fc000018
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
CPU: 0 PID: 1 Comm: init Not tainted 5.15.0-rc6-dirty #4
Call Trace:
[c0815da0] [c0024408] panic+0x11c/0x2e0 (unreliable)
[c0815e00] [c0026038] do_exit+0x8b0/0x908
[c0815e50] [c0027044] do_group_exit+0x34/0x9c
[c0815e70] [c0033bd0] get_signal+0x174/0x734
[c0815ec0] [c0007794] do_notify_resume+0x70/0x2b0
[c0815f20] [c000ca7c] interrupt_exit_user_prepare_main+0x6c/0xe0
[c0815f40] [c000f1e0] interrupt_return+0x14/0x148
--- interrupt: 700 at 0x10038380
NIP:  10038380 LR: 10034be0 CTR: 1000db60
REGS: c0815f50 TRAP: 0700   Not tainted  (5.15.0-rc6-dirty)
MSR:  0008c030 <EE,PR,IR,DR>  CR: 40000024  XER: 00000000

GPR00: 8000005a bf9c7d90 100791f8 000005a4 bf9c8144 0000001f 00000001 1000026c
GPR08: 0000c030 10060000 00001000 0000005b 72656773 00000000 00000000 00000000
GPR16: 00000000 000005b0 00000000 100726ec 00000000 00000000 00000000 00000000
GPR24: 00000000 00000002 00000002 bf9c8144 10070000 000005a4 bf9c8144 000005a4
NIP [10038380] 0x10038380
LR [10034be0] 0x10034be0
--- interrupt: 700
Rebooting in 180 seconds..
QEMU 6.1.50 monitor - type 'help' for more information

