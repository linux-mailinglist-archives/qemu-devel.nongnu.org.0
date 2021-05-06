Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A4375171
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:23:29 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaEC-0008IE-BT
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyd-0002dx-94
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:58672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyV-0003Af-Ry
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZyQ-0001K6-71
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C82062E8213
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 09:07:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:59:34 -0000
From: Thomas Huth <1861562@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acpi mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158057540504.18744.4957564098996075617.malonedeb@gac.canonical.com>
Message-Id: <162029157454.6278.2538656426646835108.malone@wampee.canonical.com>
Subject: [Bug 1861562] Re: piix crashes on mips when using multiple cpus
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 441f41c525ebbbbe620100380ffdca7fb30ba7df
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1861562 <1861562@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/193


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #193
   https://gitlab.com/qemu-project/qemu/-/issues/193

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861562

Title:
  piix crashes on mips when using multiple cpus

Status in QEMU:
  Expired

Bug description:
  Crash occurred while testing commit 330edfcc84a7:

  $ qemu-system-mips64el -cpu I6400 -append "clocksource=3DGIC console=3Dtt=
yS0" -smp 8 -kernel vmlinux
  Linux version 4.7.0-rc1 (phil@x1) (gcc version 6.3.0 20170516 (Debian 6.3=
.0-18) ) #1 SMP Sat Feb 1 13:15:19 UTC 2020
  earlycon: uart8250 at I/O port 0x3f8 (options '38400n8')
  bootconsole [uart8250] enabled
  CPU0 revision is: 0001a900 (MIPS I6400)
  FPU revision is: 20f30300
  MSA revision is: 00000300
  MIPS: machine is mti,malta
  Software DMA cache coherency enabled
  Determined physical RAM map:
   memory: 0000000008000000 @ 0000000000000000 (usable)
  Zone ranges:
    DMA      [mem 0x0000000000000000-0x0000000000ffffff]
    DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
    Normal   empty
  Movable zone start for each node
  Early memory node ranges
    node   0: [mem 0x0000000000000000-0x0000000007ffffff]
  Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
  VP topology {8} total 8
  Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
  Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
  percpu: Embedded 5 pages/cpu @980000000107c000 s29664 r8192 d44064 u81920
  Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 8163
  Kernel command line: clocksource=3DGIC console=3DttyS0
  log_buf_len individual max cpu contribution: 4096 bytes
  log_buf_len total cpu_extra contributions: 28672 bytes
  log_buf_len min size: 32768 bytes
  log_buf_len: 65536 bytes
  early log buf free: 30432(92%)
  PID hash table entries: 512 (order: -2, 4096 bytes)
  Dentry cache hash table entries: 16384 (order: 3, 131072 bytes)
  Inode-cache hash table entries: 8192 (order: 2, 65536 bytes)
  Writing ErrCtl register=3D00000000
  Readback ErrCtl register=3D00000000
  MAAR configuration:
    [0]: 0x0000000000010000-0x0000000007ffffff speculate
    [1]: disabled
    [2]: disabled
    [3]: disabled
    [4]: disabled
    [5]: disabled
    [6]: disabled
    [7]: disabled
  Memory: 121104K/131072K available (5253K kernel code, 380K rwdata, 1276K =
rodata, 304K init, 278K bss, 9968K reserved, 0K cma-reserved)
  Hierarchical RCU implementation.
          Build-time adjustment of leaf fanout to 64.
  NR_IRQS:256
  CPU frequency 200.00 MHz
  GIC frequency 100.00 MHz
  clocksource: GIC: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1=
9112702515 ns
  clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: =
19112355619 ns
  sched_clock: 32 bits at 100MHz, resolution 9ns, wraps every 21474556923ns
  ...
  Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
  Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 64 bytes
  CPU7 revision is: 0001a900 (MIPS I6400)
  FPU revision is: 20f30300
  MSA revision is: 00000300
  Synchronize counters for CPU 7: done.
  Brought up 8 CPUs
  devtmpfs: initialized
  clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 19112604462750000 ns
  NET: Registered protocol family 16
  pm-cps: CPC does not support clock gating
  vgaarb: loaded
  SCSI subsystem initialized
  PCI host bridge to bus 0000:00
  pci_bus 0000:00: root bus resource [mem 0x10000000-0x17ffffff]
  pci_bus 0000:00: root bus resource [io  0x1000-0x1fffff]
  pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
  pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
  pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
  pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
  pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
  pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
  pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
  pci 0000:00:0a.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
  pci 0000:00:0a.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
  pci 0000:00:0a.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
  pci 0000:00:0a.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
  Aborted (core dumped)

  (gdb) bt
  #0  0x00007fe1e8d37e35 in raise () at /lib64/libc.so.6
  #1  0x00007fe1e8d22895 in abort () at /lib64/libc.so.6
  #2  0x000055d442b388ba in acpi_gpe_ioport_get_ptr (addr=3Daddr@entry=3D49=
