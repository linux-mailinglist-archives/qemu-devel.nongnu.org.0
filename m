Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F4D472A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 20:05:09 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIzHo-0006cU-Ih
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 14:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iIzDs-00043Z-Ru
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 14:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iIzDp-0000b8-4E
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 14:01:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:39562)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iIzDo-0000Zi-U7
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 14:01:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iIzDn-00060S-0u
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 18:00:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 03B5F2E80C7
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 18:00:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Oct 2019 17:55:36 -0000
From: dann frazier <dann.frazier@canonical.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=kunpeng920; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rafaeldtinoco@kernelpath.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=In Progress; importance=Medium; assignee=rafaeldtinoco@kernelpath.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=bionic; sourcepackage=qemu; 
 component=main; status=New; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=disco; sourcepackage=qemu; 
 component=main; status=New; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=eoan; sourcepackage=qemu;
 component=main; status=In Progress; importance=Medium;
 assignee=rafaeldtinoco@kernelpath.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=ff-series;
 sourcepackage=qemu; component=None; status=New; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dannf jan-glauber-i jnsnow lizhengui rafaeldtinoco
X-Launchpad-Bug-Reporter: dann frazier (dannf)
X-Launchpad-Bug-Modifier: dann frazier (dannf)
References: <154327283728.15443.11625169757714443608.malonedeb@soybean.canonical.com>
 <20191011082954.GA10493@hc>
Message-Id: <20191011175536.GB25464@xps13.dannf>
Subject: [Bug 1805256] Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2
 possible issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="af2eefe214bd95389a09b7c956720881bab16807";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a88a00f130f18559a7be3c18a21d7f606269868d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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

On Fri, Oct 11, 2019 at 08:30:02AM +0000, Jan Glauber wrote:
> On Fri, Oct 11, 2019 at 10:18:18AM +0200, Paolo Bonzini wrote:
> > On 11/10/19 08:05, Jan Glauber wrote:
> > > On Wed, Oct 09, 2019 at 11:15:04AM +0200, Paolo Bonzini wrote:
> > >>> ...but if I bump notify_me size to uint64_t the issue goes away.
> > >>
> > >> Ouch. :)  Is this with or without my patch(es)?
> > =

> > You didn't answer this question.
> =

> Oh, sorry... I did but the mail probably didn't make it out.
> I have both of your changes applied (as I think they make sense).
> =

> > >> Also, what if you just add a dummy uint32_t after notify_me?
> > > =

> > > With the dummy the testcase also runs fine for 500 iterations.
> > =

> > You might be lucky and causing list_lock to be in another cache line.
> > What if you add __attribute__((aligned(16)) to notify_me (and keep the
> > dummy)?
> =

> Good point. I'll try to force both into the same cacheline.

On the Hi1620, this still hangs in the first iteration:

diff --git a/include/block/aio.h b/include/block/aio.h
index 6b0d52f732..00e56a5412 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -82,7 +82,7 @@ struct AioContext {
      * Instead, the aio_poll calls include both the prepare and the
      * dispatch phase, hence a simple counter is enough for them.
      */
-    uint32_t notify_me;
+    __attribute__((aligned(16))) uint64_t notify_me;
 =

     /* A lock to protect between QEMUBH and AioHandler adders and deleter,
      * and to ensure that no callbacks are removed while we're walking and
diff --git a/util/async.c b/util/async.c
index ca83e32c7f..024c4c567d 100644
--- a/util/async.c
+++ b/util/async.c
@@ -242,7 +242,7 @@ aio_ctx_check(GSource *source)
     aio_notify_accept(ctx);
 =

     for (bh =3D ctx->first_bh; bh; bh =3D bh->next) {
-        if (bh->scheduled) {
+        if (atomic_mb_read(&bh->scheduled)) {
             return true;
         }
     }
@@ -342,12 +342,12 @@ LinuxAioState *aio_get_linux_aio(AioContext *ctx)
 =

 void aio_notify(AioContext *ctx)
 {
-    /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
-     * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
+    /* Using atomic_mb_read ensures that e.g. bh->scheduled is written bef=
ore
+     * ctx->notify_me is read.  Pairs with atomic_or in aio_ctx_prepare or
+     * atomic_add in aio_poll.
      */
-    smp_mb();
-    if (ctx->notify_me) {
-        event_notifier_set(&ctx->notifier);
+    if (atomic_mb_read(&ctx->notify_me)) {
+	event_notifier_set(&ctx->notifier);
         atomic_mb_set(&ctx->notified, true);
     }
 }

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1805256

Title:
  qemu-img hangs on rcu_call_ready_event logic in Aarch64 when
  converting images

Status in kunpeng920:
  New
Status in QEMU:
  In Progress
Status in qemu package in Ubuntu:
  In Progress
Status in qemu source package in Bionic:
  New
Status in qemu source package in Disco:
  New
Status in qemu source package in Eoan:
  In Progress
Status in qemu source package in FF-Series:
  New

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

