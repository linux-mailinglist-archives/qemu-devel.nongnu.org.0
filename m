Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB316EFFC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 21:22:40 +0100 (CET)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6gj1-0002av-4k
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 15:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j6gh6-0001AT-UE
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j6gh5-0005nA-ES
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:20:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:53180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j6gh5-0005hC-7A
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:20:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j6gh3-0000Mr-Cx
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 20:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E2A72E806B
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 20:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Feb 2020 20:11:19 -0000
From: Xiaoxing Fang <1864704@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: xiaoxing-fang
X-Launchpad-Bug-Reporter: Xiaoxing Fang (xiaoxing-fang)
X-Launchpad-Bug-Modifier: Xiaoxing Fang (xiaoxing-fang)
Message-Id: <158266147970.14929.12590183127375701795.malonedeb@wampee.canonical.com>
Subject: [Bug 1864704] [NEW] No compatible -machine option in
 qemu-system-ppc64 for e6500 core
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7c9ddc55b293de268a71fc18ffbeef3d91aa3c78
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
Reply-To: Bug 1864704 <1864704@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,

I'm trying to use qemu-system-ppc64 for emulating a QorIQ T2080 (with e6500=
 cores). =

However, I couldn't find any -machine option that matches -cpu e6500 option=
, which are listed below:

C:\Program Files\qemu>qemu-system-ppc64 -machine help
Supported machines are:
40p                  IBM RS/6000 7020 (40p)
bamboo               bamboo
g3beige              Heathrow based PowerMAC
mac99                Mac99 based PowerMAC
mpc8544ds            mpc8544ds
none                 empty machine
powernv8             IBM PowerNV (Non-Virtualized) POWER8
powernv              IBM PowerNV (Non-Virtualized) POWER9 (alias of powernv=
9)
powernv9             IBM PowerNV (Non-Virtualized) POWER9
ppce500              generic paravirt e500 platform
prep                 PowerPC PREP platform (deprecated)
pseries-2.1          pSeries Logical Partition (PAPR compliant)
pseries-2.10         pSeries Logical Partition (PAPR compliant)
pseries-2.11         pSeries Logical Partition (PAPR compliant)
pseries-2.12         pSeries Logical Partition (PAPR compliant)
pseries-2.12-sxxm    pSeries Logical Partition (PAPR compliant)
pseries-2.2          pSeries Logical Partition (PAPR compliant)
pseries-2.3          pSeries Logical Partition (PAPR compliant)
pseries-2.4          pSeries Logical Partition (PAPR compliant)
pseries-2.5          pSeries Logical Partition (PAPR compliant)
pseries-2.6          pSeries Logical Partition (PAPR compliant)
pseries-2.7          pSeries Logical Partition (PAPR compliant)
pseries-2.8          pSeries Logical Partition (PAPR compliant)
pseries-2.9          pSeries Logical Partition (PAPR compliant)
pseries-3.0          pSeries Logical Partition (PAPR compliant)
pseries-3.1          pSeries Logical Partition (PAPR compliant)
pseries-4.0          pSeries Logical Partition (PAPR compliant)
pseries-4.1          pSeries Logical Partition (PAPR compliant)
pseries              pSeries Logical Partition (PAPR compliant) (alias of p=
series-4.2)
pseries-4.2          pSeries Logical Partition (PAPR compliant) (default)
ref405ep             ref405ep
sam460ex             aCube Sam460ex
taihu                taihu
virtex-ml507         Xilinx Virtex ML507 reference design

I am wondering if anyone knows that is if any of them can be selected
for such emulation? Thank you!

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: ppc

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864704

Title:
  No compatible -machine option in qemu-system-ppc64 for e6500 core

Status in QEMU:
  New

Bug description:
  Hi,

  I'm trying to use qemu-system-ppc64 for emulating a QorIQ T2080 (with e65=
00 cores). =

  However, I couldn't find any -machine option that matches -cpu e6500 opti=
on, which are listed below:

  C:\Program Files\qemu>qemu-system-ppc64 -machine help
  Supported machines are:
  40p                  IBM RS/6000 7020 (40p)
  bamboo               bamboo
  g3beige              Heathrow based PowerMAC
  mac99                Mac99 based PowerMAC
  mpc8544ds            mpc8544ds
  none                 empty machine
  powernv8             IBM PowerNV (Non-Virtualized) POWER8
  powernv              IBM PowerNV (Non-Virtualized) POWER9 (alias of power=
nv9)
  powernv9             IBM PowerNV (Non-Virtualized) POWER9
  ppce500              generic paravirt e500 platform
  prep                 PowerPC PREP platform (deprecated)
  pseries-2.1          pSeries Logical Partition (PAPR compliant)
  pseries-2.10         pSeries Logical Partition (PAPR compliant)
  pseries-2.11         pSeries Logical Partition (PAPR compliant)
  pseries-2.12         pSeries Logical Partition (PAPR compliant)
  pseries-2.12-sxxm    pSeries Logical Partition (PAPR compliant)
  pseries-2.2          pSeries Logical Partition (PAPR compliant)
  pseries-2.3          pSeries Logical Partition (PAPR compliant)
  pseries-2.4          pSeries Logical Partition (PAPR compliant)
  pseries-2.5          pSeries Logical Partition (PAPR compliant)
  pseries-2.6          pSeries Logical Partition (PAPR compliant)
  pseries-2.7          pSeries Logical Partition (PAPR compliant)
  pseries-2.8          pSeries Logical Partition (PAPR compliant)
  pseries-2.9          pSeries Logical Partition (PAPR compliant)
  pseries-3.0          pSeries Logical Partition (PAPR compliant)
  pseries-3.1          pSeries Logical Partition (PAPR compliant)
  pseries-4.0          pSeries Logical Partition (PAPR compliant)
  pseries-4.1          pSeries Logical Partition (PAPR compliant)
  pseries              pSeries Logical Partition (PAPR compliant) (alias of=
 pseries-4.2)
  pseries-4.2          pSeries Logical Partition (PAPR compliant) (default)
  ref405ep             ref405ep
  sam460ex             aCube Sam460ex
  taihu                taihu
  virtex-ml507         Xilinx Virtex ML507 reference design

  I am wondering if anyone knows that is if any of them can be selected
  for such emulation? Thank you!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864704/+subscriptions