312, ar=3Dar@entry=3D0x55d4444212d0) at hw/acpi/core.c:670
  #3  0x000055d442b388ba in acpi_gpe_ioport_writeb (ar=3Dar@entry=3D0x55d44=
44212d0, addr=3Daddr@entry=3D49312, val=3Dval@entry=3D181) at hw/acpi/core.=
c:680
  #4  0x000055d442d3f363 in gpe_writeb (opaque=3D0x55d444420800, addr=3D493=
12, val=3D181, width=3D<optimized out>) at hw/acpi/piix4.c:553
  #5  0x000055d442b9534b in memory_region_write_accessor (mr=3Dmr@entry=3D0=
x55d4444211e0, addr=3D49312, value=3Dvalue@entry=3D0x7fe1ddff9ef8, size=3Ds=
ize@entry=3D1, shift=3D<optimized out>, mask=3Dmask@entry=3D255, attrs=3D..=
.)
      at memory.c:483
  #6  0x000055d442b9305e in access_with_adjusted_size (addr=3Daddr@entry=3D=
49312, value=3Dvalue@entry=3D0x7fe1ddff9ef8, size=3Dsize@entry=3D8, access_=
size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D=
access_fn@entry=3D
      0x55d442b95220 <memory_region_write_accessor>, mr=3D0x55d4444211e0, a=
ttrs=3D...) at memory.c:544
  #7  0x000055d442b976b4 in memory_region_dispatch_write (mr=3Dmr@entry=3D0=
x55d4444211e0, addr=3Daddr@entry=3D49312, data=3D<optimized out>, data@entr=
y=3D327163317, op=3Dop@entry=3DMO_64, attrs=3D...) at memory.c:1475
  #8  0x000055d442ba44fd in io_writex
      (env=3Denv@entry=3D0x55d443ec8f60, mmu_idx=3Dmmu_idx@entry=3D0, val=
=3Dval@entry=3D327163317, addr=3Daddr@entry=3D10376293541929074848, retaddr=
=3D140608199778784, op=3DMO_64, iotlbentry=3D<optimized out>, iotlbentry=3D=
<optimized out>)
      at accel/tcg/cputlb.c:980
  #9  0x000055d442baa43c in store_helper (op=3DMO_64, retaddr=3D14060819977=
8784, oi=3D<optimized out>, val=3D<optimized out>, addr=3D10376293541929074=
848, env=3D0x55d443ec8f60) at accel/tcg/cputlb.c:1788
  #10 0x000055d442baa43c in helper_le_stq_mmu (env=3D0x55d443ec8f60, addr=
=3D10376293541929074848, val=3D327163317, oi=3D<optimized out>, retaddr=3D1=
40608199778784) at accel/tcg/cputlb.c:1920
  #11 0x00007fe1e5cce1e0 in code_gen_buffer ()
  #12 0x000055d442bbc6d3 in cpu_tb_exec (itb=3D<optimized out>, cpu=3D0x0) =
at accel/tcg/cpu-exec.c:172
  #13 0x000055d442bbc6d3 in cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>=
, last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D0x0) at accel/=
tcg/cpu-exec.c:618
  #14 0x000055d442bbc6d3 in cpu_exec (cpu=3Dcpu@entry=3D0x55d443ec0550) at =
accel/tcg/cpu-exec.c:731
  #15 0x000055d442b88580 in tcg_cpu_exec (cpu=3D0x55d443ec0550) at cpus.c:1=
405
  #16 0x000055d442b8a6f4 in qemu_tcg_cpu_thread_fn (arg=3Darg@entry=3D0x55d=
443ec0550) at cpus.c:1713
  #17 0x000055d442faeb7b in qemu_thread_start (args=3D<optimized out>) at u=
til/qemu-thread-posix.c:519
  #18 0x00007fe1e8ece4c0 in start_thread () at /lib64/libpthread.so.0
  #19 0x00007fe1e8dfc163 in clone () at /lib64/libc.so.6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861562/+subscriptions

