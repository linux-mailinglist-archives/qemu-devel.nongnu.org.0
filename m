Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC983AFC40
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:53:18 +0200 (CEST)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYPV-0004ZP-4L
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzm-0007gK-Tp
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzi-00059t-B5
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzU-00016C-9p
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E63DE2E81A0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:20 -0000
From: Launchpad Bug Tracker <1836855@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lizhengui stefanha th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?6LSe6LS15p2OIChsaXpoZW5ndWkp?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156335163555.1137.2433837611161042870.malonedeb@gac.canonical.com>
Message-Id: <162433550114.20423.17550713536071972787.malone@loganberry.canonical.com>
Subject: [Bug 1836855] Re: virtio_scsi_ctx_check failed when detach
 virtio_scsi disk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 3ea1be6668dcb7c08893a2eb3a2a20a402f8a455
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836855

Title:
  virtio_scsi_ctx_check failed when detach virtio_scsi disk

Status in QEMU:
  Expired

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

