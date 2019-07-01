Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D0500C1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 06:30:52 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfGd1-0004Sd-Gc
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 00:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hfGc7-0003ya-Ib
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 00:29:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hfGc6-0004kN-GD
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 00:29:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:39748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hfGc6-0004hh-AZ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 00:29:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hfGc4-0003XV-Vf
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 04:29:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E136A2E80C8
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 04:29:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Jun 2019 04:17:17 -0000
From: Launchpad Bug Tracker <1577937@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth veskra
X-Launchpad-Bug-Reporter: Veskra (veskra)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160503205253.23902.44163.malonedeb@gac.canonical.com>
Message-Id: <156134983840.19349.4275078764090805571.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18989";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e9203918abab2d357faaa2ee64f1180d2d6b7d98
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1577937] Re: netbeans not working with std
 graphic driver
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
Reply-To: Bug 1577937 <1577937@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1577937

Title:
  netbeans not working with std graphic driver

Status in QEMU:
  Expired

Bug description:
  Qemu Version:
  QEMU emulator version 2.5.1, Copyright (c) 2003-2008 Fabrice Bellard

  Launching VM with:
  sudo qemu-system-x86_64 -enable-kvm -m 1024M ~/guest.vm -usb -vga std

  Guest:
  Kali Linux 2016.1
  Kernel:
  4.4.0-kali1-amd64
  Affected Arch:
  64bit & 32bit

  Netbeans failing to start after netbeans splash comes up. No netbeans win=
dow is being drawn.
  Problem can be reproduced.
  It IS working with -vga qxl, so maybe there's a bug in std emulation.

  output from netbeans log (more in attachement):

  SEVERE [global]
  java.lang.RuntimeException: failed to load system cursor: DnD.Cursor.Copy=
Drop : cannot load system cursor: CopyDrop.32x32

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1577937/+subscriptions

