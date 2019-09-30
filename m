Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1EBC1D3F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 10:38:11 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iErC5-0001fp-UF
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 04:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iErAz-0001Gg-Dh
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iErAy-0007jd-9f
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:37:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:41400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iErAy-0007j7-3v
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:37:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iErAw-0002XX-Kv
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 08:36:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 959642E802E
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 08:36:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Sep 2019 08:19:38 -0000
From: Roland Christmann <1101210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bkerler roc007 sven-koehler th-huth untio
X-Launchpad-Bug-Reporter: Sven (sven-koehler)
X-Launchpad-Bug-Modifier: Roland Christmann (roc007)
References: <20130118141238.13697.51258.malonedeb@chaenomeles.canonical.com>
Message-Id: <156983157866.26634.16201304589714944431.malone@wampee.canonical.com>
Subject: [Bug 1101210] Re: qemu 1.4.2: usb keyboard not fully working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19065";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: befe61ca89ead2d1c8091fa86c11993ad57b4d46
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1101210 <1101210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With qemu version 2.9.94

Host: Windows 10
Guest: Archlinux 5.0.10

showkey output :

keycode 56 press   # Alt Gr
keycode 29 release # Alt Gr
keycode 56 release # Alt Gr

keycode 29 press   # Left Control
keycode 29 release # Left Control

keycode 29 press   # Right Contol
keycode 29 release # Right Contol

keycode 56 press   # Left Alt
keycode 56 release # Left Alt

keycode 86 press   # '> < \' key
keycode 86 release # '> < \' key

As you can see the key 'Alt Gr' is not correctly mapped, it should
return 100

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1101210

Title:
  qemu 1.4.2: usb keyboard not fully working

Status in QEMU:
  New

Bug description:
  When using the usb keyboard, I can't type the | character. I'm using
  german keyboard layout (de) on the host and inside the guest. As a
  guest OS, I use Linux (e.g. a recent KNOPPIX cd). To obtain the |
  character on a german keyboard, I need to press AltGr + the < or >
  key, i.e. the key right to the left shift.

  The qemu command line is something like this:
  ./qemu-system-i386 -device pci-ohci -device usb-kbd
  I also tried
  ./qemu-system-i386 -usb -usbdevice keyboard
  with the same effect.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1101210/+subscriptions

