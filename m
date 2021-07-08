Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D73BF4C8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:31:30 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LhB-0002iE-1P
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbs-0005Qo-3W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:57948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1Lbq-0003Ji-B6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:25:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1Lbm-0000mS-CQ
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 562282E80BA
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 04:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Jul 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1893634@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth tom-ty89
X-Launchpad-Bug-Reporter: Tom Yan (tom-ty89)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159886949002.28151.4021199873744523881.malonedeb@soybean.canonical.com>
Message-Id: <162571784915.7916.4519051115049989698.malone@loganberry.canonical.com>
Subject: [Bug 1893634] Re: blk_get_max_transfer() works only with sg
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 0fb80e1db02a1e1174d0a831cb236b0be79c0798
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
Reply-To: Bug 1893634 <1893634@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893634

Title:
  blk_get_max_transfer() works only with sg

Status in QEMU:
  Expired

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

