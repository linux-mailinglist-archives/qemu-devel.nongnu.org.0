Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D4F0F5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 09:12:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLMw6-0004Oa-Pp
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 03:12:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLMua-0003W4-Ee
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLMuZ-0002rP-C5
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:46896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hLMuZ-0002r0-6p
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hLMuX-00042b-Hr
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 07:10:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 800652E80C7
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 07:10:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Apr 2019 07:01:56 -0000
From: Chen Zhang <1827005@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Chen Zhang (cuser2)
Message-Id: <155660771706.7289.11621855018434071577.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18928";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 67b9805d4854c4670d3974bf83c1089712120f33
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1827005] [NEW] hvf: ubuntu iso boot menu issue
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1827005 <1827005@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

With hvf acceleration on macOS, ubuntu server installation ISO boot
language menu shows fractured images.

To reproduce the issue:
./x86_64-softmmu/qemu-system-x86_64 -m 800 -accel hvf -cdrom ~/ubuntu-16.04=
.4-server-amd64.iso

Control:
./x86_64-softmmu/qemu-system-x86_64 -m 800 -accel tcg -cdrom ~/ubuntu-16.04=
.4-server-amd64.iso

Host: macOS Mojave 10.14.3
Guest: Ubuntu Server 16.04.4 ISO
QEMU: version 3.1.94 (v4.0.0-rc4)

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "Screenshot for bad case"
   https://bugs.launchpad.net/bugs/1827005/+attachment/5260223/+files/Scree=
n%20Shot%202019-04-30%20at%202.48.09%20PM.png

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1827005

Title:
  hvf: ubuntu iso boot menu issue

Status in QEMU:
  New

Bug description:
  With hvf acceleration on macOS, ubuntu server installation ISO boot
  language menu shows fractured images.

  To reproduce the issue:
  ./x86_64-softmmu/qemu-system-x86_64 -m 800 -accel hvf -cdrom ~/ubuntu-16.=
04.4-server-amd64.iso

  Control:
  ./x86_64-softmmu/qemu-system-x86_64 -m 800 -accel tcg -cdrom ~/ubuntu-16.=
04.4-server-amd64.iso

  Host: macOS Mojave 10.14.3
  Guest: Ubuntu Server 16.04.4 ISO
  QEMU: version 3.1.94 (v4.0.0-rc4)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1827005/+subscriptions

