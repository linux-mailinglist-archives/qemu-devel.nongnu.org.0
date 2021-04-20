Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE17365427
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:30:44 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlmN-0000zK-3L
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYliq-0004kB-Sc
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:58930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlin-0002Zx-HX
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlik-00028W-Bk
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA6C62E8161
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:07:23 -0000
From: Thomas Huth <1813398@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugdal nsz th-huth
X-Launchpad-Bug-Reporter: Szabolcs Nagy (nsz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154851076407.2082.8506477460504942900.malonedeb@wampee.canonical.com>
Message-Id: <161890604351.6478.17269953750139548271.malone@soybean.canonical.com>
Subject: [Bug 1813398] Re: qemu user calls malloc after fork in multi-threaded
 process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 0c9d15b0b3a6a332d8938fef25abda8cdb9687a6
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
Reply-To: Bug 1813398 <1813398@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1813398

Title:
  qemu user calls malloc after fork in multi-threaded process

Status in QEMU:
  Incomplete

Bug description:
  qemu user may hang in malloc on a musl based system because
  it calls malloc after fork (in a pthread_atfork handler)
  in the child process.

  this is undefined behaviour since the parent process is
  multi-threaded and only as-safe functions may be called
  in the child then. (if malloc/free is called concurrently
  with fork the malloc state will be corrupted in the child,
  it works on glibc because glibc takes the malloc locks
  before the fork syscall, but that breaks the as-safety of
  fork and thus non-conforming to posix)

  discussed at
  https://www.openwall.com/lists/musl/2019/01/26/1

  the bug is hard to reproduce (requires the call_rcu thread
  to call free concurrently with do_fork in the main thread),
  this one is observed with qemu-arm 3.1.0 running on x86_64
  executing an arm busybox sh:

  (gdb) bt
  #0  malloc (n=3D<optimized out>, n@entry=3D9) at src/malloc/malloc.c:306
  #1  0x0000000060184ad3 in g_malloc (n_bytes=3Dn_bytes@entry=3D9) at gmem.=
c:99
  #2  0x000000006018bcab in g_strdup (str=3D<optimized out>, str@entry=3D0x=
60200abf "call_rcu") at gstrfuncs.c:363
  #3  0x000000006016e31d in qemu_thread_create (thread=3Dthread@entry=3D0x7=
ffe367d1870, name=3Dname@entry=3D0x60200abf "call_rcu", =

      start_routine=3Dstart_routine@entry=3D0x60174c00 <call_rcu_thread>, a=
rg=3Darg@entry=3D0x0, mode=3Dmode@entry=3D1)
      at /home/pmos/build/src/qemu-3.1.0/util/qemu-thread-posix.c:526
  #4  0x0000000060174b99 in rcu_init_complete () at /home/pmos/build/src/qe=
mu-3.1.0/util/rcu.c:327
  #5  0x00000000601c4fac in __fork_handler (who=3D1) at src/thread/pthread_=
atfork.c:26
  #6  0x00000000601be8db in fork () at src/process/fork.c:33
  #7  0x000000006009d191 in do_fork (env=3D0x627aaed0, flags=3Dflags@entry=
=3D17, newsp=3Dnewsp@entry=3D0, parent_tidptr=3Dparent_tidptr@entry=3D0, =

      newtls=3Dnewtls@entry=3D0, child_tidptr=3Dchild_tidptr@entry=3D0) at =
/home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:5528
  #8  0x00000000600af894 in do_syscall1 (cpu_env=3Dcpu_env@entry=3D0x627aae=
d0, num=3Dnum@entry=3D2, arg1=3Darg1@entry=3D0, arg2=3Darg2@entry=3D-870019=
2, =

      arg3=3D<optimized out>, arg4=3D8, arg5=3D1015744, arg6=3D-74144, arg7=
=3D0, arg8=3D0) at /home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:7042
  #9  0x00000000600a835c in do_syscall (cpu_env=3Dcpu_env@entry=3D0x627aaed=
0, num=3D2, arg1=3D0, arg2=3D-8700192, arg3=3D<optimized out>, =

      arg4=3D<optimized out>, arg5=3D1015744, arg6=3D-74144, arg7=3D0, arg8=
=3D0) at /home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:11533
  #10 0x00000000600c265f in cpu_loop (env=3Denv@entry=3D0x627aaed0) at /hom=
e/pmos/build/src/qemu-3.1.0/linux-user/arm/cpu_loop.c:360
  #11 0x00000000600417a2 in main (argc=3D<optimized out>, argv=3D0x7ffe367d=
57b8, envp=3D<optimized out>)
      at /home/pmos/build/src/qemu-3.1.0/linux-user/main.c:819

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813398/+subscriptions

