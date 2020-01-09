Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13F135A47
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:37:04 +0100 (CET)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipXzi-0000Pp-UB
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipXyJ-0007bW-Vx
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipXyI-000080-PH
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:35:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:33400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipXyI-0008Um-HS
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:35:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipXyH-0000j6-GF
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 13:35:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 712652E80D0
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 13:35:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jan 2020 13:27:53 -0000
From: Thomas Huth <1734792@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gnzlbg kb9vqf laurent-vivier
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151183114573.10651.11339653840196724023.malonedeb@wampee.canonical.com>
Message-Id: <157857647489.27579.292109592863695501.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1734792] Re: linux-user mode does not support memfd_create
 syscall
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7502e37b1c3e1993ae4e22b75b25cc3b83f7a4ed
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
Reply-To: Bug 1734792 <1734792@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1734792

Title:
  linux-user mode does not support memfd_create syscall

Status in QEMU:
  Fix Released

Bug description:
  qemu-x86_66 GIT HEAD fails on a userspace application that requires
  memfd_create with:

  "qemu: Unsupported syscall: 319".

  memfd_create support needs to be implemented in QEMU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1734792/+subscriptions

