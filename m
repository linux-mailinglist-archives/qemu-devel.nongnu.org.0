Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AD171F2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 08:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOGVc-00037I-V8
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 02:56:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hOGUc-0002qY-Mp
	for qemu-devel@nongnu.org; Wed, 08 May 2019 02:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hOGUb-00047u-23
	for qemu-devel@nongnu.org; Wed, 08 May 2019 02:55:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:37522)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hOGUa-00044L-SH
	for qemu-devel@nongnu.org; Wed, 08 May 2019 02:55:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hOGUZ-0001c4-5L
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 06:55:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 2179D2E80CF
	for <qemu-devel@nongnu.org>; Wed,  8 May 2019 06:55:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 May 2019 06:49:10 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1823458@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=cloud-archive; status=Fix Released;
	importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=cloud-archive; productseries=mitaka;
	status=Fix Committed; importance=Medium; assignee=None; 
X-Launchpad-Bug: product=cloud-archive; productseries=ocata;
	status=Fix Committed; importance=Medium; assignee=None; 
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
	status=Fix Released; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=trusty; sourcepackage=qemu; 
	component=main; status=Won't Fix; importance=Medium;
	assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=xenial; sourcepackage=qemu; 
	component=main; status=Incomplete; importance=Medium;
	assignee=dan.streetman@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=bionic; sourcepackage=qemu; 
	component=main; status=Fix Released; importance=Medium;
	assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=cosmic; sourcepackage=qemu; 
	component=main; status=Fix Released; importance=Medium;
	assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=disco; sourcepackage=qemu; 
	component=main; status=Fix Released; importance=Medium;
	assignee=None; 
X-Launchpad-Bug-Tags: verification-done verification-done-xenial
	verification-mitaka-done verification-ocata-done
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brian-murray corey.bryant ddstreet paelzer racb
	sil2100
X-Launchpad-Bug-Reporter: Dan Streetman (ddstreet)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
	=?utf-8?q?=29?=
References: <155455149397.14414.11595397789908732027.malonedeb@gac.canonical.com>
	<155725721976.31028.5727310486810919284.malone@soybean.canonical.com>
Message-Id: <CAATJJ0KGMdau4b+nenNOOA4J1WW4+vn7-eo8ePYt1zQ=5tpLnw@mail.gmail.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18958";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 8ff27e638e8852c0165b0cd8ec049f408c5c413e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1823458] Re: race condition between
 vhost_net_stop and CHR_EVENT_CLOSED on shutdown crashes qemu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1823458 <1823458@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @cpaelzer, if you have any suggestions for specific tests/configurations
> that might be good to test the specific code changed here, please let me
> know.

I have ran the few test that would cover that area in the past on PPAs alre=
ady.
Unfortunately this is a very specific path and I don't have much more
tests for it.

If anything comes to my mind it would be loops of attaching/detaching
extra interfaces to guests and try some traffic on them.
And every now and then in between supend/resume the or shutdown/start
the guest again.
Like:
repeat forever
   start or resume
        repeat ~20 times
          add network device
          check network device to work
   shutdown or suspend
This should cover a lot of paths that your change might have affected.
/me hopes that indents will be retained by LP

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1823458

Title:
  race condition between vhost_net_stop and CHR_EVENT_CLOSED on shutdown
  crashes qemu

Status in Ubuntu Cloud Archive:
  Fix Released
Status in Ubuntu Cloud Archive mitaka series:
  Fix Committed
Status in Ubuntu Cloud Archive ocata series:
  Fix Committed
Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Trusty:
  Won't Fix
Status in qemu source package in Xenial:
  Incomplete
Status in qemu source package in Bionic:
  Fix Released
Status in qemu source package in Cosmic:
  Fix Released
Status in qemu source package in Disco:
  Fix Released

Bug description:
  [impact]

  on shutdown of a guest, there is a race condition that results in qemu
  crashing instead of normally shutting down.  The bt looks similar to
  this (depending on the specific version of qemu, of course; this is
  taken from 2.5 version of qemu):

  (gdb) bt
  #0  __GI___pthread_mutex_lock (mutex=3D0x0) at ../nptl/pthread_mutex_lock=
