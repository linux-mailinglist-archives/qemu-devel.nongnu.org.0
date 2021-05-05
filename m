Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2337364B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:31:30 +0200 (CEST)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCwL-0005FU-VD
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrN-0008Cl-AU
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrJ-0006IU-Sk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leCrI-00047z-IY
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8B3A72E8188
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 08:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:17:50 -0000
From: Thomas Huth <1696180@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: glusterfs libgfapi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth ziemowit
X-Launchpad-Bug-Reporter: Ziemowit Pierzycki (ziemowit)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149676875833.612.2775062648799367879.malonedeb@chaenomeles.canonical.com>
Message-Id: <162020267091.3632.5304015202230474632.malone@gac.canonical.com>
Subject: [Bug 1696180] Re: Issues with qemu-img, libgfapi,
 and encryption at rest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 8c168ced4f74d85f068394402e1cecbaf071fe28
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
Reply-To: Bug 1696180 <1696180@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/145


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #145
   https://gitlab.com/qemu-project/qemu/-/issues/145

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1696180

Title:
  Issues with qemu-img, libgfapi, and encryption at rest

Status in QEMU:
  Expired

Bug description:
  Hi,

  Encryption-at-rest has been supported for some time now.  The client
  is responsible for encrypting the files with a help of a master key
  file.  I have a properly setup environment and everything appears to
  be working fine but when I use qemu-img to move a file to gluster I
  get the following:

  =

  # qemu-img convert -f raw -O raw linux.iso gluster://gluster01/virt0/linu=
x.raw
  [2017-06-06 16:52:25.489720] E [mem-pool.c:579:mem_put] (-->/lib64/libglu=
sterfs.so.0(syncop_lookup+0x4e5) [0x7f30f7a36d35] -->/lib64/libglusterfs.so=
.0(+0x59f02) [0x7f30f7a32f02] -->/lib64/libglusterfs.so.0(mem_put+0x190) [0=
x7f30f7a24a60] ) 0-mem-pool: mem-pool ptr is NULL
  [2017-06-06 16:52:25.490778] E [mem-pool.c:579:mem_put] (-->/lib64/libglu=
sterfs.so.0(syncop_lookup+0x4e5) [0x7f30f7a36d35] -->/lib64/libglusterfs.so=
.0(+0x59f02) [0x7f30f7a32f02] -->/lib64/libglusterfs.so.0(mem_put+0x190) [0=
x7f30f7a24a60] ) 0-mem-pool: mem-pool ptr is NULL
  [2017-06-06 16:52:25.492263] E [mem-pool.c:579:mem_put] (-->/lib64/libglu=
sterfs.so.0(syncop_lookup+0x4e5) [0x7f30f7a36d35] -->/lib64/libglusterfs.so=
.0(+0x59f02) [0x7f30f7a32f02] -->/lib64/libglusterfs.so.0(mem_put+0x190) [0=
x7f30f7a24a60] ) 0-mem-pool: mem-pool ptr is NULL
  [2017-06-06 16:52:25.497226] E [mem-pool.c:579:mem_put] (-->/lib64/libglu=
sterfs.so.0(syncop_create+0x44d) [0x7f30f7a3cf5d] -->/lib64/libglusterfs.so=
.0(+0x59f02) [0x7f30f7a32f02] -->/lib64/libglusterfs.so.0(mem_put+0x190) [0=
x7f30f7a24a60] ) 0-mem-pool: mem-pool ptr is NULL

  On and on until I get this message:

  [2017-06-06 17:00:03.467361] E [MSGID: 108006] [afr-common.c:4409:afr_not=
ify] 0-virt0-replicate-0: All subvolumes are down. Going offline until atle=
ast one of them comes back up.
  [2017-06-06 17:00:03.467442] E [MSGID: 108006] [afr-common.c:4409:afr_not=
ify] 0-virt0-replicate-1: All subvolumes are down. Going offline until atle=
ast one of them comes back up.

  I asked for help assuming it's a problem with glusterfs and was told
  it appears qemu-img's implementation of libgfapi doesn't call the
  xlator function correctly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1696180/+subscriptions

