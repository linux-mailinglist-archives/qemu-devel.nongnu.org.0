Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39A1AD09A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:51:50 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAY9-0007mi-80
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPAX4-0006hU-9e
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPAX3-0004eb-0K
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:44240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPAX2-0004dC-R3
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPAX2-0007DA-41
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1D2F82E8025
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 19:39:30 -0000
From: ruthan <ruthan@email.cz>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: ruthan (ruthan)
Message-Id: <158706597063.17331.9857104872351030807.malonedeb@wampee.canonical.com>
Subject: [Bug 1873340] [NEW] KVM Old ATI(pre) AMD card passthrough is not
 working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d1d075479b39a063bbc3130f985516e8ab386c04
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1873340 <1873340@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
tried to passthroug old ATI pre AMD PCI / PCI-E cards, on machine where any=
thing else is working - Nvidia /Matrox / 3dfx cards..

Here are results:
ATI Mach 64 PCI - videocard - machine start segfault
ATI Rage XL PCI - videocard - machine start segfault
ATI Radeon 7000 PCI - Segmentation fault
ATI X600 Giabyte GV-RX60P128D - Segmentation fault
ATI X700 PCI-E Legend - videocard - completely broken picture from boot
ATI X800 XL PCI-E Gigabyte - videocard - completely broken picture from boot
=C2=A0=C2=A0All cards have last bioses.

ATI X600 - HP one professional with DMS-59 connector, im unable to make
passthrough, but im not able to set in Windows 98/WinXP machine..
anything less than 16 bit colors.. Im getting VM crashes or boot
freezes, when i try to boot with more colors.

=C2=A0Qemu 2.11 and 4.2, is the same, Mint Linux 19.3. Giabyte Z170 MB.

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Hello,
  tried to passthroug old ATI pre AMD PCI / PCI-E cards, on machine where a=
nything else is working - Nvidia /Matrox / 3dfx cards..
  =

  Here are results:
  ATI Mach 64 PCI - videocard - machine start segfault
  ATI Rage XL PCI - videocard - machine start segfault
  ATI Radeon 7000 PCI - Segmentation fault
  ATI X600 Giabyte GV-RX60P128D - Segmentation fault
  ATI X700 PCI-E Legend - videocard - completely broken picture from boot
  ATI X800 XL PCI-E Gigabyte - videocard - completely broken picture from b=
oot
-   All cards has last bioses.
+ =C2=A0=C2=A0All cards have last bioses.
  =

  ATI X600 - HP one professional with DMS-59 connector, im unable to make
  passthrough, but im not able to set in Windows 98/WinXP machine..
  anything less than 16 bit colors.. Im getting VM crashes or boot
  freezes, when i try to boot with more colors.
  =

-  Qemu 2.11 and 4.2, is the same, Mint Linux 19.3.
+ =C2=A0Qemu 2.11 and 4.2, is the same, Mint Linux 19.3. Giabyte Z170 MB.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873340

Title:
  KVM Old ATI(pre) AMD card passthrough is not working

Status in QEMU:
  New

Bug description:
  Hello,
  tried to passthroug old ATI pre AMD PCI / PCI-E cards, on machine where a=
nything else is working - Nvidia /Matrox / 3dfx cards..

  Here are results:
  ATI Mach 64 PCI - videocard - machine start segfault
  ATI Rage XL PCI - videocard - machine start segfault
  ATI Radeon 7000 PCI - Segmentation fault
  ATI X600 Giabyte GV-RX60P128D - Segmentation fault
  ATI X700 PCI-E Legend - videocard - completely broken picture from boot
  ATI X800 XL PCI-E Gigabyte - videocard - completely broken picture from b=
oot
  =C2=A0=C2=A0All cards have last bioses.

  ATI X600 - HP one professional with DMS-59 connector, im unable to
  make passthrough, but im not able to set in Windows 98/WinXP machine..
  anything less than 16 bit colors.. Im getting VM crashes or boot
  freezes, when i try to boot with more colors.

  =C2=A0Qemu 2.11 and 4.2, is the same, Mint Linux 19.3. Giabyte Z170 MB.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873340/+subscriptions