.c:66
  #1  0x00005636c0bc4389 in qemu_mutex_lock (mutex=3Dmutex@entry=3D0x0) at =
/build/qemu-7I4i1R/qemu-2.5+dfsg/util/qemu-thread-posix.c:73
  #2  0x00005636c0988130 in qemu_chr_fe_write_all (s=3Ds@entry=3D0x0, buf=
=3Dbuf@entry=3D0x7ffe65c086a0 "\v", len=3Dlen@entry=3D20) at /build/qemu-7I=
4i1R/qemu-2.5+dfsg/qemu-char.c:205
  #3  0x00005636c08f3483 in vhost_user_write (msg=3Dmsg@entry=3D0x7ffe65c08=
6a0, fds=3Dfds@entry=3D0x0, fd_num=3Dfd_num@entry=3D0, dev=3D0x5636c1bf6b70=
, dev=3D0x5636c1bf6b70)
  =C2=A0=C2=A0=C2=A0=C2=A0at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/virtio/vho=
st-user.c:195
  #4  0x00005636c08f411c in vhost_user_get_vring_base (dev=3D0x5636c1bf6b70=
, ring=3D0x7ffe65c087e0) at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/virtio/vhos=
t-user.c:364
  #5  0x00005636c08efff0 in vhost_virtqueue_stop (dev=3Ddev@entry=3D0x5636c=
1bf6b70, vdev=3Dvdev@entry=3D0x5636c2853338, vq=3D0x5636c1bf6d00, idx=3D1) =
at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/virtio/vhost.c:895
  #6  0x00005636c08f2944 in vhost_dev_stop (hdev=3Dhdev@entry=3D0x5636c1bf6=
b70, vdev=3Dvdev@entry=3D0x5636c2853338) at /build/qemu-7I4i1R/qemu-2.5+dfs=
g/hw/virtio/vhost.c:1262
  #7  0x00005636c08db2a8 in vhost_net_stop_one (net=3D0x5636c1bf6b70, dev=
=3Ddev@entry=3D0x5636c2853338) at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/net/v=
host_net.c:293
  #8  0x00005636c08dbe5b in vhost_net_stop (dev=3Ddev@entry=3D0x5636c285333=
8, ncs=3D0x5636c209d110, total_queues=3Dtotal_queues@entry=3D1) at /build/q=
emu-7I4i1R/qemu-2.5+dfsg/hw/net/vhost_net.c:371
  #9  0x00005636c08d7745 in virtio_net_vhost_status (status=3D7 '\a', n=3D0=
x5636c2853338) at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/net/virtio-net.c:150
  #10 virtio_net_set_status (vdev=3D<optimized out>, status=3D<optimized ou=
t>) at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/net/virtio-net.c:162
  #11 0x00005636c08ec42c in virtio_set_status (vdev=3D0x5636c2853338, val=
=3D<optimized out>) at /build/qemu-7I4i1R/qemu-2.5+dfsg/hw/virtio/virtio.c:=
624
  #12 0x00005636c098fed2 in vm_state_notify (running=3Drunning@entry=3D0, s=
tate=3Dstate@entry=3DRUN_STATE_SHUTDOWN) at /build/qemu-7I4i1R/qemu-2.5+dfs=
g/vl.c:1605
  #13 0x00005636c089172a in do_vm_stop (state=3DRUN_STATE_SHUTDOWN) at /bui=
ld/qemu-7I4i1R/qemu-2.5+dfsg/cpus.c:724
  #14 vm_stop (state=3DRUN_STATE_SHUTDOWN) at /build/qemu-7I4i1R/qemu-2.5+d=
fsg/cpus.c:1407
  #15 0x00005636c085d240 in main_loop_should_exit () at /build/qemu-7I4i1R/=
qemu-2.5+dfsg/vl.c:1883
  #16 main_loop () at /build/qemu-7I4i1R/qemu-2.5+dfsg/vl.c:1931
  #17 main (argc=3D<optimized out>, argv=3D<optimized out>, envp=3D<optimiz=
