Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8C1C5ABE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 17:12:54 +0200 (CEST)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVzFd-0000eM-Fz
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 11:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVzEE-0007n7-Ef
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:11:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVzED-0005Lb-75
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:11:26 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jVzE9-0004KB-Nu
 for <qemu-devel@nongnu.org>; Tue, 05 May 2020 15:11:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 047002E811D
 for <qemu-devel@nongnu.org>; Tue,  5 May 2020 15:11:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 May 2020 15:01:14 -0000
From: Ike Panhc <ike.pan@canonical.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=kunpeng920; status=Triaged; importance=Undecided;
 assignee=ike.pan@canonical.com; 
X-Launchpad-Bug: product=kunpeng920; productseries=ubuntu-18.04; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=kunpeng920; productseries=ubuntu-18.04-hwe; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=kunpeng920; productseries=ubuntu-19.10; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=kunpeng920; productseries=ubuntu-20.04; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=kunpeng920; productseries=upstream-kernel;
 status=Fix Committed; importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Medium; assignee=rafaeldtinoco@ubuntu.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=bionic; sourcepackage=qemu; 
 component=main; status=Incomplete; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=disco; sourcepackage=qemu; 
 component=main; status=Incomplete; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=eoan; sourcepackage=qemu;
 component=main; status=Incomplete; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Incomplete; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Tags: ikeradar patch qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-cloke dannf ikepanhc iveskim jan-glauber-i
 jnsnow kongzizaixian lizhengui rafaeldtinoco
 ying-fang
X-Launchpad-Bug-Reporter: dann frazier (dannf)
X-Launchpad-Bug-Modifier: Ike Panhc (ikepanhc)
References: <154327283728.15443.11625169757714443608.malonedeb@soybean.canonical.com>
Message-Id: <158869087465.13722.12667604473532787964.malone@gac.canonical.com>
Subject: [Bug 1805256] Re: qemu-img hangs on rcu_call_ready_event logic in
 Aarch64 when converting images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0a01f34375d360d798c9a951671c1efdeb7afbd9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 11:11:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1805256 <1805256@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test deb has been pushed to
https://launchpad.net/~ikepanhc/+archive/ubuntu/lp1805256

40 run with patch mentioned in #43 and all passed.

Thanks.


** Changed in: kunpeng920
       Status: Incomplete =3D> Triaged

** Changed in: kunpeng920
     Assignee: (unassigned) =3D> Ike Panhc (ikepanhc)

** Also affects: kunpeng920/upstream-kernel
   Importance: Undecided
       Status: New

** Also affects: kunpeng920/ubuntu-20.04
   Importance: Undecided
       Status: New

** Also affects: kunpeng920/ubuntu-19.10
   Importance: Undecided
       Status: New

** Also affects: kunpeng920/ubuntu-18.04
   Importance: Undecided
       Status: New

** Also affects: kunpeng920/ubuntu-18.04-hwe
   Importance: Undecided
       Status: New

** Changed in: kunpeng920/upstream-kernel
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1805256

Title:
  qemu-img hangs on rcu_call_ready_event logic in Aarch64 when
  converting images

Status in kunpeng920:
  Triaged
Status in kunpeng920 ubuntu-18.04 series:
  New
Status in kunpeng920 ubuntu-18.04-hwe series:
  New
Status in kunpeng920 ubuntu-19.10 series:
  New
Status in kunpeng920 ubuntu-20.04 series:
  New
Status in kunpeng920 upstream-kernel series:
  Fix Committed
Status in QEMU:
  In Progress
Status in qemu package in Ubuntu:
  Incomplete
Status in qemu source package in Bionic:
  Incomplete
Status in qemu source package in Disco:
  Incomplete
Status in qemu source package in Eoan:
  Incomplete
Status in qemu source package in Focal:
  Incomplete

