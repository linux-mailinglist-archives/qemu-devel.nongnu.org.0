Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4161B891A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Apr 2020 21:42:09 +0200 (CEST)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSQgh-0000UE-Hj
	for lists+qemu-devel@lfdr.de; Sat, 25 Apr 2020 15:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jSQfY-0008FV-LK
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jSQfX-0004H0-No
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:40:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:60144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jSQfX-0004CX-9D
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 15:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jSQfU-0002Vk-BR
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 19:40:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28E2E2E8104
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 19:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Apr 2020 19:23:16 -0000
From: Armin <1875080@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lnxosk
X-Launchpad-Bug-Reporter: Armin (lnxosk)
X-Launchpad-Bug-Modifier: Armin (lnxosk)
Message-Id: <158784259621.25418.6669697742767544234.malonedeb@soybean.canonical.com>
Subject: [Bug 1875080] [NEW] USB host device data transfer with control
 endpoint
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="486bbbd6cb608f8eb468ed0d08689a349dfabe49";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5c37226e884f8c088ae1f87a18cc4235f74cca97
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/25 15:40:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1875080 <1875080@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

QEMU emulator version 4.2.0
Host -> Arch Linux kernel version: 5.4.34-1-lts
Guest -> Various Linux Distros

I sent a control message with data through endpoint zero.
On the other side message is received with all fields correct except data b=
uffer.
I've tested the data field inside guest with usbmon and data field was corr=
ect but after packet leaved qemu, data filed is lost.

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- USB host device data transfer of control endpoint
+ USB host device data transfer with control endpoint

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875080

Title:
  USB host device data transfer with control endpoint

Status in QEMU:
  New

Bug description:
  QEMU emulator version 4.2.0
  Host -> Arch Linux kernel version: 5.4.34-1-lts
  Guest -> Various Linux Distros

  I sent a control message with data through endpoint zero.
  On the other side message is received with all fields correct except data=
 buffer.
  I've tested the data field inside guest with usbmon and data field was co=
rrect but after packet leaved qemu, data filed is lost.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875080/+subscriptions

