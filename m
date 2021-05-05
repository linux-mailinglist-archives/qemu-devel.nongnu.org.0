Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4916373DD2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:42:08 +0200 (CEST)
Received: from localhost ([::1]:60962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIj2-0003v1-09
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leId9-00067B-3a
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:36:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leId4-0002Ix-P7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:36:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leId0-000497-7j
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:35:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 498CE2E820E
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 14:35:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 14:28:39 -0000
From: Thomas Huth <1840865@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth yorifang
X-Launchpad-Bug-Reporter: fangying (yorifang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156635483019.23159.9094249492846476541.malonedeb@chaenomeles.canonical.com>
Message-Id: <162022491933.14941.12336887103476761872.malone@soybean.canonical.com>
Subject: [Bug 1840865] Re: qemu crashes when doing iotest on virtio-9p
 filesystem 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 91a524552b0f212d57cd293c846e4d868de00f2c
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
Reply-To: Bug 1840865 <1840865@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/181


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #181
   https://gitlab.com/qemu-project/qemu/-/issues/181

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840865

Title:
  qemu crashes when doing iotest on  virtio-9p filesystem

Status in QEMU:
  Expired

Bug description:
  Qemu crashes when doing avocado-vt test on virtio-9p filesystem.
  This bug can be reproduced running https://github.com/autotest/tp-qemu/bl=
ob/master/qemu/tests/9p.py with the latest qemu-4.0.0.
  The crash stack goes like:

  Program terminated with signal SIGSEGV, Segmentation fault.
  #0  v9fs_mark_fids_unreclaim (pdu=3Dpdu@entry=3D0xaaab00046868, path=3Dpa=
th@entry=3D0xffff851e2fa8)
  =C2=A0=C2=A0=C2=A0=C2=A0at hw/9pfs/9p.c:505
  #1  0x0000aaaae3585acc in v9fs_unlinkat (opaque=3D0xaaab00046868) at hw/9=
pfs/9p.c:2590
  #2  0x0000aaaae3811c10 in coroutine_trampoline (i0=3D<optimized out>, i1=
=3D<optimized out>)
  =C2=A0=C2=A0=C2=A0=C2=A0at util/coroutine-ucontext.c:116
  #3  0x0000ffffa13ddb20 in ?? () from /lib64/libc.so.6
  Backtrace stopped: not enough registers or memory available to unwind fur=
ther

  A segment fault is triggered at hw/9pfs/9p.c line 505

  =C2=A0=C2=A0=C2=A0=C2=A0for (fidp =3D s->fid_list; fidp; fidp =3D fidp->n=
ext) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (fidp->path.size !=3D =
path->size) {     # fidp is invalid
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
ontinue;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}

  (gdb) p path
  $10 =3D (V9fsPath *) 0xffff851e2fa8
  (gdb) p *path
  $11 =3D {size =3D 21, data =3D 0xaaaafed6f420 "./9p_test/p2a1/d0/f1"}
  (gdb) p *fidp
  Cannot access memory at address 0x101010101010101
  (gdb) p *pdu
  $12 =3D {size =3D 19, tag =3D 54, id =3D 76 'L', cancelled =3D 0 '\000', =
complete =3D {entries =3D {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sqh_first =3D 0x0, sqh_last =3D 0xaaa=
b00046870}}, s =3D 0xaaab000454b8, next =3D {
  =C2=A0=C2=A0=C2=A0=C2=A0le_next =3D 0xaaab000467c0, le_prev =3D 0xaaab000=
46f88}, idx =3D 88}
  (gdb)

  Address Sanitizer shows error and saying that there is a heap-use-
  after-free on *fidp*.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840865/+subscriptions

