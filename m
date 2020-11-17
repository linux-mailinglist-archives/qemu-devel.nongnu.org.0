Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205702B5C32
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:51:59 +0100 (CET)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexeY-00089d-0K
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexdo-0007ev-CY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:51:12 -0500
Received: from indium.canonical.com ([91.189.90.7]:52180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexdi-00012F-FP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:51:12 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kexdf-0005YF-N8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:51:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E8DEF2E81E3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:50:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 09:43:37 -0000
From: Thomas Huth <1665789@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phol th-huth
X-Launchpad-Bug-Reporter: Phil Troy (phol)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1022023
References: <20170217213527.4184.5367.malonedeb@chaenomeles.canonical.com>
Message-Id: <160560621800.14520.2920272592184883079.malone@soybean.canonical.com>
Subject: [Bug 1665789] Re: More resolutions for vga displays
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 52e0b892b8e9fd30e71fbf11b57c1cf72af7925b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 04:35:40
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
Reply-To: Bug 1665789 <1665789@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1022023 ***
    https://bugs.launchpad.net/bugs/1022023

I noticed that we have multiple tickets for more resolutions opened.
Let's consolidate all in https://bugs.launchpad.net/qemu/+bug/1022023
and close this one here as duplicate.

** This bug has been marked a duplicate of bug 1022023
   vga/std lacks few wide screen modes.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1665789

Title:
  More resolutions for vga displays

Status in QEMU:
  New

Bug description:
  Would it be possible to add more resolutions for vga displays (which I
  am accessing via vnc instead of spice)?  In particular:

  - 1080 wide x 1920 high (rotate 1920 x 1080 screen)

  - 1920 wide x 1080 + 1980 high (1920 x 1080 screen on top of 1600 x
  900 screen)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1665789/+subscriptions

