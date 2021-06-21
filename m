Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDD3AE26E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:32:33 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBbs-000490-Cf
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZH-000804-T7
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:37944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZG-0001aa-2j
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBZE-0003YP-95
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 43F312E808A
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:40 -0000
From: Launchpad Bug Tracker <1378407@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s janitor mjt+launchpad-tls th-huth
X-Launchpad-Bug-Reporter: felix (felix.von.s)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20141007151141.32185.92995.malonedeb@gac.canonical.com>
Message-Id: <162424906054.11837.1812642993006791307.malone@loganberry.canonical.com>
Subject: [Bug 1378407] Re: [feature request] Partition table wrapper for
 single-filesystem images
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: c944f0ac0193e033cfd79e5cf66e9051033dd138
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1378407 <1378407@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1378407

Title:
  [feature request] Partition table wrapper for single-filesystem images

Status in QEMU:
  Expired

Bug description:
  Suppose you have a single filesystem image. It would be nice if QEMU
  could generate a virtual partition table for it and make it available
  to the guest as a partitioned disk. Otherwise you have to use
  workarounds like this:
  wiki.archlinux.org/index.php/QEMU#Simulate_virtual_disk_with_MBR_using_li=
near_RAID

  It should be relatively easy to do on top of existing vvfat code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1378407/+subscriptions

