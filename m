Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86561AD09B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:52:44 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAZ1-0000an-Vb
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPAX4-0006h6-7V
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPAX2-0004d8-2u
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:44210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPAX1-0004cq-TJ
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:50:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPAX0-0007DB-Ir
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7044B2E806B
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 19:44:18 -0000
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
Message-Id: <158706625888.5694.6270218999335358584.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1873341] [NEW] Qemu Win98 VM with KVM videocard passthrough DOS
 mode video is not working for most of games..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 86941227518a41cb0b34267bfc0214d754f798fb
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

Public bug reported:

Hello,
im using Win98 machine with KVM videocards passthrough which is working fin=
e, but when i try Windows 98 - Dosbox mode, there is something work with al=
l videocards which i tried PCI-E/PCI - Nvidia, 3Dfx, Matrox.

 Often is framerate is very slow, as slideshow:
Doom 2, Blood, even for Fdisk start - i can see how its slowly rendering in=
dividual lines, or its not working at all - freeze / black screen only - Wa=
rcraft 2 demo (vesa 640x480). =


 There is something wrong with it.

 Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.

** Affects: qemu
     Importance: Undecided
         Status: New

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

   Often is framerate is very slow, as slideshow:
  Doom 2, Blood, even for Fdisk start - i can see how its slowly rendering =
individual lines, or its not working at all - freeze / black screen only - =
Warcraft 2 demo (vesa 640x480). =


   There is something wrong with it.

   Qemu 2.11 + 4.2, Linux Mint 19.3. Gigabyte Z170 MB.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873341/+subscriptions

