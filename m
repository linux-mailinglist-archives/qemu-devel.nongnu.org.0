Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B72EEC80
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:30:17 +0100 (CET)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjPk-0006ej-PI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLp-0001Kx-LQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:56018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLb-0003ec-JW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:13 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLY-00045e-0P
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A02E2E8158
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1654826@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: drpastah janitor kraxel-redhat mutedbytes th-huth
X-Launchpad-Bug-Reporter: mutedbytes (mutedbytes)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170108095922.20152.98230.malonedeb@wampee.canonical.com>
Message-Id: <161007943900.27824.2187033596796810393.malone@loganberry.canonical.com>
Subject: [Bug 1654826] Re: Holding key down using input-linux freezes guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 3b7a64c03e01896dea577a47a7895a51a27fec64
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
Reply-To: Bug 1654826 <1654826@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1654826

Title:
  Holding key down using input-linux freezes guest

Status in QEMU:
  Expired

Bug description:
  Qemu release version 2.8.0
  KVM, kernel 4.9.1

  When using the -object input-linux capability in qemu for passthrough
  of input/evdev devices, I found that when a key is held for a few
  seconds or more (such as ctrl key), the guest system freezes until the
  key is released. In some cases, mouse control is also lost following
  one of these "freezes". I also noticed that one of the four cpu cores
  I have the guest pinned to ramps to 100% during these freezes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1654826/+subscriptions

