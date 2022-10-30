Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AD612A6B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 12:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op6m2-0007Wy-Ov; Sun, 30 Oct 2022 07:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1op6lo-0007T6-Ek; Sun, 30 Oct 2022 07:46:28 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1op6lj-00069b-3p; Sun, 30 Oct 2022 07:46:27 -0400
Received: by mail-ua1-x92a.google.com with SMTP id e26so3986478uaa.7;
 Sun, 30 Oct 2022 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+GZfRZriehGFXyXYwjklaH3uCtAM6cH08uwlyfapWd4=;
 b=MsFOkJiOxmO/7Zf27jlZMdH4aRE2H7vFBJFkwvNdxEd70YOaKviXMfXE+l1zrGV7kE
 nKnGnif8vL9dkg4jJp9j9UKK366vYKcx4XkHVWsBLsmP6hczGWjyJ+IaXDDGMJEMarWY
 VpZ0TtKllpuzOn6iuftBMJPTLh8nWqOBS9sDoSkB5pVVC/IeE4FT99QFNVvrr/VAPXBn
 rirSW+V/9zKyCCE4vE56y+Us1Q5SqoEgOl4TwDIluvD2h2KJLBJoNYKxLu80SB0P5qUy
 ClUdty7nlipxIdpvWFTi6Zn9JNTyyIGp0H/nydsaUnTF8i59Gqi8jlumCAymCsI3o10C
 D7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GZfRZriehGFXyXYwjklaH3uCtAM6cH08uwlyfapWd4=;
 b=lhXTflQhXgmrPJuIKorPIUP/i8Y4Ms9/OVYmUYP4KxnCA9HyeQYTkCUO+tQ+d+7HjR
 upTiagRjvMZBwS19yKPkw75QCWgfaK8AtkbN3W6EpOLzdWcL15yaOBOi+3CzqVTdWYaJ
 kCrtKFBBby0+IqNohgyeOY+lfEVhJ9JirZJwXc7n42m8AhFsS6zPrFjs2N+qX3jVExTh
 WBKOe2U/ZiA2ls7qLAfrwZiw9YhVPCQK5FmjU2hsdKVRh0cHx/23esoO4jAaa65N577o
 Y37y6JTowCnz4PugvkPRbifPqL8NedshwXupKxKzzoqP4v8SwQGoLBB07AK0pHN8iiwN
 vQBg==
X-Gm-Message-State: ACrzQf0aMg071fAFUiF8MgyseCdBOH0NL8ohD8PUEpkBcYW88VsXRmIk
 qzPamQpa7V/PKnCfrVmRrTXbUKfozxFFTvXPQtc=
X-Google-Smtp-Source: AMsMyM70XavoikNBo4BSBGHK7kWrkxpVJNgwgX7+VwR1EUTcD6fv4abveOdhOdJtUJH/pbJSX6ZWO+qvV5LsaH7FvL8=
X-Received: by 2002:ab0:2982:0:b0:40c:caeb:5130 with SMTP id
 u2-20020ab02982000000b0040ccaeb5130mr1736334uap.24.1667130379492; Sun, 30 Oct
 2022 04:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
 <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
In-Reply-To: <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 30 Oct 2022 12:46:05 +0100
Message-ID: <CAG4p6K5qvJFRihrZV3Gku_fYsxWFzEN4UfGf4xySQyfzkv9q0g@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org, 
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000105fe405ec3f0aa7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=shentey@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000105fe405ec3f0aa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2022 at 1:10 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 29/10/22 20:28, Bernhard Beschow wrote:
> > Am 29. Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow <
> shentey@gmail.com>:
> >> Am 29. Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow <
> shentey@gmail.com>:
> >>> Am 27. Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <
> philmd@linaro.org>:
> >>>> Hi Bernhard,
> >>>>
> >>>> On 18/10/22 23:01, Bernhard Beschow wrote:
> >>>>> Will allow e500 boards to access SD cards using just their own
> devices.
> >>>>>
> >>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>>>> ---
> >>>>>    hw/sd/sdhci.c         | 120
> +++++++++++++++++++++++++++++++++++++++++-
> >>>>>    include/hw/sd/sdhci.h |   3 ++
> >>>>>    2 files changed, 122 insertions(+), 1 deletion(-)
>
> >>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
> >>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
> >>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE -
> SDHC_REGISTERS_MAP_SIZE (=3D 0x310) and map it normally at offset
> >>>> 0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
> >>>> hw/arm/bcm2835_peripherals.c.
> >>>>
> >>>> But the ESDHC_WML register has address 0x44 and fits inside the
> >>>> SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
> >>>> upper part of the SDHC_CAPAB register. These bits are undefined
> >>>> on the spec v2, which I see you are setting in esdhci_init().
> >>>> So this register should already return 0, otherwise we have
> >>>> a bug. Thus we don't need to handle this ESDHC_WML particularly.
> >>
> >> My idea here was to catch this unimplemented case in order to indicate
> this clearly to users. Perhaps it nudges somebody to provide a patch?
> >>
> >>>>
> >>>> And your model is reduced to handling create_unimp() in
> esdhci_realize().
> >>>>
> >>>> Am I missing something?
> >>>
> >>> The mmio ops are big endian and need to be aligned to a 4-byte
> boundary. It took me quite a while to debug this. So shall I just create =
an
> additional memory region for the region above SDHC_REGISTERS_MAP_SIZE for
> ESDHC_DMA_SYSCTL?
> >>
> >> All in all I currently don't have a better idea than keeping the custo=
m
> i/o ops for the standard region and adding an additional unimplemented
> region for ESDHC_DMA_SYSCTL. I think I'd have to dynamically allocate
> memory for it where I still need to figure out how not to leak it.
> >
> > By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I was abl=
e
> to remove the custom implementations while having big endian and the
> alignments proper. However, I don't see a way of adding two memory region=
s
> - with or without a container. With a container I'd have to somehow
> preserve the mmio attribute which is initialized by the parent class,
> re-initialize it with the container, and add the preserved memory region =
as
> child. This seems very fragile, esp. since the parent class has created a=
n
> alias for mmio in sysbus. Without a container, one would have two memory
> regions that both have to be mapped separately by the caller, i.e. it
> burdens the caller with an implementation detail.
> >
> > Any suggestions?
>
> Can you share branch and how to test?
>

