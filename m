Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105C370E79
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:29:24 +0200 (CEST)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGqJ-0001rK-5Q
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGn1-0008Dd-63
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:45660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGmt-0008Ms-2M
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGmr-0000oA-3I
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 17FF92E8058
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:15:55 -0000
From: Thomas Huth <1856837@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm gcc9.2 segfault
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fgodeh pmaydell th-huth
X-Launchpad-Bug-Reporter: Fabian Godehardt (fgodeh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157666594314.15384.3778802807711797985.malonedeb@wampee.canonical.com>
Message-Id: <161997935574.13825.872086376513724000.malone@wampee.canonical.com>
Subject: [Bug 1856837] Re: qemu 4.2.0 arm  segmentation fault with gcc 9.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: eac2816209871a2e8b3d5c9fe5249aad440b2a10
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1856837 <1856837@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856837

Title:
  qemu 4.2.0 arm  segmentation fault with gcc 9.2

Status in QEMU:
  Incomplete

Bug description:
  As discussed with f4bug yesterday on IRC here comes the bug
  description.

  I'm building/configured qemu-4.2.0 on an x86_64 (gcc (Debian
  6.3.0-18+deb9u1) 6.3.0 20170516) with target-list "arm-softmmu,arm-
  linux-user" and debug enabled. I use the arm-linux-user variant,
  "qemu-arm".

  Then i'm trying to cross-compile (arm gcc) an old version of googles
  v8 (as i need this version of the lib for binary compatibility) which
  uses qemu during build.

  It worked with gcc 5.4.0 but not with 9.2.0. I also tried with 6.5.0,
  7.4.0 and 8.3.0 but those are also causing the same segmentation
  fault.

  The executed command wich breaks qemu is:

   qemu-arm /tmp/build/out/arm.release/mksnapshot.arm --log-snapshot-
  positions --logfile
  /tmp/build/out/arm.release/obj.host/v8_snapshot/geni/snapshot.log
  --random-seed 314159265 /tmp/build/out/arm.release/obj.host/v8_snap

  The printed error message is:

  ARMv7=3D1 VFP3=3D1 VFP32DREGS=3D1 NEON=3D0 SUDIV=3D0 UNALIGNED_ACCESSES=
=3D1 MOVW_MOVT_IMMEDIATE_LOADS=3D0 USE_EABI_HARDFLOAT=3D1
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  Calling qemu with gdb gives the following information:

   Thread 1 "qemu-arm" received signal SIGSEGV, Segmentation fault.
   0x0000555555d63d11 in static_code_gen_buffer ()

  and

   (gdb) bt
   #0  0x0000555555d63d11 in static_code_gen_buffer ()
   #1  0x0000555555628d58 in cpu_tb_exec (itb=3D<optimized out>, cpu=3D0x55=
5557c33930) at =

   /tmp/build/qemu/accel/tcg/cpu-exec.c:172
   #2  cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>, last_tb=3D<syntheti=
c pointer>, tb=3D<optimized out>, =

   cpu=3D0x555557c33930) at /tmp/build/qemu/accel/tcg/cpu-exec.c:618
   #3  cpu_exec (cpu=3Dcpu@entry=3D0x555557c2b660) at /tmp/build/qemu/accel=
/tcg/cpu-exec.c:731
   #4  0x0000555555661578 in cpu_loop (env=3D0x555557c33930) at /tmp/build/=
qemu/linux-user/arm/cpu_loop.c:219
  #5  0x00005555555d6d76 in main (argc=3D<optimized out>, argv=3D<optimized=
 out>, envp=3D<optimized out>) at /tmp/build/qemu/linux-user/main.c:865

  Calling qemu-arm with debug switch "-d in_asm,int,op_opt" shows the
  log in the attached file.

  Thanks for any hints!
  Fabian

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856837/+subscriptions

