Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B958F3FD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 20:57:16 +0200 (CEST)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyKvz-0002f2-Sg
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 14:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyKuo-00028v-JF
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyKum-00055b-2i
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:56:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:52474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyKul-00054h-Gw
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 14:56:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyKuj-0005ab-7N
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 18:55:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DB1F22E80D9
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 18:55:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Aug 2019 18:48:25 -0000
From: Thomas Huth <1832914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: radmehrsaeed7 th-huth
X-Launchpad-Bug-Reporter: saeed (radmehrsaeed7)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156054768216.24530.6912218862187194732.malonedeb@gac.canonical.com>
Message-Id: <156589490532.16226.17627147480305182392.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 0ab30507b523d98432a622f3ff47f97cf312f384
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832914] Re: Wrong error log when drive is
 specified qcow but qcow2 image file used.
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
Reply-To: Bug 1832914 <1832914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D197bfa7da7c8eeb39aa5

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832914

Title:
  Wrong error log when drive is specified qcow but qcow2 image file
  used.

Status in QEMU:
  Fix Released

Bug description:
  On archlinux qemu version 4.0.0 when I type:

  $ qemu-system-x86_64 -drive format=3Dqcow,file=3Dimage.qcow2 ...

  I get this output in stderr

  qemu-system-x86_64 -drive format=3Dqcow,file=3Dimage.qcow2 ...:
  Unsupported qcow version 3

  image.qcow2 is a qcow2 image created by qemu-img. error states that
  problem is with lack support with qcow3 format but real problem is
  that foramt=3Dqcow is wrong option.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832914/+subscriptions