QEMU branch: https://github.com/shentok/qemu/tree/e500-flash

How to test:
1. `git clone -b e500 https://github.com/shentok/buildroot.git`
2. `cd buildroot`
3. `make qemu_ppc_e500mc_defconfig`
4. `make`
5. `cd output/images`
6. `dd if=3D/dev/zero of=3Droot.img bs=3D1M count=3D64 && dd if=3Drootfs.ex=
t2
of=3Droot.img bs=3D1M conv=3Dnotrunc`
7. `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmydr=
ive
-drive id=3Dmydrive,if=3Dnone,file=3Droot.img,format=3Draw`

Note that step 6 might be required every time before qemu-system-ppc is
started, otherwise this may cause an fsck. The output on the boot console
will look something along these lines (note that no errors are reported):

  Memory CAM mapping: 16/16/16/16/64/64/64 Mb, residual: 0Mb
  Activating Kernel Userspace Access Protection
  Activating Kernel Userspace Execution Prevention
  Linux version 5.17.7 (zcone-pisint@osoxes)
(powerpc-buildroot-linux-gnu-gcc.br_real (Buildroot
2022.08-655-gf8a0d1480a) 11.3.0, GNU ld (GNU Binutils) 2.38) #1 SMP Sat Oct
29 12:49:54 CEST 2022
  Using QEMU e500 machine description
  printk: bootconsole [udbg0] enabled
  CPU maps initialized for 1 thread per core
  -----------------------------------------------------
  phys_mem_size     =3D 0x10000000
  dcache_bsize      =3D 0x40
  icache_bsize      =3D 0x40
  cpu_features      =3D 0x0000000000000194
    possible        =3D 0x000000000001039c
    always          =3D 0x0000000000000100
  cpu_user_features =3D 0x8c008000 0x08000000
  mmu_features      =3D 0x000a0010
  -----------------------------------------------------
  qemu_e500_setup_arch()
  barrier-nospec: using isync; sync as speculation barrier
  Zone ranges:
    Normal   [mem 0x0000000000000000-0x000000000fffffff]
    HighMem  empty
  Movable zone start for each node
  Early memory node ranges
    node   0: [mem 0x0000000000000000-0x000000000fffffff]
  Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
  MMU: Allocated 1088 bytes of context maps for 255 contexts
  percpu: Embedded 16 pages/cpu s33804 r8192 d23540 u65536
  Built 1 zonelists, mobility grouping on.  Total pages: 65024
  Kernel command line: console=3DttyS0 rootwait root=3D/dev/mmcblk0 nokaslr
  Unknown kernel command line parameters "nokaslr", will be passed to user
space.
  Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
  Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
  mem auto-init: stack:off, heap alloc:off, heap free:off
  Kernel virtual memory layout:
    * 0xffa5f000..0xfffff000  : fixmap
    * 0xff800000..0xffa00000  : highmem PTEs
    * 0xd1000000..0xff800000  : vmalloc & ioremap
  Memory: 174608K/262144K available (12680K kernel code, 1080K rwdata,
3552K rodata, 396K init, 238K bss, 87536K reserved, 0K cma-reserved, 0K
highmem)
  SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
  rcu: Hierarchical RCU implementation.
  rcu: RCU event tracing is enabled.
  rcu: RCU restricting CPUs from NR_CPUS=3D24 to nr_cpu_ids=3D1.
  rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
  rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1
  NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
  mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
  mpic: ISU size: 256, shift: 8, mask: ff
  mpic: Initializing for 256 sources
  random: get_random_u32 called from start_kernel+0x524/0x6b0 with
crng_init=3D0
  clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x5c4093a7d1,
max_idle_ns: 440795210635 ns
  clocksource: timebase mult[2800000] shift[24] registered
  Console: colour dummy device 80x25
  pid_max: default: 32768 minimum: 301
  Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
  Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
  e500 family performance monitor hardware support registered
  rcu: Hierarchical SRCU implementation.
  smp: Bringing up secondary CPUs ...
  smp: Brought up 1 node, 1 CPU
  devtmpfs: initialized
  clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 7645041785100000 ns
  futex hash table entries: 256 (order: 2, 16384 bytes, linear)
  NET: Registered PF_NETLINK/PF_ROUTE protocol family
  audit: initializing netlink subsys (disabled)

  Found FSL PCI host bridge at 0x0000000fe0008000. Firmware bus number:
0->255
  PCI host bridge /pci@fe0008000 (primary) ranges:
   MEM 0x0000000c00000000..0x0000000c1fffffff -> 0x00000000e0000000
    IO 0x0000000fe1000000..0x0000000fe100ffff -> 0x0000000000000000
  /pci@fe0008000: PCICSRBAR @ 0xdff00000
  setup_pci_atmu: end of DRAM 10000000
  Machine: QEMU ppce500
  SoC family: QorIQ
  SoC ID: svr:0x00000000, Revision: 0.0
  audit: type=3D2000 audit(0.092:1): state=3Dinitialized audit_enabled=3D0 =
