Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0E1AE8B8
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 01:51:33 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPalg-000709-4v
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 19:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPakn-0006Zq-C5
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPakm-0007Xz-6i
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:50:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:57644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPakm-0007VY-0m
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 19:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPakk-0001bc-Jv
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 23:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8EE072E8025
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 23:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2020 23:42:27 -0000
From: ruthan <ruthan@email.cz>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: ruthan (ruthan)
References: <158706562034.6027.11807874678540403888.malonedeb@chaenomeles.canonical.com>
Message-Id: <158716694726.5491.8405976117033312595.malone@chaenomeles.canonical.com>
Subject: [Bug 1873338] Re: Dos on the fly CD image replacement is not Working
 with DOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: eb2e2f770acb8a415101dec5dd7461840e592cc6
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
Reply-To: Bug 1873338 <1873338@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried Win98 virtual machine here its working fine, without reboot.

 Im using MS-DOS 7.1 - integrated within and Win9x and classic MSDEX or
SHSUCDX drivers for CD-ROM, but o dpmt thing that it matters.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873338

Title:
  Dos on the fly CD image replacement is not Working with DOS

Status in QEMU:
  New

Bug description:
  Im not able to exchange CD image on the fly (needed for some games). I
  messed with command like - in console(ATL+CRTL+2) eject ide1-cd0 and
  change ide-cd0 D:/Games/!Emulators/Dos-QEMU/ISOs/TestChangeISO.iso ,
  but system so never able to find new CD data.. simply drive so empty..
  but when i reboot virtual machine, new change image is now working.

    Qemu 4.2.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873338/+subscriptions

