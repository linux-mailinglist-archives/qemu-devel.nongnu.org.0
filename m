Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD032C6E8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 14:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVbV5-0003jI-8d
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 08:46:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVbTx-0003OO-4T
	for qemu-devel@nongnu.org; Tue, 28 May 2019 08:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVbTv-0003dc-3U
	for qemu-devel@nongnu.org; Tue, 28 May 2019 08:45:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:59454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hVbTr-0003VA-8e
	for qemu-devel@nongnu.org; Tue, 28 May 2019 08:45:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hVbTn-0004dh-IM
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 12:45:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 874D32E80CB
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 12:45:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 May 2019 12:33:08 -0000
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
Message-Id: <155904678864.24629.12168949763336969201.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: f03e8d88bbab8176a7d51245e246abb76f3538b0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1101210] Re: qemu 1.4.2: usb keyboard not fully
 working
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
Reply-To: Bug 1101210 <1101210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With a freshly compiled version of qemu 4.0.50
on Widows 10 (host)

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
     keycode  86 press
     keycode  86 release

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

