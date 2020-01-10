Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E3136517
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 02:56:45 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipjXX-0001Jw-Uk
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 20:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipjWf-0000SQ-A8
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:55:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipjWd-0003wJ-2T
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:55:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:44720)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipjWc-0003oj-Rg
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 20:55:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipjWZ-0005X0-3p
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 01:55:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0921F2E80C8
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 01:55:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 01:45:35 -0000
From: John Arbuckle <programmingkidx@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx roemeeeer
X-Launchpad-Bug-Reporter: =?utf-8?q?Roman_B=C3=A4riswyl_=28roemeeeer=29?=
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <157860451191.3344.46185682085252095.malonedeb@soybean.canonical.com>
Message-Id: <157862073560.28173.16590070381018766771.malone@chaenomeles.canonical.com>
Subject: [Bug 1859081] Re: Mouse way too fast when Qemu is on a Windows VM
 with a OS 9 Guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a37cdebe2a4b60149bdd1e01f79945dfe86c3a56
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
Reply-To: Bug 1859081 <1859081@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What is the QEMU command-line you use?
Does this problem exist with the usb mouse (-device usb-mouse)?=07
Could you try upgrading to the latest version of QEMU and see if the issue =
is resolved please?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859081

Title:
  Mouse way too fast when Qemu is on a Windows VM with a OS 9 Guest

Status in QEMU:
  New

Bug description:
  On a server, I have a Windows 10 VM with Qemu 4.1.0 (latest) from https:/=
/qemu.weilnetz.de/w64/ installed.
  There I have a Mac OS 9.2.2 machine.
  Now if I connect to the Windows VM with VNC or RDP or even VMWare console=
, the Mouse in the Mac OS Guest inside Qemu is waaaay to fast. Even when lo=
wering the mouse speed in the Mac OS mouse setting, one pixel in the Host (=
Windows 10 VM) still moves the mouse by 10 pixels inside the Qemu machine.
  I tried different resolutions but that does not help.
  Is there any way to fix this or any way how I can provide more informatio=
n?
  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859081/+subscriptions

