Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AA322B2
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jun 2019 10:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXLfc-0004mU-4X
	for lists+qemu-devel@lfdr.de; Sun, 02 Jun 2019 04:16:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXLeX-0004Vn-GZ
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 04:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXLeW-0007v3-CF
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 04:15:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:57600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hXLeW-0007tl-6n
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 04:15:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hXLeU-00081M-VQ
	for <qemu-devel@nongnu.org>; Sun, 02 Jun 2019 08:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id E544C2E80C7
	for <qemu-devel@nongnu.org>; Sun,  2 Jun 2019 08:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Jun 2019 08:03:21 -0000
From: Roland Christmann <1831362@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: keyboard windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: roc007
X-Launchpad-Bug-Reporter: Roland Christmann (roc007)
X-Launchpad-Bug-Modifier: Roland Christmann (roc007)
Message-Id: <155946260192.25075.10232018977169106863.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 55baeef01b5ca151148e74628925757846a1c3be
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1831362] [NEW] European keyboard PC-105 deadkey
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1831362 <1831362@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

With a freshly compiled version of qemu 4.0.50 on Windows 10 (host)

I am using 3 different Belgian keyboards and I have the same behaviour
- 2 USB keyboards (Logitech and HP) and
- the keyboard of my laptop (HP)

3 characters on the same key cannot be used (the key seams to be dead):
< (less than),
> (greater than) used with the combination of LShift or RShift
\ (backslash) used with the combination of AltGr

Using grub command mode from an archlinux installation (5.1.4)
The keyboard seams to be a mix of azerty and qwerty keyboard
all letters are correctly mapped but all numbers and special
characters are not

Using sendkey in monitor
"sendkey <" results in : \
"sendkey shift-<" results in : |
"sendkey ctrl-alt-<" results in : nothing

REM: VirtualBox can handle this key and with the showkey command
     from the archlinux kbd package, it shows :
     keycode 86 press
     keycode 86 release

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: keyboard windows

** Tags added: windows

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831362

Title:
  European keyboard PC-105 deadkey

Status in QEMU:
  New

Bug description:
  With a freshly compiled version of qemu 4.0.50 on Windows 10 (host)

  I am using 3 different Belgian keyboards and I have the same behaviour
  - 2 USB keyboards (Logitech and HP) and
  - the keyboard of my laptop (HP)

  3 characters on the same key cannot be used (the key seams to be dead):
  < (less than),
  > (greater than) used with the combination of LShift or RShift
  \ (backslash) used with the combination of AltGr

  Using grub command mode from an archlinux installation (5.1.4)
  The keyboard seams to be a mix of azerty and qwerty keyboard
  all letters are correctly mapped but all numbers and special
  characters are not

  Using sendkey in monitor
  "sendkey <" results in : \
  "sendkey shift-<" results in : |
  "sendkey ctrl-alt-<" results in : nothing

  REM: VirtualBox can handle this key and with the showkey command
       from the archlinux kbd package, it shows :
       keycode 86 press
       keycode 86 release

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831362/+subscriptions

