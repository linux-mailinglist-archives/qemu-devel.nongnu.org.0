Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BA3817AC
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:35:47 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhre6-0001C7-Pz
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZT-0004Ef-DU
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:30:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrZR-0006Do-1p
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:30:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhrZO-0004OG-Nc
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66B3C2E8186
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:23:06 -0000
From: Thomas Huth <1923583@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: meeho th-huth
X-Launchpad-Bug-Reporter: meeho yuen (meeho)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161830261172.29345.7866671962411605196.malonedeb@wampee.canonical.com>
Message-Id: <162107418648.20814.16895064246248620407.malone@soybean.canonical.com>
Subject: [Bug 1923583] Re: colo: pvm flush failed after svm killed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: ed20e4ef735f14c6e6ff9c63235f6a97b1d46a14
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1923583 <1923583@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923583

Title:
  colo: pvm flush failed after svm killed

Status in QEMU:
  Incomplete

Bug description:
  Hi,
     Primary vm flush failed after killing svm, which leads primary vm gues=
t filesystem unavailable.

  qemu versoin: 5.2.0
  host/guest os: CentOS Linux release 7.6.1810 (Core)

  Reproduce steps:
  1. create colo vm following https://github.com/qemu/qemu/blob/master/docs=
/COLO-FT.txt
  2. kill secondary vm (don't remove nbd child from quorum on primary vm)an=
d wait for a minute. the interval depends on guest os.
  result: primary vm file system shutdown because of flush cache error.

  After serveral tests, I found that qemu-5.0.0 worked well, and it's
  the commit
  https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D883833e29cb800b4d92b5d4=
736252f4004885191(block:
  Flush all children in generic code) leads this change, and both
  virtio-blk and ide turned out to be bad.

  I think it's nbd(replication) flush failed leads bdrv_co_flush(quorum_bs)=
 failed, here is the call stack.
  #0  bdrv_co_flush (bs=3D0x56242b3cc0b0=3Dnbd_bs) at ../block/io.c:2856
  #1  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242b3c7e00=3Dreplicatio=
n_bs) at ../block/io.c:2920
  #2  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242a4ad800=3Dquorum_bs)=
 at ../block/io.c:2920
  #3  0x0000562428b70d56 in blk_do_flush (blk=3D0x56242a4ad4a0) at ../block=
/block-backend.c:1672
  #4  0x0000562428b70d87 in blk_aio_flush_entry (opaque=3D0x7fd0980073f0) a=
t ../block/block-backend.c:1680
  #5  0x0000562428c5f9a7 in coroutine_trampoline (i0=3D-1409269904, i1=3D32=
721) at ../util/coroutine-ucontext.c:173

  While i am not sure whether i use colo inproperly? Can we assume that
  nbd child of quorum immediately removed right after svm crashed? Or
  it's really a bug? Does the following patch fix? Help is needed!
  Thanks a lot=EF=BC=81

  diff --git a/block/quorum.c b/block/quorum.c
  index cfc1436..f2c0805 100644
  --- a/block/quorum.c
  +++ b/block/quorum.c
  @@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
       .bdrv_dirname                       =3D quorum_dirname,
       .bdrv_co_block_status               =3D quorum_co_block_status,
   =

  -    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
  +    .bdrv_co_flush                      =3D quorum_co_flush,
   =

       .bdrv_getlength                     =3D quorum_getlength,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923583/+subscriptions

