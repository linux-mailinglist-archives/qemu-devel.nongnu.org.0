Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA56348377
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:13:31 +0100 (CET)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAol-0007l0-0V
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPAmI-0006Oe-F4
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:10:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:50140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPAmG-0005D9-EK
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 17:10:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lPAmE-0001jX-Bj
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 21:10:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 558952E8157
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 21:10:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 21:03:11 -0000
From: Mohamed <1921280@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mohd-akram
X-Launchpad-Bug-Reporter: Mohamed (mohd-akram)
X-Launchpad-Bug-Modifier: Mohamed (mohd-akram)
Message-Id: <161661979202.23519.15513295084745002515.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1921280] [NEW] OpenIndiana stuck in boot loop when using hvf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 7ccb29bc75406aa5eeb545e50895659d01acb545
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
Reply-To: Bug 1921280 <1921280@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I'm using QEMU version 5.2.0 on macOS, and running the "OpenIndiana
Hipster 2020.10 Text Install DVD (64-bit x86)" ISO:

qemu-system-x86_64 -cdrom ~/Downloads/OI-hipster-text-20201031.iso -m
2048 -accel hvf -cpu host

It gets to "Booting...", stays there for a bit, and then restarts.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921280

Title:
  OpenIndiana stuck in boot loop when using hvf

Status in QEMU:
  New

Bug description:
  I'm using QEMU version 5.2.0 on macOS, and running the "OpenIndiana
  Hipster 2020.10 Text Install DVD (64-bit x86)" ISO:

  qemu-system-x86_64 -cdrom ~/Downloads/OI-hipster-text-20201031.iso -m
  2048 -accel hvf -cpu host

  It gets to "Booting...", stays there for a bit, and then restarts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921280/+subscriptions