res=3D1
  fsl-pamu: fsl_pamu_init: could not find a PAMU node
  software IO TLB: tearing down default memory pool
  PCI: Probing PCI hardware
  fsl-pci fe0008000.pci: PCI host bridge to bus 8000:00
  pci_bus 8000:00: root bus resource [io  0x0000-0xffff]
  pci_bus 8000:00: root bus resource [mem 0xc00000000-0xc1fffffff] (bus
address [0xe0000000-0xffffffff])
  pci_bus 8000:00: root bus resource [bus 00-ff]
  pci_bus 8000:00: busn_res: [bus 00-ff] end is updated to ff
  pci 8000:00:00.0: [1957:0030] type 00 class 0x0b2000
  pci 8000:00:00.0: reg 0x10: [mem 0xdff00000-0xdfffffff]
  pci 8000:00:01.0: [1af4:1000] type 00 class 0x020000
  pci 8000:00:01.0: reg 0x10: [io  0x0000-0x001f]
  pci 8000:00:01.0: reg 0x14: [mem 0x00000000-0x00000fff]
  pci 8000:00:01.0: reg 0x20: [mem 0x00000000-0x00003fff 64bit pref]
  pci 8000:00:01.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
  pci_bus 8000:00: busn_res: [bus 00-ff] end is updated to 00
  pci 8000:00:01.0: BAR 6: assigned [mem 0xc00000000-0xc0003ffff pref]
  pci 8000:00:01.0: BAR 4: assigned [mem 0xc00040000-0xc00043fff 64bit pref=
]
  pci 8000:00:01.0: BAR 1: assigned [mem 0xc00044000-0xc00044fff]
  pci 8000:00:01.0: BAR 0: assigned [io  0x1000-0x101f]
  pci_bus 8000:00: resource 4 [io  0x0000-0xffff]
  pci_bus 8000:00: resource 5 [mem 0xc00000000-0xc1fffffff]
  HugeTLB registered 4.00 MiB page size, pre-allocated 0 pages
  HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
  HugeTLB registered 64.0 MiB page size, pre-allocated 0 pages
  HugeTLB registered 256 MiB page size, pre-allocated 0 pages
  HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
  Freescale Elo series DMA driver
  iommu: Default domain type: Translated
  iommu: DMA domain TLB invalidation policy: strict mode
  vgaarb: loaded
  SCSI subsystem initialized
  usbcore: registered new interface driver usbfs
  usbcore: registered new interface driver hub
  usbcore: registered new device driver usb
  pps_core: LinuxPPS API ver. 1 registered
  pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <
giometti@linux.it>
  PTP clock support registered
  Advanced Linux Sound Architecture Driver Initialized.
  clocksource: Switched to clocksource timebase
  NET: Registered PF_INET protocol family
  IP idents hash table entries: 4096 (order: 3, 32768 bytes, linear)
  tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes,
linear)
  TCP established hash table entries: 2048 (order: 1, 8192 bytes, linear)
  TCP bind hash table entries: 2048 (order: 2, 16384 bytes, linear)
  TCP: Hash tables configured (established 2048 bind 2048)
  UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
  UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
  NET: Registered PF_UNIX/PF_LOCAL protocol family
  RPC: Registered named UNIX socket transport module.
  RPC: Registered udp transport module.
  RPC: Registered tcp transport module.
  RPC: Registered tcp NFSv4.1 backchannel transport module.
  PCI: CLS 0 bytes, default 64
  workingset: timestamp_bits=3D30 max_order=3D16 bucket_order=3D0
  squashfs: version 4.0 (2009/01/31) Phillip Lougher
  NFS: Registering the id_resolver key type
  Key type id_resolver registered
  Key type id_legacy registered
  Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
  ntfs: driver 2.1.32 [Flags: R/O].
  jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
  io scheduler mq-deadline registered
  io scheduler kyber registered
  virtio-pci 8000:00:01.0: enabling device (0000 -> 0003)
  Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
  printk: console [ttyS0] disabled
  serial8250.0: ttyS0 at MMIO 0xfe0004500 (irq =3D 42, base_baud =3D 250000=
00)
is a 16550A
  printk: console [ttyS0] enabled
  printk: console [ttyS0] enabled
  printk: bootconsole [udbg0] disabled
  printk: bootconsole [udbg0] disabled
  ePAPR hypervisor byte channel driver
  brd: module loaded
  loop: module loaded
  st: Version 20160209, fixed bufsize 32768, s/g segs 256
  ucc_geth_driver: QE UCC Gigabit Ethernet Controller
  e1000: Intel(R) PRO/1000 Network Driver
  e1000: Copyright (c) 1999-2006 Intel Corporation.
  e1000e: Intel(R) PRO/1000 Network Driver
  e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
  igb: Intel(R) Gigabit Ethernet Network Driver
  igb: Copyright (c) 2007-2014 Intel Corporation.
  ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
  ehci-pci: EHCI PCI platform driver
  ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
  ohci-pci: OHCI PCI platform driver
  ehci-fsl: Freescale EHCI Host controller driver
  usbcore: registered new interface driver usb-storage
  i2c_dev: i2c /dev entries driver
  mpc-i2c fe0003000.i2c: timeout 1000000 us
  rtc-ds1307 0-0068: registered as rtc0
  rtc-ds1307 0-0068: setting system clock to 2022-10-30T11:27:44 UTC
