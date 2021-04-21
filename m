Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B8366D97
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:05:48 +0200 (CEST)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDUA-0001aa-FT
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZDTJ-0001AC-4T
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:04:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:54162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZDTH-00085Q-0j
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:04:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZDTF-0002p9-FO
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:04:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 62A4B2E815F
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:04:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Apr 2021 13:51:39 -0000
From: Thomas Huth <1368178@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cirrus imagine me millennium nine number vga videocard
 windows winme
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: euro-cent th-huth
X-Launchpad-Bug-Reporter: OIiver (euro-cent)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140911114353.25076.30246.malonedeb@soybean.canonical.com>
Message-Id: <161901309994.22410.12204335979647427024.launchpad@gac.canonical.com>
Subject: [Bug 1368178] Re: Windows ME falsely detects qemu's videocards as
 Number Nine Imagine 128
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 2c88bffd207dce76100436d36c416691575be5a3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1368178 <1368178@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: 128 edition millenium

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1368178

Title:
  Windows ME falsely detects qemu's videocards as Number Nine Imagine
  128

Status in QEMU:
  New

Bug description:
  A fresh installation of  Windows Millennium Edition (Windows ME,
  WinME) as guest OS on qemu interprets qemu's videocards as Number Nine
  Imagine  128 with the consequence, that

  1. It is impossible to change color depth.
  2. WinME uses the i128.drv Driver that is shipped with WinMe.
  3. Forcing WinME to use other drivers has no effect.

  =

  It also doesn't matter what option for -vga was given to QEMU at command =
line.
  cirrus, std,   vmware,  qxl etc. all have no effect, the videocard detect=
ed by Windows Me stays at Number Nine Imagine 128.

  Even selecting another driver in WinME and forcing WinME to use
  drivers such as the Cirrus Logic 5446 PCI driver has no effect.

  I also want to mention, that the BIOS isn't detected by WinME properly.
  The device manager of WinME shows errors with the Plug & Play BIOS driver=
 BIOS.vxd.

  =

  That is the QEMU Version:

  # qemu-system-i386 --version                                             =
                                                                           =
                                                  =

  QEMU emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.3), Copyright (c)=
 2003-2008 Fabrice Bellard                  =


  And this was the complete command line, that was given: =

  # sudo /usr/bin/qemu-system-i386 -hda WinME_QEMU.img -cdrom drivers.iso -=
boot c -no-acpi -no-hpet -soundhw sb16 -net nic -cpu pentium3 -m 256 -vga c=
irrus

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1368178/+subscriptions

