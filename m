Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25F1AE965
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 04:44:02 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPdSb-0003Z2-7p
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 22:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPdPZ-0002CX-As
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 22:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPdPX-0004Qk-Kg
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 22:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:35976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPdPX-0004Cu-2Q
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 22:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPdPT-0000Ap-Vp
 for <qemu-devel@nongnu.org>; Sat, 18 Apr 2020 02:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E67702E8104
 for <qemu-devel@nongnu.org>; Sat, 18 Apr 2020 02:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2020 02:32:19 -0000
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
Message-Id: <158717713918.5647.12840248269223799215.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1873542] [NEW] Windows 98 videocard passthrough - unable to load
 higher resolution -Desktop, after some games crashes,
 without whole physical machine reset..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c4d432a5c904a5ce3bb12c39230df7e5644f2bf1
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
Reply-To: Bug 1873542 <1873542@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When you are using games which are using fullscreen switching
resolutions (some old games are 640x480 or 800x600 max), videocard is
often stuck after crash and whole Linux machine has to be rebooted, to
fix it.. VM reboot is not enough.

  That stuck is strange one, after restart of machine, text mode is
working fine, but graphical mode should be set to higher resolution
(Load Windows 98 desktop) there is only black screen and screen input
blinking.

  I simulated it with multiple videocards, graphical drivers, its quite
often, full Linux reboot is always safe it. Im using right roms for my
cards, because otherwise i get often even boot machine twice in one
Linux boot session.

  Some there is need for some better card reset.

  Also some videocard reset on Linux level workaround would be nice.

  Simulated on Qemu 2.11 and 4.2 and Linux Mint 19.3, but my guess its
whole KVM videocard passthrough problem.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873542

Title:
  Windows 98 videocard passthrough - unable to load higher resolution
  -Desktop, after some games crashes, without whole physical machine
  reset..

Status in QEMU:
  New

Bug description:
  When you are using games which are using fullscreen switching
  resolutions (some old games are 640x480 or 800x600 max), videocard is
  often stuck after crash and whole Linux machine has to be rebooted, to
  fix it.. VM reboot is not enough.

    That stuck is strange one, after restart of machine, text mode is
  working fine, but graphical mode should be set to higher resolution
  (Load Windows 98 desktop) there is only black screen and screen input
  blinking.

    I simulated it with multiple videocards, graphical drivers, its
  quite often, full Linux reboot is always safe it. Im using right roms
  for my cards, because otherwise i get often even boot machine twice in
  one Linux boot session.

    Some there is need for some better card reset.

    Also some videocard reset on Linux level workaround would be nice.

    Simulated on Qemu 2.11 and 4.2 and Linux Mint 19.3, but my guess its
  whole KVM videocard passthrough problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873542/+subscriptions

