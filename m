Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952E374F0A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:52:17 +0200 (CEST)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leWvo-0000py-32
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWud-00082R-CC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWub-00052G-Hp
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:51:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leWuY-0005q7-J1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:50:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 84BF12E8197
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 05:50:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:45:14 -0000
From: Thomas Huth <1864814@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pbuntu1 th-huth
X-Launchpad-Bug-Reporter: Peter Vegh (pbuntu1)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158270726043.14146.8926447072185498744.malonedeb@wampee.canonical.com>
Message-Id: <162027991451.4274.7441565740330586546.malone@gac.canonical.com>
Subject: [Bug 1864814] Re: Improve UX for macOS when launching from a
 fullscreen app
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 2eedffceb3ff3dd01e9fcd0cbaf042afca0f9702
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
Reply-To: Bug 1864814 <1864814@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

** Tags added: macos

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864814

Title:
  Improve UX for macOS when launching from a fullscreen app

Status in QEMU:
  Incomplete

Bug description:
  System/setup:
  * MacBook Pro, macOS (any version from the last 2 years), external monito=
r.
  * IDE on the laptop, emulator is used on the external monitor.

  Currently, when starting the emulator from e.g. Android Studio or
  IntelliJ IDEA, which is set to fullscreen mode on the laptop, which is
  like it's own virtual desktop (Space) in macOS, what happens is this:

  1. The virtual desktop (Space) on the laptop screen is switched because o=
f #2. The reason is that only one window can be shown in Fullscreen this wa=
y.
  2. The qemu splashscreen is shown for a few seconds, then it disappears. =
This is the reason for the virtual desktop switch. This splashscreen seems =
actually unnecessary to me, it has no value and it causes problems.
  3. The actual emulator is shown, in my case on the external monitor (corr=
ectly). I guess if the splashscreen would not be shown, the virtual desktop=
 switch would not happen, because the emulator would happen on the correct =
screen directly.

  So maybe the splashscreen and the emulator window should be the same wind=
ow, so that the OS can remember it's position being the same as the emulato=
r?
  Or maybe the splash could be disabled (by default? otherwise an update to=
 IDEs would be necessary for the improved behavior?)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864814/+subscriptions

