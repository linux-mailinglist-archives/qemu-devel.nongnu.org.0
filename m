Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC92F906F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 05:27:15 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0zej-00065R-Bk
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 23:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0zdy-0005fc-8q
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 23:26:27 -0500
Received: from indium.canonical.com ([91.189.90.7]:37062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0zdw-0005Rp-Aj
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 23:26:26 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0zds-0001gq-8J
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 04:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 006A72E8148
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 04:26:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 Jan 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1681688@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jemmy858585 kwolf-redhat th-huth
X-Launchpad-Bug-Reporter: Lidong Chen (jemmy858585)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170411080154.12474.20009.malonedeb@gac.canonical.com>
Message-Id: <161085704049.5995.11038561842001391325.malone@loganberry.canonical.com>
Subject: [Bug 1681688] Re: qemu live migration failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 97a0144db2e86b77113619ff38db4a35cf24a309
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
Reply-To: Bug 1681688 <1681688@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681688

Title:
  qemu live migration failed

Status in QEMU:
  Expired

Bug description:
  qemu live migration failed

  the dest qemu report this error.

  Receiving block device images
  Completed 0 %^Mqemu-system-x86_64: block/io.c:1348: bdrv_aligned_pwritev:=
 Assertion `child->perm & BLK_PERM_WRITE' failed.

  this bug is caused by this patch:
  http://git.qemu-project.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd35ff5e6b3aa3a70=
6b0aa3bcf11400fac945b67a

  rollback this commit, the problem solved.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681688/+subscriptions

