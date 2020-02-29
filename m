Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBFF174568
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 07:26:47 +0100 (CET)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7vaH-0008Jp-SC
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 01:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7vZI-0007rx-Ec
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7vZH-00023U-Ae
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:25:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:44948)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7vZH-00020Q-5N
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 01:25:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7vZF-0005UX-49
 for <qemu-devel@nongnu.org>; Sat, 29 Feb 2020 06:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1BC302E806F
 for <qemu-devel@nongnu.org>; Sat, 29 Feb 2020 06:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Feb 2020 06:19:22 -0000
From: Patrick Schleizer <adrelanos@riseup.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Patrick Schleizer (adrelanos)
Message-Id: <158295716251.12323.9371566486970829687.malonedeb@soybean.canonical.com>
Subject: [Bug 1865248] [NEW] bundle QEMU installer with a QEMU GUI (graphical
 user interface) such as Virt Manager
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 14c8d55709e7a6dc2887563d844043d13d9f142d
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
Reply-To: Bug 1865248 <1865248@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

For a better out of the box user experience on the Windows platform it
would be nice if a QEMU GUI would be by installed by the same QEMU
installer. Currently it is required to first install QEMU and then
install a QEMU GUI.

I don't know all QEMU GUIs but looks like Virt Manager is a decent QEMU
GUI and still maintained.

Virt Manager is also available for Windows.

https://serverfault.com/questions/340949/is-there-a-way-to-run-virt-
manager-on-windows

However as per these instructions it is difficult (many steps) for
laymen to install Virt Manager on Windows (cygwin...).

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865248

Title:
  bundle QEMU installer with a QEMU GUI (graphical user interface) such
  as Virt Manager

Status in QEMU:
  New

Bug description:
  For a better out of the box user experience on the Windows platform it
  would be nice if a QEMU GUI would be by installed by the same QEMU
  installer. Currently it is required to first install QEMU and then
  install a QEMU GUI.

  I don't know all QEMU GUIs but looks like Virt Manager is a decent
  QEMU GUI and still maintained.

  Virt Manager is also available for Windows.

  https://serverfault.com/questions/340949/is-there-a-way-to-run-virt-
  manager-on-windows

  However as per these instructions it is difficult (many steps) for
  laymen to install Virt Manager on Windows (cygwin...).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865248/+subscriptions

