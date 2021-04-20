Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7C36542F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:33:20 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlot-0004Oc-JU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlis-0004mO-Ir
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:59040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlio-0002b9-6x
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlil-00028P-DY
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3AD242E817E
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:03:47 -0000
From: Thomas Huth <1811244@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: core i386 mttcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jakub th-huth
X-Launchpad-Bug-Reporter: Jakub Jermar (jakub)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154712887375.19548.13853640095079074628.malonedeb@soybean.canonical.com>
Message-Id: <161890582757.16770.5232784163739389627.malone@wampee.canonical.com>
Subject: [Bug 1811244] Re: qemu 3.1/i386 crashes/guest hangs when MTTCG is
 enabled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 070ca0bf4f1a7340bf954fa7d39f29909e389ba7
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
Reply-To: Bug 1811244 <1811244@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811244

Title:
  qemu 3.1/i386 crashes/guest hangs when MTTCG is enabled

Status in QEMU:
  Incomplete

Bug description:
  When MTTCG is enabled, QEMU 3.1.0 sometimes crashes when running the
  following command line:

  qemu-system-i386 -kernel
  /home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/bootstrap
  -append bootstrap -initrd
  "/home/jermar/work/software/l4/fiasco/.build-i386/fiasco
  -serial_esc,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/=
l4f/sigma0
  ,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/l4f/moe
  rom/ahci.cfg,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen=
/l4f/ned
  ,test_env.lua ,/home/jermar/Kernkonzept/software/l4/pkg/ahci-
  driver/examples/md5sum/ahci.cfg
  ,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/l4f/l4re
  ,/home/jermar/Kernkonzept/software/l4/pkg/ahci-
  driver/examples/md5sum/ahci.io
  ,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/l4f/io
  ,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/l4f
  /ahci-drv
  ,/home/jermar/Kernkonzept/software/l4/.build-i386/bin/x86_gen/l4f
  /ahci-md5-sync" -smp 4 -accel tcg,thread=3Dmulti -device ahci,id=3Dahci0
  -drive
  if=3Dnone,file=3D/home/jermar/Kernkonzept/software/l4/.build-i386/pkg
  /ahci-driver/test/examples/test_ahci.img,format=3Draw,id=3Ddrive-sata0-0-0
  -device ide-drive,bus=3Dahci0.0,drive=3Ddrive-sata0-0-0,id=3Dsata0-0-0
  -serial stdio -nographic -monitor none

  The host is x86_64.

  The stack at the time of the crash (core dump and debug binary
  attached to the bug):

  Core was generated by `qemu-system-i386 -kernel /home/jermar/Kernkonzept/=
software/l4/.build-i386/bin/x'.
  Program terminated with signal SIGSEGV, Segmentation fault.
  #0  io_writex (env=3Denv@entry=3D0x565355ca0140, iotlbentry=3Diotlbentry@=
entry=3D0x565355ca9120, mmu_idx=3D2, val=3Dval@entry=3D0, addr=3Daddr@entry=
=3D3938451632, retaddr=3Dretaddr@entry=3D140487132809203, recheck=3Dfalse, =
size=3D4)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/jermar/software/HelenOS/helenos.git/cont=
rib/qemu/qemu-3.1.0/accel/tcg/cputlb.c:791
  791	    if (mr->global_locking && !qemu_mutex_iothread_locked()) {
  [Current thread is 1 (Thread 0x7fc5af7fe700 (LWP 3625719))]
  Missing separate debuginfos, use: dnf debuginfo-install SDL2-2.0.9-1.fc29=
.x86_64 at-spi2-atk-2.30.0-1.fc29.x86_64 at-spi2-core-2.30.0-2.fc29.x86_64 =
atk-2.30.0-1.fc29.x86_64 bzip2-libs-1.0.6-28.fc29.x86_64 cairo4
  (gdb) bt
  #0  0x0000565354f5f365 in io_writex
  =C2=A0=C2=A0=C2=A0=C2=A0(env=3Denv@entry=3D0x565355ca0140, iotlbentry=3Di=
otlbentry@entry=3D0x565355ca9120, mmu_idx=3D2, val=3Dval@entry=3D0, addr=3D=
addr@entry=3D3938451632, retaddr=3Dretaddr@entry=3D140487132809203, recheck=
=3Dfalse, size=3D4)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/jermar/software/HelenOS/helenos.git/cont=
rib/qemu/qemu-3.1.0/accel/tcg/cputlb.c:791
  #1  0x0000565354f621b2 in io_writel (recheck=3D<optimized out>, retaddr=
=3D140487132809203, addr=3D3938451632, val=3D0, index=3D0, mmu_idx=3D2, env=
=3D0x565355ca0140)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/jermar/software/HelenOS/helenos.git/cont=
rib/qemu/qemu-3.1.0/accel/tcg/softmmu_template.h:310
  #2  0x0000565354f621b2 in helper_le_stl_mmu (env=3D0x565355ca0140, addr=
=3D<optimized out>, val=3D0, oi=3D34, retaddr=3D140487132809203)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/jermar/software/HelenOS/helenos.git/cont=
rib/qemu/qemu-3.1.0/accel/tcg/softmmu_template.h:310
  #3  0x00007fc5b5a587f3 in code_gen_buffer ()
  #4  0x0000565354f75fd0 in cpu_tb_exec (itb=3D<optimized out>, cpu=3D0x7fc=
5b5a5aa40 <code_gen_buffer+12266006>) at /home/jermar/software/HelenOS/hele=
nos.git/contrib/qemu/qemu-3.1.0/accel/tcg/cpu-exec.c:171
  #5  0x0000565354f75fd0 in cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>=
, last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D0x7fc5b5a5aa40=
 <code_gen_buffer+12266006>)
  =C2=A0=C2=A0=C2=A0=C2=A0at /home/jermar/software/HelenOS/helenos.git/cont=
rib/qemu/qemu-3.1.0/accel/tcg/cpu-exec.c:615
  #6  0x0000565354f75fd0 in cpu_exec (cpu=3Dcpu@entry=3D0x565355c97e90) at =
/home/jermar/software/HelenOS/helenos.git/contrib/qemu/qemu-3.1.0/accel/tcg=
/cpu-exec.c:725
  #7  0x0000565354f33b1f in tcg_cpu_exec (cpu=3D0x565355c97e90) at /home/je=
rmar/software/HelenOS/helenos.git/contrib/qemu/qemu-3.1.0/cpus.c:1429
  #8  0x0000565354f35e83 in qemu_tcg_cpu_thread_fn (arg=3D0x565355c97e90) a=
t /home/jermar/software/HelenOS/helenos.git/contrib/qemu/qemu-3.1.0/cpus.c:=
1733
  #9  0x0000565354f35e83 in qemu_tcg_cpu_thread_fn (arg=3Darg@entry=3D0x565=
355c97e90) at /home/jermar/software/HelenOS/helenos.git/contrib/qemu/qemu-3=
.1.0/cpus.c:1707
  #10 0x00005653552ec5da in qemu_thread_start (args=3D<optimized out>) at u=
til/qemu-thread-posix.c:498
  #11 0x00007fc5b858a58e in start_thread () at /lib64/libpthread.so.0
  #12 0x00007fc5b84b96a3 in clone () at /lib64/libc.so.6

  Another symptom that occurs more often than this crash is that the
  guest hangs while waiting for another CPU to complete a cross-CPU
  call. Disabling MTTCG makes both symptoms go away.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811244/+subscriptions

