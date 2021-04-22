Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098B367AE6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:31 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTdW-0004VJ-LK
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZS-0007sW-VQ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZD-0003h8-SY
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTZA-0004IC-J2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:16:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 44FC62E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:16:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:07:43 -0000
From: Thomas Huth <1836855@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lizhengui stefanha th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?6LSe6LS15p2OIChsaXpoZW5ndWkp?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156335163555.1137.2433837611161042870.malonedeb@gac.canonical.com>
Message-Id: <161907526406.9461.10018205952966133123.malone@wampee.canonical.com>
Subject: [Bug 1836855] Re: virtio_scsi_ctx_check failed when detach
 virtio_scsi disk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 0b2ef764deeece88d218558132582b31001a047f
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
Reply-To: Bug 1836855 <1836855@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1836855

Title:
  virtio_scsi_ctx_check failed when detach virtio_scsi disk

Status in QEMU:
  Incomplete

Bug description:
  I found a problem  that virtio_scsi_ctx_check  failed when detaching
  virtio_scsi disk.  The  bt is below:

  (gdb) bt
  #0  0x0000ffffb02e1bd0 in raise () from /lib64/libc.so.6
  #1  0x0000ffffb02e2f7c in abort () from /lib64/libc.so.6
  #2  0x0000ffffb02db124 in __assert_fail_base () from /lib64/libc.so.6
  #3  0x0000ffffb02db1a4 in __assert_fail () from /lib64/libc.so.6
  #4  0x00000000004eb9a8 in virtio_scsi_ctx_check (d=3Dd@entry=3D0xc70d790,=
 s=3D<optimized out>, s=3D<optimized out>)
      at /Images/lzg/code/710/qemu-2.8.1/hw/scsi/virtio-scsi.c:243
  #5  0x00000000004ec87c in virtio_scsi_handle_cmd_req_prepare (s=3Ds@entry=
=3D0xd27a7a0, req=3Dreq@entry=3D0xafc4b90)
      at /Images/lzg/code/710/qemu-2.8.1/hw/scsi/virtio-scsi.c:553
  #6  0x00000000004ecc20 in virtio_scsi_handle_cmd_vq (s=3D0xd27a7a0, vq=3D=
0xd283410)
      at /Images/lzg/code/710/qemu-2.8.1/hw/scsi/virtio-scsi.c:588
  #7  0x00000000004eda20 in virtio_scsi_data_plane_handle_cmd (vdev=3D0x0, =
vq=3D0xffffae7a6f98)
      at /Images/lzg/code/710/qemu-2.8.1/hw/scsi/virtio-scsi-dataplane.c:57
  #8  0x0000000000877254 in aio_dispatch (ctx=3D0xac61010) at util/aio-posi=
x.c:323
  #9  0x00000000008773ec in aio_poll (ctx=3D0xac61010, blocking=3Dtrue) at =
util/aio-posix.c:472
  #10 0x00000000005cd7cc in iothread_run (opaque=3D0xac5e4b0) at iothread.c=
:49
  #11 0x000000000087a8b8 in qemu_thread_start (args=3D0xac61360) at util/qe=
mu-thread-posix.c:495
  #12 0x00000000008a04e8 in thread_entry_for_hotfix (pthread_cb=3D0x0) at u=
vp/hotpatch/qemu_hotpatch_helper.c:579
  #13 0x0000ffffb041c8bc in start_thread () from /lib64/libpthread.so.0
  #14 0x0000ffffb0382f8c in thread_start () from /lib64/libc.so.6

  assert(blk_get_aio_context(d->conf.blk) =3D=3D s->ctx)  failed.

  I think this patch
  (https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Da6f230c8d13a7ff3a0=
c7f1097412f44bfd9eff0b)
  introduce this problem.

  commit a6f230c8d13a7ff3a0c7f1097412f44bfd9eff0b  move blockbackend
  back to main AioContext on unplug. It set the AioContext of

  SCSIDevice  to the main AioContex, but s->ctx is still the iothread
  AioContext.  Is this a bug?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836855/+subscriptions

