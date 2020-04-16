Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F51AD0BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 22:04:41 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAka-0001Dw-EI
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 16:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jPAgy-0005GX-S6
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jPAgw-0000Y7-Gd
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:00:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:45668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jPAgw-0000XD-9R
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:00:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jPAgu-0008EO-I5
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 20:00:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 848132E805B
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 20:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2020 19:51:31 -0000
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
Message-Id: <158706669207.6417.12043133926668000830.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1873344] [NEW] KVM Windows 98 sound card passthrough is not
 working for DOS programs..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 25011e81ee272be4e8acf645a12d6623679c1871
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
Reply-To: Bug 1873344 <1873344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
im trying to passthrough PCI soundcards into Qemu Windows 98 machine - i tr=
ied Yamaha 724/744 and Aunreal Vortex 1, for Windows 98 its working fine, b=
ut for Windows 98 dosbox mode its at the best half - working - FM (music) o=
nly or nothing with detected by games sound setups.
  All there cards are using SB emulation devices. =


  When i try to boot to pure DOS, without Windows 98, even music is not wor=
king with pass through, only sound which i was able to heard its form Yamah=
a Setup utility test - Native 16bit sound, aby other test, games setup etc.=
. are able to dettect sound cards at all. =

  Im pretty sure that drivers are setup correctly, because im using same se=
tup on other physical machine, when its working. My suspect is missing or b=
roken Qemu MB DMA channels emulation.. Because its is need to make DOS soun=
d working.

  Im using pass through because, SB16 emulation in Qemu is incomplete
and for Windows 98 dos box, problem is same as with physical cards. Same
with AC97 emulation and its Win95 drivers, which have SB emulation
device fallback..

Qemu 2.11 + 4.2 Linux Mint 19.3. MB Gigabyte Z170.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873344

Title:
  KVM Windows 98 sound card passthrough is not working for DOS
  programs..

Status in QEMU:
  New

Bug description:
  Hello,
  im trying to passthrough PCI soundcards into Qemu Windows 98 machine - i =
tried Yamaha 724/744 and Aunreal Vortex 1, for Windows 98 its working fine,=
 but for Windows 98 dosbox mode its at the best half - working - FM (music)=
 only or nothing with detected by games sound setups.
    All there cards are using SB emulation devices. =


    When i try to boot to pure DOS, without Windows 98, even music is not w=
orking with pass through, only sound which i was able to heard its form Yam=
aha Setup utility test - Native 16bit sound, aby other test, games setup et=
c.. are able to dettect sound cards at all. =

    Im pretty sure that drivers are setup correctly, because im using same =
setup on other physical machine, when its working. My suspect is missing or=
 broken Qemu MB DMA channels emulation.. Because its is need to make DOS so=
und working.

    Im using pass through because, SB16 emulation in Qemu is incomplete
  and for Windows 98 dos box, problem is same as with physical cards.
  Same with AC97 emulation and its Win95 drivers, which have SB
  emulation device fallback..

  Qemu 2.11 + 4.2 Linux Mint 19.3. MB Gigabyte Z170.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873344/+subscriptions