(1667129264)
  sdhci: Secure Digital Host Controller Interface driver
  sdhci: Copyright(c) Pierre Ossman
  sdhci-pltfm: SDHCI platform and OF driver helper
  Freescale hypervisor management driver
  fsl-hv: no hypervisor found
  mmc0 bounce up to 128 segments into one, max segment size 65536 bytes
  ipip: IPv4 and MPLS over IPv4 tunneling driver
  Initializing XFRM netlink socket
  NET: Registered PF_INET6 protocol family
  Segment Routing with IPv6
  In-situ OAM (IOAM) with IPv6
  sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
  NET: Registered PF_PACKET protocol family
  NET: Registered PF_KEY protocol family
  Key type dns_resolver registered
  drmem: No dynamic reconfiguration memory found
  mmc0: SDHCI controller on fe002e000.sdhc [fe002e000.sdhc] using DMA
  ALSA device list:
    No soundcards found.
  Waiting for root device /dev/mmcblk0...
  mmc0: new high speed SD card at address 4567
  mmcblk0: mmc0:4567 QEMU! 64.0 MiB
  EXT4-fs (mmcblk0): mounted filesystem without journal. Quota mode:
disabled.
  VFS: Mounted root (ext4 filesystem) readonly on device 179:0.
  devtmpfs: mounted
  Freeing unused kernel image (initmem) memory: 396K
  Run /sbin/init as init process
  EXT4-fs (mmcblk0): re-mounted. Quota mode: disabled.
  Starting syslogd: OK
  Starting klogd: OK
  Running sysctl: OK
  Saving random seed: random: dd: uninitialized urandom read (512 bytes
read)
  OK
  Starting network: udhcpc: started, v1.35.0
  udhcpc: broadcasting discover
  udhcpc: broadcasting select for 10.0.2.15, server 10.0.2.2
  random: fast init done
  udhcpc: lease of 10.0.2.15 obtained from 10.0.2.2, lease time 86400
  deleting routers
  adding dns 10.0.2.3
  OK

  Welcome to Buildroot
  buildroot login:


Best regards,
Bernhard

--000000000000105fe405ec3f0aa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022 at 1:10 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 29/10/22 20:28, Bernhard Beschow wrote:<br>
&gt; Am 29. Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow &lt;<a href=
=3D"mailto:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;:<=
br>
&gt;&gt; Am 29. Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow &lt;<a h=
ref=3D"mailto:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt=
;:<br>
&gt;&gt;&gt; Am 27. Oktober 2022 21:40:01 UTC schrieb &quot;Philippe Mathie=
u-Daud=C3=A9&quot; &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blan=
k">philmd@linaro.org</a>&gt;:<br>
&gt;&gt;&gt;&gt; Hi Bernhard,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 18/10/22 23:01, Bernhard Beschow wrote:<br>
&gt;&gt;&gt;&gt;&gt; Will allow e500 boards to access SD cards using just t=
heir own devices.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:=
shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 hw/sd/sdhci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 120 +++++++++++++++++++++++++++++++++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 include/hw/sd/sdhci.h |=C2=A0 =C2=A03 ++<=
br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 122 insertions(+), 1 del=
etion(-)<br>
<br>
&gt;&gt;&gt;&gt; So now, I&#39;d create 1 UNIMP region for ESDHC_WML and ma=
p it<br>
&gt;&gt;&gt;&gt; into SDHC_REGISTERS_MAP (s-&gt;iomem) with priority 1, and=
 add<br>
&gt;&gt;&gt;&gt; another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_RE=
GISTERS_MAP_SIZE (=3D 0x310) and map it normally at offset<br>
&gt;&gt;&gt;&gt; 0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in=
<br>
&gt;&gt;&gt;&gt; hw/arm/bcm2835_peripherals.c.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; But the ESDHC_WML register has address 0x44 and fits insid=
e the<br>
&gt;&gt;&gt;&gt; SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is=
 the<br>
&gt;&gt;&gt;&gt; upper part of the SDHC_CAPAB register. These bits are unde=
fined<br>
&gt;&gt;&gt;&gt; on the spec v2, which I see you are setting in esdhci_init=
().<br>
&gt;&gt;&gt;&gt; So this register should already return 0, otherwise we hav=
e<br>
&gt;&gt;&gt;&gt; a bug. Thus we don&#39;t need to handle this ESDHC_WML par=
ticularly.<br>
&gt;&gt;<br>
&gt;&gt; My idea here was to catch this unimplemented case in order to indi=
cate this clearly to users. Perhaps it nudges somebody to provide a patch?<=
br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; And your model is reduced to handling create_unimp() in es=
dhci_realize().<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Am I missing something?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The mmio ops are big endian and need to be aligned to a 4-byte=
 boundary. It took me quite a while to debug this. So shall I just create a=
n additional memory region for the region above SDHC_REGISTERS_MAP_SIZE for=
 ESDHC_DMA_SYSCTL?<br>
&gt;&gt;<br>
&gt;&gt; All in all I currently don&#39;t have a better idea than keeping t=
he custom i/o ops for the standard region and adding an additional unimplem=
ented region for ESDHC_DMA_SYSCTL. I think I&#39;d have to dynamically allo=
cate memory for it where I still need to figure out how not to leak it.<br>
&gt; <br>
&gt; By simply reusing sdhci_{read,write} in eSDHC&#39;s io_ops struct I wa=
s able to remove the custom implementations while having big endian and the=
 alignments proper. However, I don&#39;t see a way of adding two memory reg=
