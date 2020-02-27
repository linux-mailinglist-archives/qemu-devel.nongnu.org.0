Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABBF1710D2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 07:06:36 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7CJf-0005fs-1d
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 01:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7CIx-0005Ee-I2
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:05:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7CIw-0004za-Gz
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:05:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:57696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7CIw-0004wz-Bn
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 01:05:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7CIv-0003OB-1o
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 06:05:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 071D62E8058
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 06:05:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Feb 2020 05:58:11 -0000
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
Message-Id: <158278309128.18853.6534515173893863136.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1864955] [NEW] bundle QEMU installer with HAXM accelerator for
 Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 684ff13a149fbbfa838efb9ce315e79eb4d82ef0
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
Reply-To: Bug 1864955 <1864955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

As you probably know HAXM is an accelerator for Windows.

https://www.qemu.org/2017/11/22/haxm-usage-windows/

Currently it is required to first install QEMU and then install HAXM.

For a better out of the box user experience on the Windows platform it
would be nice if QEMU and HAXM would be installed by the same installer.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864955

Title:
  bundle QEMU installer with HAXM accelerator for Windows

Status in QEMU:
  New

Bug description:
  As you probably know HAXM is an accelerator for Windows.

  https://www.qemu.org/2017/11/22/haxm-usage-windows/

  Currently it is required to first install QEMU and then install HAXM.

  For a better out of the box user experience on the Windows platform it
  would be nice if QEMU and HAXM would be installed by the same
  installer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864955/+subscriptions

