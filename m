Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01F1FA0CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:51:24 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkv8d-0007OW-3f
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jkv7u-0006zg-ED
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jkv7s-0008GS-BL
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:50:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jkv7q-00041V-Pe
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 19:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C0C132E8052
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 19:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2020 19:41:43 -0000
From: Randy Rhoads <1883593@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: randy3
X-Launchpad-Bug-Reporter: Randy Rhoads (randy3)
X-Launchpad-Bug-Modifier: Randy Rhoads (randy3)
Message-Id: <159225010396.5666.14857392307926027696.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1883593] [NEW] Windows XP takes much longer to boot in TCG mode
 since 5.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ac28ef7896faf76bf545827ad0bc79a097f5d94d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:50:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1883593 <1883593@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Since upgrading from 4.2 to 5.0, a Windows XP VM takes much longer to
boot.

It hangs about three minutes on "welcome" screen with the blue
background, while previously the total boot time was less than a minute.

The issue only happens in TCG mode (not with KVM) and also happens with
the current master which includes the uring patches (7d3660e7).

I can reproduce this issue with a clean XP install with no flags other
than `-m 2G`. After booting, the performance seems to be normal.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883593

Title:
  Windows XP takes much longer to boot in TCG mode since 5.0

Status in QEMU:
  New

Bug description:
  Since upgrading from 4.2 to 5.0, a Windows XP VM takes much longer to
  boot.

  It hangs about three minutes on "welcome" screen with the blue
  background, while previously the total boot time was less than a
  minute.

  The issue only happens in TCG mode (not with KVM) and also happens
  with the current master which includes the uring patches (7d3660e7).

  I can reproduce this issue with a clean XP install with no flags other
  than `-m 2G`. After booting, the performance seems to be normal.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883593/+subscriptions