Bug description:
  Command:

  qemu-img convert -f qcow2 -O qcow2 ./disk01.qcow2 ./output.qcow2

  Hangs indefinitely approximately 30% of the runs.

  ----

  Workaround:

  qemu-img convert -m 1 -f qcow2 -O qcow2 ./disk01.qcow2 ./output.qcow2

  Run "qemu-img convert" with "a single coroutine" to avoid this issue.

  ----

  (gdb) thread 1
  ...
  (gdb) bt
  #0 0x0000ffffbf1ad81c in __GI_ppoll
  #1 0x0000aaaaaabcf73c in ppoll
  #2 qemu_poll_ns
  #3 0x0000aaaaaabd0764 in os_host_main_loop_wait
  #4 main_loop_wait
  ...

  (gdb) thread 2
  ...
  (gdb) bt
  #0 syscall ()
  #1 0x0000aaaaaabd41cc in qemu_futex_wait
  #2 qemu_event_wait (ev=3Dev@entry=3D0xaaaaaac86ce8 <rcu_call_ready_event>)
  #3 0x0000aaaaaabed05c in call_rcu_thread
  #4 0x0000aaaaaabd34c8 in qemu_thread_start
  #5 0x0000ffffbf25c880 in start_thread
  #6 0x0000ffffbf1b6b9c in thread_start ()

  (gdb) thread 3
  ...
  (gdb) bt
  #0 0x0000ffffbf11aa20 in __GI___sigtimedwait
  #1 0x0000ffffbf2671b4 in __sigwait
  #2 0x0000aaaaaabd1ddc in sigwait_compat
  #3 0x0000aaaaaabd34c8 in qemu_thread_start
  #4 0x0000ffffbf25c880 in start_thread
  #5 0x0000ffffbf1b6b9c in thread_start

  ----

  (gdb) run
  Starting program: /usr/bin/qemu-img convert -f qcow2 -O qcow2
  ./disk01.ext4.qcow2 ./output.qcow2

  [New Thread 0xffffbec5ad90 (LWP 72839)]
  [New Thread 0xffffbe459d90 (LWP 72840)]
  [New Thread 0xffffbdb57d90 (LWP 72841)]
  [New Thread 0xffffacac9d90 (LWP 72859)]
  [New Thread 0xffffa7ffed90 (LWP 72860)]
  [New Thread 0xffffa77fdd90 (LWP 72861)]
  [New Thread 0xffffa6ffcd90 (LWP 72862)]
  [New Thread 0xffffa67fbd90 (LWP 72863)]
  [New Thread 0xffffa5ffad90 (LWP 72864)]

  [Thread 0xffffa5ffad90 (LWP 72864) exited]
  [Thread 0xffffa6ffcd90 (LWP 72862) exited]
  [Thread 0xffffa77fdd90 (LWP 72861) exited]
  [Thread 0xffffbdb57d90 (LWP 72841) exited]
  [Thread 0xffffa67fbd90 (LWP 72863) exited]
  [Thread 0xffffacac9d90 (LWP 72859) exited]
  [Thread 0xffffa7ffed90 (LWP 72860) exited]

  <HUNG w/ 3 threads in the stack trace showed before>
  """

  All the tasks left are blocked in a system call, so no task left to call
  qemu_futex_wake() to unblock thread #2 (in futex()), which would unblock
  thread #1 (doing poll() in a pipe with thread #2).

  Those 7 threads exit before disk conversion is complete (sometimes in
  the beginning, sometimes at the end).

  ----

  [ Original Description ]

  On the HiSilicon D06 system - a 96 core NUMA arm64 box - qemu-img
  frequently hangs (~50% of the time) with this command:

  qemu-img convert -f qcow2 -O qcow2 /tmp/cloudimg /tmp/cloudimg2

  Where "cloudimg" is a standard qcow2 Ubuntu cloud image. This
  qcow2->qcow2 conversion happens to be something uvtool does every time
  it fetches images.

  Once hung, attaching gdb gives the following backtrace:

  (gdb) bt
  #0  0x0000ffffae4f8154 in __GI_ppoll (fds=3D0xaaaae8a67dc0, nfds=3D187650=
274213760,
  =C2=A0=C2=A0=C2=A0=C2=A0timeout=3D<optimized out>, timeout@entry=3D0x0, s=
igmask=3D0xffffc123b950)
  =C2=A0=C2=A0=C2=A0=C2=A0at ../sysdeps/unix/sysv/linux/ppoll.c:39
  #1  0x0000aaaabbefaf00 in ppoll (__ss=3D0x0, __timeout=3D0x0, __nfds=3D<o=
ptimized out>,
  =C2=A0=C2=A0=C2=A0=C2=A0__fds=3D<optimized out>) at /usr/include/aarch64-=
linux-gnu/bits/poll2.h:77
  #2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>,
  =C2=A0=C2=A0=C2=A0=C2=A0timeout=3Dtimeout@entry=3D-1) at util/qemu-timer.=
c:322
  #3  0x0000aaaabbefbf80 in os_host_main_loop_wait (timeout=3D-1)
  =C2=A0=C2=A0=C2=A0=C2=A0at util/main-loop.c:233
  #4  main_loop_wait (nonblocking=3D<optimized out>) at util/main-loop.c:497
  #5  0x0000aaaabbe2aa30 in convert_do_copy (s=3D0xffffc123bb58) at qemu-im=
g.c:1980
  #6  img_convert (argc=3D<optimized out>, argv=3D<optimized out>) at qemu-=
img.c:2456
  #7  0x0000aaaabbe2333c in main (argc=3D7, argv=3D<optimized out>) at qemu=
-img.c:4975

  Reproduced w/ latest QEMU git (@ 53744e0a182)

To manage notifications about this bug go to:
https://bugs.launchpad.net/kunpeng920/+bug/1805256/+subscriptions

