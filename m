Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032062F051E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:33:46 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySQE-0001ZG-0x
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIx-0007uD-Qp
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:40710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIv-0000iN-U4
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIk-0000Ch-DA
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 546BD2E8144
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:40 -0000
From: Launchpad Bug Tracker <1732177@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor netrolller-3d th-huth
X-Launchpad-Bug-Reporter: Googulator (netrolller-3d)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151066478781.7464.15116659457637721936.malonedeb@soybean.canonical.com>
Message-Id: <161025226019.18863.6230570356323293214.malone@loganberry.canonical.com>
Subject: [Bug 1732177] Re: SBSA ACS test freezes inside qemu-system-aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 0d19f806751186101b408c6900d03c065c2b8235
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
Reply-To: Bug 1732177 <1732177@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1732177

Title:
  SBSA ACS test freezes inside qemu-system-aarch64

Status in QEMU:
  Expired

Bug description:
  In an effort to get Windows 10 for ARM64 (which is supposed to boot on
  SBSA/SBBR-compliant platforms) to boot inside qemu, I tried to run the
  SBSA ACS test suite. I used the UEFI image from the latest Linaro
  snapshot, and built the SBSA ACS UEFI application from
  https://github.com/ARM-software/sbsa-acs myself using a Linaro aarch64
  compiler.

  Test #8 causes an infinite exception loop, as the exception vectors
  themselves somehow become inaccessible, and accessing them triggers
  another exception to be handled by the same vector. (With some older
  Linaro UEFI images, the hard lockup is avoided, and the SBSA UEFI app
  crashes instead.) If I disable that test, the testsuite locks up in
  other tests in very similar ways. We aren't even able to get a
  pass/fail score from the app because of this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1732177/+subscriptions

