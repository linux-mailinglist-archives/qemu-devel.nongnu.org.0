Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6A2ADDB3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:03:50 +0100 (CET)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXzh-0004nV-N9
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXxw-0003le-8j
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:02:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:42086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcXxp-0001W7-9o
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:01:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcXxl-0000K7-71
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:01:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3448B2E8133
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:01:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 17:50:32 -0000
From: Thomas Huth <1732177@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: netrolller-3d th-huth
X-Launchpad-Bug-Reporter: Googulator (netrolller-3d)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151066478781.7464.15116659457637721936.malonedeb@soybean.canonical.com>
Message-Id: <160503063284.27550.5840546961594630123.malone@chaenomeles.canonical.com>
Subject: [Bug 1732177] Re: SBSA ACS test freezes inside qemu-system-aarch64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: c80d2d45a4108716020a59822897c228d53e57a2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Which version of QEMU did you test? Does it work better with the latest
version of QEMU now?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1732177

Title:
  SBSA ACS test freezes inside qemu-system-aarch64

Status in QEMU:
  Incomplete

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

