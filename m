Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850853A2DAF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:05:25 +0200 (CEST)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLJE-00018j-I9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrLFj-000570-7K
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:01:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:53560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrLFg-0005bf-S7
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:01:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrLFb-0006uC-W8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:01:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E30972E831A
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:01:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 13:53:52 -0000
From: Thomas Huth <1883593@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee randy3 th-huth
X-Launchpad-Bug-Reporter: Randy Rhoads (randy3)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159225010396.5666.14857392307926027696.malonedeb@chaenomeles.canonical.com>
Message-Id: <162333323220.6921.5304754014446347985.malone@chaenomeles.canonical.com>
Subject: [Bug 1883593] Re: Windows XP takes much longer to boot in TCG mode
 since 5.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: b89ddaa5f04d0c6500b0ab1c42785a41a9e82590
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/404


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #404
   https://gitlab.com/qemu-project/qemu/-/issues/404

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883593

Title:
  Windows XP takes much longer to boot in TCG mode since 5.0

Status in QEMU:
  Expired

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