ed out>) at /build/qemu-7I4i1R/qemu-2.5+dfsg/vl.c:4683

  [test case]

  unfortunately since this is a race condition, it's very hard to
  arbitrarily reproduce; it depends very much on the overall
  configuration of the guest as well as how exactly it's shut down -
  specifically, its vhost user net must be closed from the host side at
  a specific time during qemu shutdown.

  I have someone with such a setup who has reported to me their setup is
  able to reproduce this reliably, but the config is too complex for me
  to reproduce so I have relied on their reproduction and testing to
  debug and craft the patch for this.

  [regression potential]

  the change adds a flag to prevent repeated calls to vhost_net_stop().
  This also prevents any calls to vhost_net_cleanup() from
  net_vhost_user_event().  Any regression would be seen when stopping
  and/or cleaning up a vhost net.  Regressions might include failure to
  hot-remove a vhost net from a guest, or failure to cleanup (i.e. mem
  leak), or crashes during cleanup or stopping a vhost net.

  [other info]

  this was originally seen in the 2.5 version of qemu - specifically,
  the UCA version in trusty-mitaka (which uses the xenial qemu
  codebase).

  After discussion upstream, it appears this was fixed upstream by
  commit e7c83a885f8, which is included starting in version 2.9.
  However, this commit depends on at least commit 5345fdb4467, and
  likely more other previous commits, which make widespread code changes
  and are unsuitable to backport.  Therefore this seems like it should
  be specifically worked around in the Xenial qemu codebase.

  =

  The specific race condition for this (in the qemu 2.5 code version) is:

  as shown in above bt, thread A starts shutting down qemu, e.g.:

  vm_stop->do_vm_stop->vm_state_notify
  =C2=A0=C2=A0virtio_set_status
  =C2=A0=C2=A0=C2=A0=C2=A0virtio_net_set_status
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0virtio_net_vhost_status

  in this function, code gets to an if-else check for
  (!n->vhost_started), which is false (i.e. vhost_started is true) and
  enters the else code block, which calls vhost_net_stop() and then sets
  n->vhost_started to false.

  While thread A is inside vhost_net_stop(), thread B is triggered by
  the vhost net chr handler with a user event and calls:

  net_vhost_user_event
  =C2=A0=C2=A0qmp_set_link (from case CHR_EVENT_CLOSED)
  =C2=A0=C2=A0=C2=A0=C2=A0virtio_net_set_link_status (via ->link_status_cha=
nged)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0virtio_net_set_status
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0virtio_net_vhost_status

  notice thread B has now reached the same function that thread A is in;
  since the checks in the function have not changed, thread B follows
  the same path that thread A followed, and enters vhost_net_stop().

  Since thread A has already shut down and cleaned up some of the
  internals, once thread B starts trying to also clean up things, it
  segfaults as the shown in the bt.

  Avoiding only this duplicate call to vhost_net_stop() is required, but
  not enough - let's continue to look at what thread B does after its
  call to qmp_set_link() returns:

  net_vhost_user_event
  =C2=A0=C2=A0vhost_user_stop
  =C2=A0=C2=A0=C2=A0=C2=A0vhost_net_cleanup
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vhost_dev_cleanup

  However, in main() qemu registers atexit(net_cleanup()), which does:
  net_cleanup
  =C2=A0=C2=A0qemu_del_nic (or qemu_del_net_client, depending on ->type)
  =C2=A0=C2=A0=C2=A0=C2=A0qemu_cleanup_net_client
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vhost_user_cleanup (via ->cleanup)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vhost_net_cleanup
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vhost_dev_cle=
anup

  and the duplicate vhost_dev_cleanup fails assertions since things were
  already cleaned up.  Additionally, if thread B's call to
  vhost_dev_cleanup() comes before thread A finishes vhost_net_stop(),
  then that will call vhost_dev_stop() and vhost_disable_notifiers()
  which both try to access things that have been freed/cleared/disabled
  by vhost_dev_cleanup().

To manage notifications about this bug go to:
https://bugs.launchpad.net/cloud-archive/+bug/1823458/+subscriptions

