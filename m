Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8D3A2D40
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:41:03 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKve-0003cv-Hk
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrKqe-0001e7-Ik
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:44304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrKqY-0005de-7n
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrKqT-0000WF-Sx
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:35:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AE4EF2E8169
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:35:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 13:27:48 -0000
From: Peter Maydell <1883593@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee randy3 th-huth
X-Launchpad-Bug-Reporter: Randy Rhoads (randy3)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <159225010396.5666.14857392307926027696.malonedeb@chaenomeles.canonical.com>
Message-Id: <162333166946.32239.11583996512832389816.launchpad@soybean.canonical.com>
Subject: [Bug 1883593] Re: Windows XP takes much longer to boot in TCG mode
 since 5.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 46d0f9f6fa0d781645998c3f24cf8f6323f34c67
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
Reply-To: Bug 1883593 <1883593@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

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

