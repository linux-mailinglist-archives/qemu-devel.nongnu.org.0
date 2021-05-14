Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D3F38110A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:42:03 +0200 (CEST)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdhC-0002JO-FB
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdav-00074W-Ue
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdat-0000eW-Un
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdas-0003Kc-4U
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 20FAD2E813A
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:28:34 -0000
From: Thomas Huth <1908515@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung th-huth
X-Launchpad-Bug-Reporter: Cheolwoo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160820246981.31417.5449705170430880088.malonedeb@chaenomeles.canonical.com>
Message-Id: <162102051484.7802.7177461217395416326.malone@gac.canonical.com>
Subject: [Bug 1908515] Re: assertion failure in lsi53c810 emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 5ab9d8ef0c134a4b5cbc00803b3d26a17a932233
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1908515 <1908515@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/305


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #305
   https://gitlab.com/qemu-project/qemu/-/issues/305

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908515

Title:
  assertion failure in lsi53c810 emulator

Status in QEMU:
  Expired

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  lsi53c810 emulator.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master)

  =

  qemu-system-i386: ../hw/scsi/lsi53c895a.c:624: void lsi_do_dma(LSIState *=
, int): Assertion `s->current'
  failed.
  [1]    1406 abort (core dumped)  /home/cwmyung/prj/hyfuzz/src/qemu-5.2/bu=
ild/i386-softmmu/qemu-system-i386 -m

  Program terminated with signal SIGABRT, Aborted.
  #0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/rais=
e.c:51
  51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  [Current thread is 1 (Thread 0x7fa9310a8700 (LWP 2076))]
  gdb-peda$ bt
  #0  0x00007fa94aa98f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007fa94aa9a8b1 in __GI_abort () at abort.c:79
  #2  0x00007fa94aa8a42a in __assert_fail_base (fmt=3D0x7fa94ac11a38 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\\n%n", assertion=3Dassertion@entry=3D0x562=
851c9eab9 "s->current", file=3Dfile@entry=3D0x562851c9d4f9 "../hw/scsi/lsi5=
3c895a.c", line=3Dline@entry=3D0x270, function=3Dfunction@entry=3D0x562851c=
9de43 "void lsi_do_dma(LSIState *, int)") at assert.c:92
  #3  0x00007fa94aa8a4a2 in __GI___assert_fail (assertion=3D0x562851c9eab9 =
"s->current", file=3D0x562851c9d4f9 "../hw/scsi/lsi53c895a.c", line=3D0x270=
, function=3D0x562851c9de43 "void lsi_do_dma(LSIState *, int)")
      at assert.c:101
  #4  0x00005628515d9605 in lsi_do_dma (s=3D0x562855559060, out=3D0x1) at .=
./hw/scsi/lsi53c895a.c:624
  #5  0x00005628515d5317 in lsi_execute_script (s=3D<optimized out>) at ../=
hw/scsi/lsi53c895a.c:1250
  #6  0x00005628515cec49 in lsi_reg_writeb (s=3D0x562855559060, offset=3D0x=
2f, val=3D0x1e)
      at ../hw/scsi/lsi53c895a.c:2005
  #7  0x0000562851952798 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)
      at ../softmmu/memory.c:491
  #8  0x000056285195258e in access_with_adjusted_size (addr=3D<optimized ou=
t>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opt=
imized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>=
, mr=3D<optimized out>, attrs=3D...) at ../softmmu/memory.c:552
  #9  0x000056285195258e in memory_region_dispatch_write (mr=3D0x5628555599=
60, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, a=
ttrs=3D...) at ../softmmu/memory.c:1501
  #10 0x00005628518e5305 in flatview_write_continue (fv=3D0x7fa92871f040, a=
ddr=3D0xfebf302c, attrs=3D..., ptr=3D0x7fa9310a49b8, len=3D0x4, addr1=3D0x7=
fa9310a3410, l=3D<optimized out>, mr=3D0x562855559960)
      at ../softmmu/physmem.c:2759
  #11 0x00005628518e6ef6 in flatview_write (fv=3D0x7fa92871f040, addr=3D0xf=
ebf302c, attrs=3D..., len=3D0x4, buf=3D<optimized out>) at ../softmmu/physm=
em.c:2799
  #12 0x00005628518e6ef6 in subpage_write (opaque=3D<optimized out>, addr=
=3D<optimized out>, value=3D<optimized out>, len=3D<optimized out>, attrs=
=3D...) at ../softmmu/physmem.c:2465
  #13 0x00005628519529a2 in memory_region_write_with_attrs_accessor (mr=3D<=
optimized out>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<op=
timized out>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)=
 at ../softmmu/memory.c:511
  #14 0x00005628519525e1 in access_with_adjusted_size (addr=3D<optimized ou=
t>, size=3D<optimized out>, access_size_min=3D<optimized out>, access_size_=
max=3D<optimized out>, mr=3D<optimized out>, attrs=3D..., value=3D<optimize=
d out>, access_fn=3D<optimized out>) at ../softmmu/memory.c:552
  #15 0x00005628519525e1 in memory_region_dispatch_write (mr=3D<optimized o=
ut>, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, =
attrs=3D...) at ../softmmu/memory.c:1508
  #16 0x0000562851a49228 in io_writex (iotlbentry=3D<optimized out>, mmu_id=
x=3D<optimized out>, val=3D<optimized out>, addr=3D<optimized out>, retaddr=
=3D<optimized out>, op=3D<optimized out>, env=3D<optimized out>)
      at ../accel/tcg/cputlb.c:1378
  #17 0x0000562851a49228 in store_helper (env=3D<optimized out>, addr=3D<op=
timized out>, val=3D<optimized out>, oi=3D<optimized out>, retaddr=3D<optim=
ized out>, op=3DMO_32) at ../accel/tcg/cputlb.c:2397
  #18 0x0000562851a49228 in helper_le_stl_mmu (env=3D<optimized out>, addr=
=3D<optimized out>, val=3D0x2, oi=3D<optimized out>, retaddr=3D0x7fa8e44032=
ee) at ../accel/tcg/cputlb.c:2463
  #19 0x00007fa8e44032ee in code_gen_buffer ()
  #20 0x000056285191ada0 in cpu_tb_exec (cpu=3D0x5628547b81a0, itb=3D<optim=
ized out>)
      at ../accel/tcg/cpu-exec.c:178
  #21 0x000056285191b9eb in cpu_loop_exec_tb (tb=3D<optimized out>, cpu=3D<=
optimized out>, last_tb=3D<optimized out>, tb_exit=3D<optimized out>) at ..=
/accel/tcg/cpu-exec.c:658
  #22 0x000056285191b9eb in cpu_exec (cpu=3D0x5628547b81a0) at ../accel/tcg=
/cpu-exec.c:771
  #23 0x000056285194ab9f in tcg_cpu_exec (cpu=3D<optimized out>) at ../acce=
l/tcg/tcg-cpus.c:243
  #24 0x000056285194ab9f in tcg_cpu_thread_fn (arg=3D0x5628547b81a0) at ../=
accel/tcg/tcg-cpus.c:427
  #25 0x0000562851c22775 in qemu_thread_start (args=3D<optimized out>) at .=
./util/qemu-thread-posix.c:521
  #26 0x00007fa94ae526db in start_thread (arg=3D0x7fa9310a8700) at pthread_=
create.c:463
  #27 0x00007fa94ab7ba3f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  To reproduce this issue, please run the QEMU with the following
  command line.

  =

  # To enable ASan option, please set configuration with the following comm=
and
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line.
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw -device lsi53c810,id=3Dscsi -device scsi-hd,drive=3DSysDi=
sk -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please let me know if I can provide any further info.
  Thank you.

  - Cheolwoo, Myung (Seoul National University)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908515/+subscriptions

