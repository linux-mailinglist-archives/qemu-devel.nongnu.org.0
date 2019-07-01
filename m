Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414EB46D7D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 03:19:12 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbxLb-0001DU-GJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 21:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43773)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hbtrI-00077M-QT
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 17:35:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hbtrF-0004WB-1C
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 17:35:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:49954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hbtrD-0004LU-6Q
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 17:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hbtr4-0007Xg-S3
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 21:35:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D0AEF2E80C8
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 21:35:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2019 21:28:02 -0000
From: saeed <radmehrsaeed7@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: radmehrsaeed7
X-Launchpad-Bug-Reporter: saeed (radmehrsaeed7)
X-Launchpad-Bug-Modifier: saeed (radmehrsaeed7)
Message-Id: <156054768216.24530.6912218862187194732.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: d99e978c872ba4152eb34aa4bada2786fe54803f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Fri, 14 Jun 2019 21:15:57 -0400
Subject: [Qemu-devel] [Bug 1832914] [NEW] Wrong error log when drive is
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

Public bug reported:

On archlinux qemu version 4.0.0 when I type:

$ qemu-system-x86_64 -drive format=3Dqcow,file=3Dimage.qcow2 ...

I get this output in stderr

qemu-system-x86_64 -drive format=3Dqcow,file=3Dimage.qcow2 ...: Unsupported
qcow version 3

image.qcow2 is a qcow2 image created by qemu-img. error states that
problem is with lack support with qcow3 format but real problem is that
foramt=3Dqcow is wrong option.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832914

Title:
  Wrong error log when drive is specified qcow but qcow2 image file
  used.

Status in QEMU:
  New

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

