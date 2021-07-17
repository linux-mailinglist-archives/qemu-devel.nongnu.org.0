Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FB3CC11C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 06:27:30 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4bvF-0000NR-Ea
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 00:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m4btu-0007Tr-36
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 00:26:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:51154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m4bts-0001xL-Mt
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 00:26:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m4btn-0003Ie-Gl
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 77C382E826F
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Jul 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1886306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159394034007.15406.6510283150709649853.malonedeb@soybean.canonical.com>
Message-Id: <162649544820.15253.12562878104880218493.malone@loganberry.canonical.com>
Subject: [Bug 1886306] Re: qemu running slow when the window is in background
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: 86fa3f3285f3132f0f6eb5159f837e70981534e8
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886306

Title:
  qemu running slow when the window is in background

Status in QEMU:
  Expired

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


