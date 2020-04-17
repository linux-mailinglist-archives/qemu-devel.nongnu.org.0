Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977181AE8BC
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 01:56:38 +0200 (CEST)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPaqb-0000AG-EP
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 19:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPapp-0008BS-MD
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:55:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPapk-0002Ja-Ix
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:55:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:58586)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPapk-0002GU-DL
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:55:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPapi-0002AM-SX
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 23:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D2D262E8107
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 23:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2020 23:49:09 -0000
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
References: <158706625888.5694.6270218999335358584.malonedeb@chaenomeles.canonical.com>
Message-Id: <158716734963.28393.7559068256831780642.launchpad@gac.canonical.com>
Subject: [Bug 1873341] Re: Qemu Win98 VM with KVM videocard passthrough DOS
 mode video is not working for most of games..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 79fc16b472fbf490e0115ffd5b3d7429ff7d56f6
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
Reply-To: Bug 1873341 <1873341@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  Hello,
  im using Win98 machine with KVM videocards passthrough which is working f=
ine, but when i try Windows 98 - Dosbox mode, there is something work with =
all videocards which i tried PCI-E/PCI - Nvidia, 3Dfx, Matrox.
  =

-  Often is framerate is very slow, as slideshow:
- Doom 2, Blood, even for Fdisk start - i can see how its slowly rendering =
individual lines, or its not working at all - freeze / black screen only - =
Warcraft 2 demo (vesa 640x480). =

+ =C2=A0Often is framerate is very slow, as slideshow:
+ Doom 2,Battle Arena Toshidden 1 demo, Blood, even for Fdisk start - i can=
 see how its slowly rendering individual lines, or its not working at all -=
 freeze / black screen only - Warcraft 2 demo (vesa 640x480).
  =

-  There is something wrong with it.
+ =C2=A0There is something wrong with it. I can add more games info if is
+ needed, most of games which i tried are not working.
  =

-  Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.
+ =C2=A0Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873341

Title:
  Qemu Win98 VM with KVM videocard passthrough DOS mode video is not
  working for most of games..

Status in QEMU:
  New

Bug description:
  Hello,
  im using Win98 machine with KVM videocards passthrough which is working f=
ine, but when i try Windows 98 - Dosbox mode, there is something work with =
all videocards which i tried PCI-E/PCI - Nvidia, 3Dfx, Matrox.

  =C2=A0Often is framerate is very slow, as slideshow:
  Doom 2,Battle Arena Toshidden 1 demo, Blood, even for Fdisk start - i can=
 see how its slowly rendering individual lines, or its not working at all -=
 freeze / black screen only - Warcraft 2 demo (vesa 640x480).

  =C2=A0There is something wrong with it. I can add more games info if is
  needed, most of games which i tried are not working.

  =C2=A0Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873341/+subscriptions

