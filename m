Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755F24093A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 17:30:42 +0200 (CEST)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k59l3-0008FK-4M
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 11:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k59jr-0007GC-Uu
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:29:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k59jp-0007GC-TY
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:29:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k59jm-0004Pn-Ha
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 15:29:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7CC6A2E80AB
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 15:29:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2020 15:19:17 -0000
From: Steve Dodd <1594394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anarchetic jrtc27 kb9vqf laurent-vivier legoll
 pmaydell
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Steve Dodd (anarchetic)
References: <20160620140124.12349.60184.malonedeb@wampee.canonical.com>
Message-Id: <159707275762.9919.8616279080154529868.malone@wampee.canonical.com>
Subject: [Bug 1594394] Re: Using setreuid / setegid crashes x86_64 user-mode
 target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5bb57a6518443127df03972ef5415ffafe5ac015
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:25:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1594394 <1594394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Possibly
https://github.com/qemu/qemu/commit/6bc024e713fd35eb5fddbe16acd8dc92d27872a9
#diff-6389d258c2de2f974953be12cab45851 ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1594394

Title:
  Using setreuid / setegid crashes x86_64 user-mode target

Status in QEMU:
  New

Bug description:
  When setreuid() or setegid() are called from x86_64 target code in
  user mode, qemu crashes inside the NPTL signal handlers.  x86 targets
  do not directly use a syscall to handle setreuid() / setegid();
  instead the x86 NPTL implementation sets up a temporary data region in
  memory (__xidcmd) and issues a signal (SIGRT1) to all threads,
  allowing the handler for that signal to issue the syscall.  Under
  qemu, __xidcmd remains null (see variable display below backtrace).

  Backtrace:
  Program received signal SIGSEGV, Segmentation fault.
  [Switching to Thread 0x3fff85c74fc0 (LWP 74517)]
  0x000000006017491c in sighandler_setxid (sig=3D33, si=3D0x3fff85c72d08, c=
tx=3D0x3fff85c71f90) at nptl-init.c:263
  263     nptl-init.c: No such file or directory.
  (gdb) thread apply all bt

  Thread 3 (Thread 0x3fff87e8efc0 (LWP 74515)):
  #0  0x00000000601cc430 in syscall ()
  #1  0x0000000060109080 in futex_wait (val=3D<optimized out>, ev=3D<optimi=
zed out>) at /build/qemu/util/qemu-thread-posix.c:292
  #2  qemu_event_wait (ev=3D0x62367bb0 <rcu_call_ready_event>) at /build/qe=
mu/util/qemu-thread-posix.c:399
  #3  0x000000006010f73c in call_rcu_thread (opaque=3D<optimized out>) at /=
build/qemu/util/rcu.c:250
  #4  0x0000000060176f8c in start_thread (arg=3D0x3fff87e8efc0) at pthread_=
create.c:336
  #5  0x00000000601cebf4 in clone ()

  Thread 2 (Thread 0x3fff85c74fc0 (LWP 74517)):
  #0  0x000000006017491c in sighandler_setxid (sig=3D33, si=3D0x3fff85c72d0=
8, ctx=3D0x3fff85c71f90) at nptl-init.c:263
  #1  <signal handler called>
  #2  0x00000000601cc42c in syscall ()
  #3  0x0000000060044b08 in safe_futex (val3=3D<optimized out>, uaddr2=3D0x=
0, timeout=3D<optimized out>, val=3D<optimized out>, op=3D128, uaddr=3D<opt=
imized out>) at /build/qemu/linux-user/syscall.c:748
  #4  do_futex (val3=3D<optimized out>, uaddr2=3D275186650880, timeout=3D0,=
 val=3D1129, op=3D128, uaddr=3D275186651116) at /build/qemu/linux-user/sysc=
all.c:6201
  #5  do_syscall (cpu_env=3D0x1000abfd350, num=3D<optimized out>, arg1=3D27=
5186651116, arg2=3D<optimized out>, arg3=3D1129, arg4=3D0, arg5=3D275186650=
880, arg6=3D<optimized out>, arg7=3D0, arg8=3D0)
      at /build/qemu/linux-user/syscall.c:10651
  #6  0x00000000600347b8 in cpu_loop (env=3D0x1000abfd350) at /build/qemu/l=
inux-user/main.c:317
  #7  0x0000000060036ae0 in clone_func (arg=3D0x3fffc4c2ca38) at /build/qem=
u/linux-user/syscall.c:5445
  #8  0x0000000060176f8c in start_thread (arg=3D0x3fff85c74fc0) at pthread_=
create.c:336
  #9  0x00000000601cebf4 in clone ()

  Thread 1 (Thread 0x1000aa05000 (LWP 74511)):
  #0  0x00000000601cc430 in syscall ()
  #1  0x0000000060044b08 in safe_futex (val3=3D<optimized out>, uaddr2=3D0x=
0, timeout=3D<optimized out>, val=3D<optimized out>, op=3D128, uaddr=3D<opt=
imized out>) at /build/qemu/linux-user/syscall.c:748
  #2  do_futex (val3=3D<optimized out>, uaddr2=3D1, timeout=3D0, val=3D1, o=
p=3D128, uaddr=3D275078324992) at /build/qemu/linux-user/syscall.c:6201
  #3  do_syscall (cpu_env=3D0x1000aa23890, num=3D<optimized out>, arg1=3D27=
5078324992, arg2=3D<optimized out>, arg3=3D1, arg4=3D0, arg5=3D1, arg6=3D<o=
ptimized out>, arg7=3D0, arg8=3D0) at /build/qemu/linux-user/syscall.c:10651
  #4  0x00000000600347b8 in cpu_loop (env=3D0x1000aa23890) at /build/qemu/l=
inux-user/main.c:317
  #5  0x00000000600020e4 in main (argc=3D<optimized out>, argv=3D<optimized=
 out>, envp=3D<optimized out>) at /build/qemu/linux-user/main.c:4779
  (gdb) p __xidcmd
  $1 =3D (struct xid_command *) 0x0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1594394/+subscriptions

