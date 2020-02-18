Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC1162157
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 08:06:54 +0100 (CET)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3wy5-0004c5-7P
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 02:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3www-0003YU-W9
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 02:05:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3wwv-0000rx-Lq
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 02:05:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:45988)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3wwv-0000r8-GR
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 02:05:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3wwt-0000QV-T4
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 07:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D5FDD2E804A
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 07:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Feb 2020 06:59:03 -0000
From: "Chris S." <1863710@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chriscjsus
X-Launchpad-Bug-Reporter: Chris S. (chriscjsus)
X-Launchpad-Bug-Modifier: Chris S. (chriscjsus)
Message-Id: <158200914380.31311.6636278385327327157.malonedeb@wampee.canonical.com>
Subject: [Bug 1863710] [NEW] qemu 4.2 does not process discard(trim) commands 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 07de2fa97148f0a03379684bf6dba0aad63253e8
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
Reply-To: Bug 1863710 <1863710@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I'm using Arch Linux with qemu 4.2 and blktrace to monitor discard
commands as they are sent to the hardware.  Blktrace shows nothing as
the VM is trimming the SSDs.

I downgraded to qemu 4.1.1 and blktrace shows lots of discard commands
as the VM is trimming.

Kernel version is 5.5.4.

Attached is the libvirt xml.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "win10-real.xml"
   https://bugs.launchpad.net/bugs/1863710/+attachment/5329158/+files/win10=
-real.xml

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863710

Title:
  qemu 4.2 does not process discard(trim) commands

Status in QEMU:
  New

Bug description:
  I'm using Arch Linux with qemu 4.2 and blktrace to monitor discard
  commands as they are sent to the hardware.  Blktrace shows nothing as
  the VM is trimming the SSDs.

  I downgraded to qemu 4.1.1 and blktrace shows lots of discard commands
  as the VM is trimming.

  Kernel version is 5.5.4.

  Attached is the libvirt xml.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863710/+subscriptions

