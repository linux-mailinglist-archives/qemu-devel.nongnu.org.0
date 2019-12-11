Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173F11AC28
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 14:36:04 +0100 (CET)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if29q-00044Y-S0
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 08:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1if28m-0003X2-Bk
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1if28l-0005E4-3b
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:34:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:33026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1if28k-0005BP-J5
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 08:34:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1if0ad-0000aB-0Y
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 11:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E193A2E80CF
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 11:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Dec 2019 11:45:58 -0000
From: Tom Hanker <1856027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: harrymalaria
X-Launchpad-Bug-Reporter: Tom Hanker (harrymalaria)
X-Launchpad-Bug-Modifier: Tom Hanker (harrymalaria)
Message-Id: <157606475893.7537.4130147721731991147.malonedeb@soybean.canonical.com>
Subject: [Bug 1856027] [NEW] Suddenly no internet in guest system!
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 088eb0035125486eaa788a2ad7b599c62a94732f
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
Reply-To: Bug 1856027 <1856027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I use Opensuse 15.1 i have installed androidx86_64 as a guest system, it ru=
ns for over 3 years. i had a internetconnection, i could use apps etc. but =
since yesterday i can=C2=B4t connect to the internet with the guest system =
in the host system all works fine. What could be the reason? There haven=C2=
=B4t been an update and i haven=C2=B4t changed anything. =

The settings in nic are: bridge br0: Hostdevice eth0
devicemodel: e1000

The qemu Version is from the opensuse repo: 3.1.1

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856027

Title:
  Suddenly no internet in guest system!

Status in QEMU:
  New

Bug description:
  I use Opensuse 15.1 i have installed androidx86_64 as a guest system, it =
runs for over 3 years. i had a internetconnection, i could use apps etc. bu=
t since yesterday i can=C2=B4t connect to the internet with the guest syste=
m in the host system all works fine. What could be the reason? There haven=
=C2=B4t been an update and i haven=C2=B4t changed anything. =

  The settings in nic are: bridge br0: Hostdevice eth0
  devicemodel: e1000

  The qemu Version is from the opensuse repo: 3.1.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856027/+subscriptions