ions - with or without a container. With a container I&#39;d have to someho=
w preserve the mmio attribute which is initialized by the parent class, re-=
initialize it with the container, and add the preserved memory region as ch=
ild. This seems very fragile, esp. since the parent class has created an al=
ias for mmio in sysbus. Without a container, one would have two memory regi=
ons that both have to be mapped separately by the caller, i.e. it burdens t=
he caller with an implementation detail.<br>
&gt; <br>
&gt; Any suggestions?<br>
<br>
Can you share branch and how to test?<br></blockquote><div><br></div><div>Q=
EMU branch: <a href=3D"https://github.com/shentok/qemu/tree/e500-flash">htt=
ps://github.com/shentok/qemu/tree/e500-flash</a></div><div><br></div><div>H=
ow to test:</div><div>1. `<span style=3D"font-family:monospace"><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">git clone -b e500 <=
a href=3D"https://github.com/shentok/buildroot.git">https://github.com/shen=
tok/buildroot.git</a></span>`</span></div><div><span style=3D"font-family:m=
onospace">2. `cd buildroot`</span></div><div><span style=3D"font-family:mon=
ospace">3. `<span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">make qemu_ppc_e500mc_defconfig`</=
span></span></span></div><div><span style=3D"font-family:monospace"><span s=
tyle=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">4. `make`</span></span></span></div><div><span style=
=3D"font-family:monospace"><span style=3D"font-family:monospace"><span styl=
e=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">5. `cd </span></sp=
an>output/images<span style=3D"font-family:monospace"><span style=3D"color:=
rgb(0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-family:mo=
nospace">`</span></span></span></span></div><div><span style=3D"font-family=
:monospace"><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-family:monosp=
ace">6. `<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0=
,0);background-color:rgb(255,255,255)">dd if=3D/dev/zero of=3Droot.img bs=
=3D1M count=3D64 &amp;&amp; dd if=3Drootfs.</span></span></span></span></sp=
an></span>ext<span style=3D"font-family:monospace"><span style=3D"font-fami=
ly:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,=
255)"><span style=3D"font-family:monospace"><span style=3D"font-family:mono=
space"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">2=
 of=3Droot.img bs=3D1M conv=3Dnotrunc`</span></span></span></span></span></=
span></div><div><span style=3D"font-family:monospace"><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"><span style=3D"font-family:monospace"><span style=3D"font-family:m=
onospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)=
">7. `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append =
&quot;console=3DttyS0 rootwait root=3D/dev/mmcblk0&quot; -device sd-card,dr=
ive=3Dmydrive -drive id=3Dmydrive,if=3Dnone,file=3Droot.img,format=3Draw`</=
span></span></span></span></span></span></div><div><span style=3D"font-fami=
ly:monospace"><span style=3D"font-family:monospace"><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-family:mono=
space"><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0=
);background-color:rgb(255,255,255)"><br></span></span></span></span></span=
></span></div><div><span style=3D"font-family:monospace"><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)"><span style=3D"font-family:monospace"><span style=3D"font-famil=
y:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,2=
55)">Note that step 6 might be required every time before qemu-system-ppc i=
s started, otherwise this may cause an fsck. The output on the boot console=
 will look something along these lines (note that no errors are reported):<=
br></span></span></span></span></span></span></div><div><span style=3D"font=
-family:monospace"><span style=3D"font-family:monospace"><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-family=
:monospace"><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)"><br></span></span></span></span><=
/span></span></div><div><span style=3D"font-family:monospace"><span style=
=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-color=
:rgb(255,255,255)"><span style=3D"font-family:monospace"><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">=C2=A0 Memory CAM mapping: 16/16/16/16/64/64/64 Mb, residual: 0=
Mb<br>=C2=A0 Activating Kernel Userspace Access Protection<br>=C2=A0 Activa=
ting Kernel Userspace Execution Prevention<br>=C2=A0 Linux version 5.17.7 (=
zcone-pisint@osoxes) (powerpc-buildroot-linux-gnu-gcc.br_real (Buildroot 20=
22.08-655-gf8a0d1480a) 11.3.0, GNU ld (GNU Binutils) 2.38) #1 SMP Sat Oct 2=
9 12:49:54 CEST 2022<br>=C2=A0 Using QEMU e500 machine description<br>=C2=
=A0 printk: bootconsole [udbg0] enabled<br>=C2=A0 CPU maps initialized for =
1 thread per core<br>=C2=A0 -----------------------------------------------=
------<br>=C2=A0 phys_mem_size =C2=A0 =C2=A0 =3D 0x10000000<br>=C2=A0 dcach=
e_bsize =C2=A0 =C2=A0 =C2=A0=3D 0x40<br>=C2=A0 icache_bsize =C2=A0 =C2=A0 =
=C2=A0=3D 0x40<br>=C2=A0 cpu_features =C2=A0 =C2=A0 =C2=A0=3D 0x00000000000=
00194<br>=C2=A0 =C2=A0 possible =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0000000000=
01039c<br>=C2=A0 =C2=A0 always =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0000=
000000000100<br>=C2=A0 cpu_user_features =3D 0x8c008000 0x08000000<br>=C2=
=A0 mmu_features =C2=A0 =C2=A0 =C2=A0=3D 0x000a0010<br>=C2=A0 -------------=
----------------------------------------<br>=C2=A0 qemu_e500_setup_arch()<b=
r>=C2=A0 barrier-nospec: using isync; sync as speculation barrier<br>=C2=A0=
 Zone ranges:<br>=C2=A0 =C2=A0 Normal =C2=A0 [mem 0x0000000000000000-0x0000=
00000fffffff]<br>=C2=A0 =C2=A0 HighMem =C2=A0empty<br>=C2=A0 Movable zone s=
tart for each node<br>=C2=A0 Early memory node ranges<br>=C2=A0 =C2=A0 node=
 =C2=A0 0: [mem 0x0000000000000000-0x000000000fffffff]<br>=C2=A0 Initmem se=
tup node 0 [mem 0x0000000000000000-0x000000000fffffff]<br>=C2=A0 MMU: Alloc=
ated 1088 bytes of context maps for 255 contexts<br>=C2=A0 percpu: Embedded=
 16 pages/cpu s33804 r8192 d23540 u65536<br>=C2=A0 Built 1 zonelists, mobil=
ity grouping on.=C2=A0 Total pages: 65024<br>=C2=A0 Kernel command line: co=
nsole=3DttyS0 rootwait root=3D/dev/mmcblk0 nokaslr<br>=C2=A0 Unknown kernel=
 command line parameters &quot;nokaslr&quot;, will be passed to user space.=
<br>=C2=A0 Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, =
linear)<br>=C2=A0 Inode-cache hash table entries: 16384 (order: 4, 65536 by=
tes, linear)<br>=C2=A0 mem auto-init: stack:off, heap alloc:off, heap free:=
off<br>=C2=A0 Kernel virtual memory layout:<br>=C2=A0 =C2=A0 * 0xffa5f000..=
0xfffff000 =C2=A0: fixmap<br>=C2=A0 =C2=A0 * 0xff800000..0xffa00000 =C2=A0:=
 highmem PTEs<br>=C2=A0 =C2=A0 * 0xd1000000..0xff800000 =C2=A0: vmalloc &am=
p; ioremap<br>=C2=A0 Memory: 174608K/262144K available (12680K kernel code,=
 1080K rwdata, 3552K rodata, 396K init, 238K bss, 87536K reserved, 0K cma-r=
eserved, 0K highmem)<br>=C2=A0 SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1<br>=C2=A0 rcu: Hierarchical RCU implementation.<b=
r>=C2=A0 rcu: 	RCU event tracing is enabled.<br>=C2=A0 rcu: 	RCU restrictin=
g CPUs from NR_CPUS=3D24 to nr_cpu_ids=3D1.<br>=C2=A0 rcu: RCU calculated v=
alue of scheduler-enlistment delay is 25 jiffies.<br>=C2=A0 rcu: Adjusting =
geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1<br>=C2=A0 NR_IRQS: 512, n=
r_irqs: 512, preallocated irqs: 16<br>=C2=A0 mpic: Setting up MPIC &quot; O=
penPIC =C2=A0&quot; version 1.2 at fe0040000, max 1 CPUs<br>=C2=A0 mpic: IS=
U size: 256, shift: 8, mask: ff<br>=C2=A0 mpic: Initializing for 256 source=
s<br>=C2=A0 random: get_random_u32 called from start_kernel+0x524/0x6b0 wit=
h crng_init=3D0<br>=C2=A0 clocksource: timebase: mask: 0xffffffffffffffff m=
ax_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns<br>=C2=A0 clocksource=
: timebase mult[2800000] shift[24] registered<br>=C2=A0 Console: colour dum=
my device 80x25<br>=C2=A0 pid_max: default: 32768 minimum: 301<br>=C2=A0 Mo=
unt-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)<br>=C2=A0=
 Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)<b=
r>=C2=A0 e500 family performance monitor hardware support registered<br>=C2=
=A0 rcu: Hierarchical SRCU implementation.<br>=C2=A0 smp: Bringing up secon=
dary CPUs ...<br>=C2=A0 smp: Brought up 1 node, 1 CPU<br>=C2=A0 devtmpfs: i=
nitialized<br>=C2=A0 clocksource: jiffies: mask: 0xffffffff max_cycles: 0xf=
fffffff, max_idle_ns: 7645041785100000 ns<br>=C2=A0 futex hash table entrie=
s: 256 (order: 2, 16384 bytes, linear)<br>=C2=A0 NET: Registered PF_NETLINK=
/PF_ROUTE protocol family<br>=C2=A0 audit: initializing netlink subsys (dis=
abled)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0=
 Found FSL PCI host bridge at 0x0000000fe0008000. Firmware bus number: 0-&g=
t;255<br>=C2=A0 PCI host bridge /pci@fe0008000 (primary) ranges:<br>=C2=A0 =
=C2=A0MEM 0x0000000c00000000..0x0000000c1fffffff -&gt; 0x00000000e0000000 <=
br>=C2=A0 =C2=A0 IO 0x0000000fe1000000..0x0000000fe100ffff -&gt; 0x00000000=
00000000<br>=C2=A0 /pci@fe0008000: PCICSRBAR @ 0xdff00000<br>=C2=A0 setup_p=
ci_atmu: end of DRAM 10000000<br>=C2=A0 Machine: QEMU ppce500<br>=C2=A0 SoC=
 family: QorIQ<br>=C2=A0 SoC ID: svr:0x00000000, Revision: 0.0<br>=C2=A0 au=
dit: type=3D2000 audit(0.092:1): state=3Dinitialized audit_enabled=3D0 res=
=3D1<br>=C2=A0 fsl-pamu: fsl_pamu_init: could not find a PAMU node<br>=C2=
=A0 software IO TLB: tearing down default memory pool<br>=C2=A0 PCI: Probin=
g PCI hardware<br>=C2=A0 fsl-pci fe0008000.pci: PCI host bridge to bus 8000=
:00<br>=C2=A0 pci_bus 8000:00: root bus resource [io =C2=A00x0000-0xffff]<b=
r>=C2=A0 pci_bus 8000:00: root bus resource [mem 0xc00000000-0xc1fffffff] (=
bus address [0xe0000000-0xffffffff])<br>=C2=A0 pci_bus 8000:00: root bus re=
source [bus 00-ff]<br>=C2=A0 pci_bus 8000:00: busn_res: [bus 00-ff] end is =
updated to ff<br>=C2=A0 pci 8000:00:00.0: [1957:0030] type 00 class 0x0b200=
0<br>=C2=A0 pci 8000:00:00.0: reg 0x10: [mem 0xdff00000-0xdfffffff]<br>=C2=
=A0 pci 8000:00:01.0: [1af4:1000] type 00 class 0x020000<br>=C2=A0 pci 8000=
:00:01.0: reg 0x10: [io =C2=A00x0000-0x001f]<br>=C2=A0 pci 8000:00:01.0: re=
g 0x14: [mem 0x00000000-0x00000fff]<br>=C2=A0 pci 8000:00:01.0: reg 0x20: [=
mem 0x00000000-0x00003fff 64bit pref]<br>=C2=A0 pci 8000:00:01.0: reg 0x30:=
 [mem 0x00000000-0x0003ffff pref]<br>=C2=A0 pci_bus 8000:00: busn_res: [bus=
 00-ff] end is updated to 00<br>=C2=A0 pci 8000:00:01.0: BAR 6: assigned [m=
em 0xc00000000-0xc0003ffff pref]<br>=C2=A0 pci 8000:00:01.0: BAR 4: assigne=
d [mem 0xc00040000-0xc00043fff 64bit pref]<br>=C2=A0 pci 8000:00:01.0: BAR =
1: assigned [mem 0xc00044000-0xc00044fff]<br>=C2=A0 pci 8000:00:01.0: BAR 0=
: assigned [io =C2=A00x1000-0x101f]<br>=C2=A0 pci_bus 8000:00: resource 4 [=
io =C2=A00x0000-0xffff]<br>=C2=A0 pci_bus 8000:00: resource 5 [mem 0xc00000=
000-0xc1fffffff]<br>=C2=A0 HugeTLB registered 4.00 MiB page size, pre-alloc=
ated 0 pages<br>=C2=A0 HugeTLB registered 16.0 MiB page size, pre-allocated=
 0 pages<br>=C2=A0 HugeTLB registered 64.0 MiB page size, pre-allocated 0 p=
ages<br>=C2=A0 HugeTLB registered 256 MiB page size, pre-allocated 0 pages<=
br>=C2=A0 HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>=
=C2=A0 Freescale Elo series DMA driver<br>=C2=A0 iommu: Default domain type=
: Translated <br>=C2=A0 iommu: DMA domain TLB invalidation policy: strict m=
ode <br>=C2=A0 vgaarb: loaded<br>=C2=A0 SCSI subsystem initialized<br>=C2=
=A0 usbcore: registered new interface driver usbfs<br>=C2=A0 usbcore: regis=
tered new interface driver hub<br>=C2=A0 usbcore: registered new device dri=
ver usb<br>=C2=A0 pps_core: LinuxPPS API ver. 1 registered<br>=C2=A0 pps_co=
re: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a href=
=3D"mailto:giometti@linux.it">giometti@linux.it</a>&gt;<br>=C2=A0 PTP clock=
 support registered<br>=C2=A0 Advanced Linux Sound Architecture Driver Init=
ialized.<br>=C2=A0 clocksource: Switched to clocksource timebase<br>=C2=A0 =
NET: Registered PF_INET protocol family<br>=C2=A0 IP idents hash table entr=
ies: 4096 (order: 3, 32768 bytes, linear)<br>=C2=A0 tcp_listen_portaddr_has=
h hash table entries: 512 (order: 0, 6144 bytes, linear)<br>=C2=A0 TCP esta=
blished hash table entries: 2048 (order: 1, 8192 bytes, linear)<br>=C2=A0 T=
CP bind hash table entries: 2048 (order: 2, 16384 bytes, linear)<br>=C2=A0 =
TCP: Hash tables configured (established 2048 bind 2048)<br>=C2=A0 UDP hash=
 table entries: 256 (order: 1, 8192 bytes, linear)<br>=C2=A0 UDP-Lite hash =
table entries: 256 (order: 1, 8192 bytes, linear)<br>=C2=A0 NET: Registered=
 PF_UNIX/PF_LOCAL protocol family<br>=C2=A0 RPC: Registered named UNIX sock=
et transport module.<br>=C2=A0 RPC: Registered udp transport module.<br>=C2=
=A0 RPC: Registered tcp transport module.<br>=C2=A0 RPC: Registered tcp NFS=
v4.1 backchannel transport module.<br>=C2=A0 PCI: CLS 0 bytes, default 64<b=
r>=C2=A0 workingset: timestamp_bits=3D30 max_order=3D16 bucket_order=3D0<br=
>=C2=A0 squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>=C2=A0 NFS: R=
egistering the id_resolver key type<br>=C2=A0 Key type id_resolver register=
ed<br>=C2=A0 Key type id_legacy registered<br>=C2=A0 Installing knfsd (copy=
right (C) 1996 <a href=3D"mailto:okir@monad.swb.de">okir@monad.swb.de</a>).=
<br>=C2=A0 ntfs: driver 2.1.32 [Flags: R/O].<br>=C2=A0 jffs2: version 2.2. =
(NAND) =C2=A9 2001-2006 Red Hat, Inc.<br>=C2=A0 io scheduler mq-deadline re=
gistered<br>=C2=A0 io scheduler kyber registered<br>=C2=A0 virtio-pci 8000:=
00:01.0: enabling device (0000 -&gt; 0003)<br>=C2=A0 Serial: 8250/16550 dri=
ver, 6 ports, IRQ sharing enabled<br>=C2=A0 printk: console [ttyS0] disable=
d<br>=C2=A0 serial8250.0: ttyS0 at MMIO 0xfe0004500 (irq =3D 42, base_baud =
=3D 25000000) is a 16550A<br>=C2=A0 printk: console [ttyS0] enabled<br>=C2=
=A0 printk: console [ttyS0] enabled<br>=C2=A0 printk: bootconsole [udbg0] d=
isabled<br>=C2=A0 printk: bootconsole [udbg0] disabled<br>=C2=A0 ePAPR hype=
rvisor byte channel driver<br>=C2=A0 brd: module loaded<br>=C2=A0 loop: mod=
ule loaded<br>=C2=A0 st: Version 20160209, fixed bufsize 32768, s/g segs 25=
6<br>=C2=A0 ucc_geth_driver: QE UCC Gigabit Ethernet Controller<br>=C2=A0 e=
1000: Intel(R) PRO/1000 Network Driver<br>=C2=A0 e1000: Copyright (c) 1999-=
2006 Intel Corporation.<br>=C2=A0 e1000e: Intel(R) PRO/1000 Network Driver<=
br>=C2=A0 e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>=C2=A0 igb=
: Intel(R) Gigabit Ethernet Network Driver<br>=C2=A0 igb: Copyright (c) 200=
7-2014 Intel Corporation.<br>=C2=A0 ehci_hcd: USB 2.0 &#39;Enhanced&#39; Ho=
st Controller (EHCI) Driver<br>=C2=A0 ehci-pci: EHCI PCI platform driver<br=
>=C2=A0 ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver<br>=
=C2=A0 ohci-pci: OHCI PCI platform driver<br>=C2=A0 ehci-fsl: Freescale EHC=
I Host controller driver<br>=C2=A0 usbcore: registered new interface driver=
 usb-storage<br>=C2=A0 i2c_dev: i2c /dev entries driver<br>=C2=A0 mpc-i2c f=
e0003000.i2c: timeout 1000000 us<br>=C2=A0 rtc-ds1307 0-0068: registered as=
 rtc0<br>=C2=A0 rtc-ds1307 0-0068: setting system clock to 2022-10-30T11:27=
:44 UTC (1667129264)<br>=C2=A0 sdhci: Secure Digital Host Controller Interf=
ace driver<br>=C2=A0 sdhci: Copyright(c) Pierre Ossman<br>=C2=A0 sdhci-pltf=
m: SDHCI platform and OF driver helper<br>=C2=A0 Freescale hypervisor manag=
ement driver<br>=C2=A0 fsl-hv: no hypervisor found<br>=C2=A0 mmc0 bounce up=
 to 128 segments into one, max segment size 65536 bytes<br>=C2=A0 ipip: IPv=
4 and MPLS over IPv4 tunneling driver<br>=C2=A0 Initializing XFRM netlink s=
ocket<br>=C2=A0 NET: Registered PF_INET6 protocol family<br>=C2=A0 Segment =
Routing with IPv6<br>=C2=A0 In-situ OAM (IOAM) with IPv6<br>=C2=A0 sit: IPv=
6, IPv4 and MPLS over IPv4 tunneling driver<br>=C2=A0 NET: Registered PF_PA=
CKET protocol family<br>=C2=A0 NET: Registered PF_KEY protocol family<br>=
=C2=A0 Key type dns_resolver registered<br>=C2=A0 drmem: No dynamic reconfi=
guration memory found<br>=C2=A0 mmc0: SDHCI controller on fe002e000.sdhc [f=
e002e000.sdhc] using DMA<br>=C2=A0 ALSA device list:<br>=C2=A0 =C2=A0 No so=
undcards found.<br>=C2=A0 Waiting for root device /dev/mmcblk0...<br>=C2=A0=
 mmc0: new high speed SD card at address 4567<br>=C2=A0 mmcblk0: mmc0:4567 =
QEMU! 64.0 MiB <br>=C2=A0 EXT4-fs (mmcblk0): mounted filesystem without jou=
rnal. Quota mode: disabled.<br>=C2=A0 VFS: Mounted root (ext4 filesystem) r=
eadonly on device 179:0.<br>=C2=A0 devtmpfs: mounted<br>=C2=A0 Freeing unus=
ed kernel image (initmem) memory: 396K<br>=C2=A0 Run /sbin/init as init pro=
cess<br>=C2=A0 EXT4-fs (mmcblk0): re-mounted. Quota mode: disabled.<br>=C2=
=A0 Starting syslogd: OK<br>=C2=A0 Starting klogd: OK<br>=C2=A0 Running sys=
ctl: OK<br>=C2=A0 Saving random seed: random: dd: uninitialized urandom rea=
d (512 bytes read)<br>=C2=A0 OK<br>=C2=A0 Starting network: udhcpc: started=
, v1.35.0<br>=C2=A0 udhcpc: broadcasting discover<br>=C2=A0 udhcpc: broadca=
sting select for 10.0.2.15, server 10.0.2.2<br>=C2=A0 random: fast init don=
e<br>=C2=A0 udhcpc: lease of 10.0.2.15 obtained from 10.0.2.2, lease time 8=
6400<br>=C2=A0 deleting routers<br>=C2=A0 adding dns 10.0.2.3<br>=C2=A0 OK<=
br>=C2=A0 <br>=C2=A0 Welcome to Buildroot<br>=C2=A0 buildroot login: <br>=
=C2=A0</span></span></span></span></span></span></div><div><span style=3D"f=
ont-family:monospace"><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)"><span style=3D"font-fam=
ily:monospace"><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)"><br></span></span></span></spa=
n></span></span></div><div><span style=3D"font-family:monospace"><span styl=
e=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-colo=
r:rgb(255,255,255)"><span style=3D"font-family:monospace"><span style=3D"fo=
nt-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(2=
55,255,255)">Best regards,</span></span></span></span></span></span></div><=
div><span style=3D"font-family:monospace"><span style=3D"font-family:monosp=
ace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><sp=
an style=3D"font-family:monospace"><span style=3D"font-family:monospace"><s=
pan style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">Bernhard<b=
r></span></span></span></span></span></span> </div></div></div>

--000000000000105fe405ec3f0aa7--

