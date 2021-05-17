Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1270383D46
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:27:51 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiu6-0003oL-Td
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liiiQ-0006du-TD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:15:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:55226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liiiM-0005w5-US
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:15:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liiiK-0000A1-As
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C860E2E819C
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 19:07:37 -0000
From: Thomas Huth <1886306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159394034007.15406.6510283150709649853.malonedeb@soybean.canonical.com>
Message-Id: <162127845799.1070.8645242894967318698.malone@wampee.canonical.com>
Subject: [Bug 1886306] Re: qemu running slow when the window is in background
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 010ae2aecff9b6985b424924160266bfbc6fa216
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
Reply-To: Bug 1886306 <1886306@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think there is quite a bit of information missing here? Which host OS
/ distribution are we talking about here? Which parameters were used for
"configure"? Which QEMU version has been used? Is it still reproducible
with the latest version? ... thus I wonder whether this should get
closed, or whether it's worth the effort to move this to the new tracker
at Gitlab?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886306

Title:
  qemu running slow when the window is in background

Status in QEMU:
  Incomplete

Bug description:
  Reported by <jedinix> on IRC:

  QEMU almost freezes when running with `GDK_BACKEND=3Dx11` set and the
  parameter `gl=3Don` added to the `-display` option.

  GDK_BACKEND=3Dx11 qemu-system-x86_64 -nodefaults -no-user-config
  -enable-kvm -machine q35 -cpu host -m 4G -display gtk,gl=3Don -vga std
  -usb -device usb-kbd -drive
  file=3D/tmp/Win10.qcow2,media=3Ddisk,format=3Dqcow2 -drive
  file=3D~/Downloads/Win10_2004_EnglishInternational_x64.iso,media=3Dcdrom

  Leaving out `GDK_BACKEND=3Dx11` or `gl=3Don` fixes the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886306/+subscriptions

