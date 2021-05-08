Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59734377013
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:27:40 +0200 (CEST)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGR8-0001GG-WC
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKQ-0003XO-3P
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:55018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGKM-000055-8w
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:20:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGKL-0000Np-1w
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0D74F2E8135
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:11:22 -0000
From: Thomas Huth <1893634@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth tom-ty89
X-Launchpad-Bug-Reporter: Tom Yan (tom-ty89)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159886949002.28151.4021199873744523881.malonedeb@soybean.canonical.com>
Message-Id: <162045428271.6448.18249214190554614892.malone@gac.canonical.com>
Subject: [Bug 1893634] Re: blk_get_max_transfer() works only with sg
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: dbce5cd61df30565fea3525923206d2e31d6184e
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
Reply-To: Bug 1893634 <1893634@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1893634

Title:
  blk_get_max_transfer() works only with sg

Status in QEMU:
  Incomplete

Bug description:
  blk_get_max_transfer() is supposed to be able to get the max_sectors
  queue limit of the scsi device on the host side and is used in both
  scsi-generic.c (for scsi-generic and scsi-block) and scsi-disk.c (for
  scsi-hd) to set/change the max_xfer_len (and opt_xfer_len in the case
  of scsi-generic.c).

  However, it only works with the sg driver in doing so. It cannot get
  the queue limit with the sd driver and simply returns MAX_INT.

  qemu version 5.1.0
  kernel version 5.8.5

  Btw, is there a particular reason that it doesn't MIN_NON_ZERO against
  the original max_xfer_len:
  https://github.com/qemu/qemu/blob/v5.1.0/hw/scsi/scsi-generic.c#L172?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893634/+subscriptions

