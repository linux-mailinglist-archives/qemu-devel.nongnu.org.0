Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655E1AE6E1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 22:42:22 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPXoa-0007mA-VT
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 16:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPXnJ-0006ce-06
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPXnG-0002pH-Pk
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:41:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:34402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPXnG-0002ma-Kn
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 16:40:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPXnE-00036s-W8
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 20:40:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D0DFE2E8108
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 20:40:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2020 20:27:08 -0000
From: John Snow <1873338@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <158706562034.6027.11807874678540403888.malonedeb@chaenomeles.canonical.com>
Message-Id: <158715522835.6474.9301621161181932874.malone@chaenomeles.canonical.com>
Subject: [Bug 1873338] Re: Dos on the fly CD image replacement is not Working
 with DOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9ad48e6725c67e5bf3a8a6fa6941a0e6d20b0503
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

Does this work with other guests, like Windows 95/98 as far as you can
tell? Is it only a problem in DOS? What exact version of DOS are you
seeing the problem with?

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

