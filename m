Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ADA3526C0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 08:53:57 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSDgq-0004R6-7l
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 02:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDeK-0002DS-CE
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:51:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:41226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDeG-0000Gd-QM
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:51:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lSDeE-0008UH-Va
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 06:51:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EAC152E806F
 for <qemu-devel@nongnu.org>; Fri,  2 Apr 2021 06:51:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Apr 2021 06:37:14 -0000
From: promeneur <1873335@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: epistemepromeneur ruthan
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: promeneur (epistemepromeneur)
References: <158706530687.6368.4226982042682182002.malonedeb@chaenomeles.canonical.com>
Message-Id: <161734543429.28954.16486330455332531877.malone@gac.canonical.com>
Subject: [Bug 1873335] Re: Dos Keypad is not working for numbers - numlock is
 not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 77bea9f66fbbe13a988e9f2919518eca33c6accc
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
Reply-To: Bug 1873335 <1873335@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I use this qemu invocation

[CODE]
#!/bin/bash

qemu-kvm \
-enable-kvm \
-k fr \
-m 2048 \
-smp 2 \
-cpu host \
-vga qxl \
-device usb-ehci \
-device usb-mouse \
-device usb-kbd \
-device usb-tablet \
-device ich9-intel-hda \
-device hda-duplex,audiodev=3Dsnd0 \
-audiodev pa,id=3Dsnd0 \
-device usb-host,vendorid=3D0x046d,productid=3D0x08e5 \
-boot menu=3Don \
-nic bridge \
~/QEMU_VM/android_x86_7.1-r5.img \

[/CODE]

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873335

Title:
  Dos Keypad is not working for numbers - numlock is not working

Status in QEMU:
  New

Bug description:
  Hello,
  i tried to use Qemu 4.2 for Dos, but there is problem what in Dos is not =
possible turn on Numlock for input numbers, so games need it.. Numlock only=
 working as arrow keys.
  =C2=A0=C2=A0I tested bough Windows and Linux builds.

  With same setting, when i use Windows 98 or later os, numlock is
  working fine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873335/+subscriptions

