Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3043CFA7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:28:42 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmjB-0002IZ-9f
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mfmKc-0008Sx-3B
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:03:18 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:51209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mfmKY-0001Mj-C7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:03:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9546E212C0;
 Wed, 27 Oct 2021 17:03:10 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 27 Oct
 2021 19:03:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d7e7ec1a-d9e7-49a0-a460-610070aeff37,
 8785284D4CA03B251F375AE34F6968CC52B49090) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.27.251.27
Message-ID: <25e1c88c-b4b2-0bdd-d30c-7c08d1c78b88@kaod.org>
Date: Wed, 27 Oct 2021 19:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
 <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
 <YVx7YGqUENP83vNF@redhat.com>
 <125ddbae-7855-d42d-9156-e8bbe7e21e56@amsat.org>
 <3d8f2a41-a52f-db25-fdc9-c631952369a3@kaod.org>
 <543407cd-c077-a670-da21-5a4d57d7f35f@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <543407cd-c077-a670-da21-5a4d57d7f35f@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6c1993e4-b056-4107-a9f7-60f9b6cb0225
X-Ovh-Tracer-Id: 9677672653375835082
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Christophe,

On 10/27/21 12:42, Christophe Leroy wrote:
> Hi Cédric,
> 
> Le 27/10/2021 à 10:40, Cédric Le Goater a écrit :
>>>>> I am raising this because the nanoMIPS support is in deprecated state
>>>>> since more than 2 releases, but it is still in-tree and I try to keep
>>>>> it functional. However, since no toolchain reached mainstream GCC/LLVM
>>>>> it is not easy to maintain. By keeping it in that state we give some
>>>>> time to other communities to have their toolchain upstreamed / merged.
>>>>
>>>> If you're trying to keep it functional and aren't going to remove
>>>> it, then it shouldn't be marked deprecated.
>>>
>>> OK, I'll move it back to Odd-fixes.
>>
>> The ppc405 boards are still in pretty bad shape. We need a patched u-boot,
>> a patched QEMU and a patched Linux and still, we do not reach user space
>> without some sort of crash.
>>
> 
> I guess Philippe was talking about the nanoMIPS here.
> 
> By the way, ppc405 is not on an optimal shape yet for sure, but we are getting better and better, and I'm aiming at getting it back to work, just because I need it.
> 
> By the way, were you able to re-test with CONFIG_MATH_EMULATION enabled after your last oops report which shows that you're trying to execute floating points instruction ?
> 

That's the best I got :( Please send me your .config.

Thanks,

C.

=> bootm 0x1000000
## Booting kernel from Legacy Image at 01000000 ...
    Image Name:   Linux-5.15.0-rc7-dirty
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    3273457 Bytes = 3.1 MiB
    Load Address: 00700000
    Entry Point:  00701ad0
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

zImage starting: loaded at 0x00700000 (sp: 0x07eaabb0)
Decompression error: 'Not a gzip file'
No valid compressed data found, assume uncompressed data
Allocating 0x6bd274 bytes for kernel...
0x69a114 bytes of uncompressed data copied

Linux/PowerPC load:
Finalizing device tree... flat tree at 0xdc1960
Linux version 5.15.0-rc7-dirty (legoater@yukon) (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1), GNU ld version 2.35.2-1.fc34) #14 Wed Oct 27 18:41:41 CEST 2021
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
Memory: 122964K/131072K available (4920K kernel code, 224K rwdata, 1304K rodata, 316K init, 136K bss, 8108K reserved, 0K cma-reserved)
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
Mem-Info:
active_anon:0 inactive_anon:0 isolated_anon:0
  active_file:0 inactive_file:0 isolated_file:0
  unevictable:0 dirty:0 writeback:0
  slab_reclaimable:11 slab_unreclaimable:171
  mapped:0 shmem:0 pagetables:0 bounce:0
  kernel_misc_reclaimable:0
  free:30452 free_pcp:19 free_cma:0
Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:152kB pagetables:0kB all_unreclaimable? no
Normal free:121808kB min:1400kB low:1748kB high:2096kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:131072kB managed:122964kB mlocked:0kB bounce:0kB free_pcp:76kB local_pcp:76kB free_cma:0kB
lowmem_reserve[]: 0 0
Normal: 4*4kB (UM) 2*8kB (ME) 3*16kB (UM) 2*32kB (UM) 3*64kB (ME) 3*128kB (UME) 5*256kB (UME) 4*512kB (UME) 3*1024kB (ME) 4*2048kB (UME) 26*4096kB (M) = 121808kB
0 total pagecache pages
0 pages in swap cache
Swap cache stats: add 0, delete 0, find 0/0
Free swap  = 0kB
Total swap = 0kB
32768 pages RAM
0 pages HighMem/MovableOnly
2027 pages reserved
Kernel panic - not syncing:
CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 5.15.0-rc7-dirty #12
Workqueue: events_unbound async_run_entry_fn
Call Trace:
[c0845d70] [c0026a40] panic+0x11c/0x2e0 (unreliable)
[c0845dd0] [c000513c] sys_mmap2+0x0/0x20
[c0845e20] [c0617844] do_populate_rootfs+0x48/0x17c
[c0845e60] [c004a8ec] async_run_entry_fn+0x34/0xc4
[c0845e80] [c003f6c0] process_one_work+0x268/0x3e0
[c0845eb0] [c003fd40] worker_thread+0x17c/0x4c4
[c0845f00] [c0047898] kthread+0x12c/0x14c
[c0845f40] [c0010114] ret_from_kernel_thread+0x14/0x1c
Rebooting in 180 seconds..

