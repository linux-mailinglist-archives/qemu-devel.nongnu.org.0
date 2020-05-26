Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362111A0493
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 03:36:37 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLdAJ-00016P-Pc
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 21:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jLd9N-0000Gy-1s
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 21:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jLd9L-0007w7-SA
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 21:35:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:34682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jLd9L-0007vo-NC
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 21:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jLd9K-0003Z0-JH
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 01:35:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 753D32E8104
 for <qemu-devel@nongnu.org>; Tue,  7 Apr 2020 01:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Apr 2020 01:20:17 -0000
From: Russell Morris <ubuntu@rkmorris.us>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
Message-Id: <158622241771.12256.11848293148646527356.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1871267] [NEW] Multiple (Repeating) Keystrokes in macOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 81a1a9d696cd489e74cf25ec7ebf269234c19658
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
Reply-To: Bug 1871267 <1871267@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,

I am finding this issue with v4.2.0, or the latest master - on a Windows
host, with macOS guest. It happens using gtk (SPICE?) or VNC. When I get
to a place to enter a keystroke, I quite reliably get multiple of the
same key (i.e. press A, get AAAA).

Thinking there may be a basic setting to address this? I did try it in
Linux (kvm), no issue there.

Thanks!

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1871267

Title:
  Multiple (Repeating) Keystrokes in macOS

Status in QEMU:
  New

Bug description:
  Hi,

  I am finding this issue with v4.2.0, or the latest master - on a
  Windows host, with macOS guest. It happens using gtk (SPICE?) or VNC.
  When I get to a place to enter a keystroke, I quite reliably get
  multiple of the same key (i.e. press A, get AAAA).

  Thinking there may be a basic setting to address this? I did try it in
  Linux (kvm), no issue there.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1871267/+subscriptions

