Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C61AD07E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:41:58 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAOb-0002gs-NH
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPANZ-0001YT-4v
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPANY-0008Ks-0y
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:42730)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPANX-0008KW-Rz
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPANW-0006Ft-Lv
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8A0752E806D
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 19:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 19:35:18 -0000
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
Message-Id: <158706571876.12002.5666042854910451278.malonedeb@soybean.canonical.com>
Subject: [Bug 1873339] [NEW] Qemu DOS Quake - 640x480 and above resolutions -
 Unable to load VESA palette in dos prompt and game crashing are not
 working 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9328006d1086959e6fc022ed5b6964e012b0e9b5
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
Reply-To: Bug 1873339 <1873339@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I have problem make Quake Demo working with 640x480+, with 320x200 working =
fine.
I tried 3 virtual videocards settings: -vga cirrus 640x480 is not available=
, probably emulated GPU has not enough VRAM or some Vesa2 utility is needed=
. For -vga std and -vga vmware // 640x480 is available in game menu, but wh=
en i tried to set it, im getting: Unable to load VESA palette in dos prompt=
 and game crashing.
With vmware svgaII other Q2DOS 640x480 and 1024x768 its working fine, so it=
 not working only with some games.

  Qemu 4.2, its same on Linux and Windows.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873339

Title:
  Qemu DOS Quake - 640x480 and above resolutions - Unable to load VESA
  palette in dos prompt and game crashing are not working

Status in QEMU:
  New

Bug description:
  I have problem make Quake Demo working with 640x480+, with 320x200 workin=
g fine.
  I tried 3 virtual videocards settings: -vga cirrus 640x480 is not availab=
le, probably emulated GPU has not enough VRAM or some Vesa2 utility is need=
ed. For -vga std and -vga vmware // 640x480 is available in game menu, but =
when i tried to set it, im getting: Unable to load VESA palette in dos prom=
pt and game crashing.
  With vmware svgaII other Q2DOS 640x480 and 1024x768 its working fine, so =
it not working only with some games.

    Qemu 4.2, its same on Linux and Windows.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873339/+subscriptions

