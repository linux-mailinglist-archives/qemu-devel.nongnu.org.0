Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96847F0F7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 09:12:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLMw8-0004Q9-P9
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 03:12:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLMua-0003WW-VI
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hLMuZ-0002rW-Ge
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:46916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hLMuZ-0002r6-BG
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:10:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hLMuY-00043U-9F
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 07:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 3B5C22E80C7
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 07:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Apr 2019 07:02:30 -0000
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
References: <155660771706.7289.11621855018434071577.malonedeb@chaenomeles.canonical.com>
Message-Id: <155660775106.16851.1722164425161791880.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18928";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 25ae3faae201bc54ec81c46917a258fbd7b3c4f0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1827005] Re: hvf: ubuntu iso boot menu issue
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

** Attachment added: "normal case(tcg)"
   https://bugs.launchpad.net/qemu/+bug/1827005/+attachment/5260224/+files/=
Screen%20Shot%202019-04-30%20at%202.53.08%20PM.png

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

