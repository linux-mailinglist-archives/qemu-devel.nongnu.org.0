Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3632C4E04
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 05:28:40 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki8tb-000665-7E
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 23:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8rb-0004IA-4j
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:26:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ki8rZ-0004cE-Ax
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 23:26:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ki8rV-00017K-O9
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:26:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 206232E814E
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:26:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2020 04:17:18 -0000
From: Launchpad Bug Tracker <1722857@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor netrolller-3d th-huth
X-Launchpad-Bug-Reporter: Googulator (netrolller-3d)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150773875950.15858.6612772865194948716.malonedeb@soybean.canonical.com>
Message-Id: <160636423856.8545.7846348110261246354.malone@loganberry.canonical.com>
Subject: [Bug 1722857] Re: Missing PCI "programming interface" ID emulation
 for USB host controllers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 0dfa6491455a695ff5aa7fa587733655a0f732a5
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
Reply-To: Bug 1722857 <1722857@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1722857

Title:
  Missing PCI "programming interface" ID emulation for USB host
  controllers

Status in QEMU:
  Expired

Bug description:
  Qemu doesn't currently emulate the correct value of the "register
  level programming interface" field in the PCI config space of USB host
  controllers. As a result, some guest operating systems (most notably
  Windows) fail to load e.g. generic xHCI drivers, and instead ask for a
  vendor-specific driver, which may not be always available.

  Example: "-device nec-usb-xhci" emulates a Renesas (formerly NEC)
  uPD720202 xHCI controller. However, in the PCI config space, it shows
  us as class 0C, subclass 03, prog-if 00 (UHCI) where as the real
  uPD720202 (and all real xHCI controllers) have prog-if 30 (xHCI). A
  Windows guest booted with this option will not recognize devices
  attached to the XHCI controller unless drivers from Renesas are
  manually installed first, even though recent Windows versions include
  a generic xHCI driver that works perfectly well with real uPD720202
  hardware.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1722857/+subscriptions

