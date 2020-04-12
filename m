Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9601A5C9C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Apr 2020 06:27:29 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNUDP-0000mr-Lv
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 00:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jNUBy-0008Ij-67
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 00:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jNUBx-0001F1-4A
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:43826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jNUBw-0001Ej-VN
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 00:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jNUBv-0006M0-Gy
 for <qemu-devel@nongnu.org>; Sun, 12 Apr 2020 04:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 642372E8112
 for <qemu-devel@nongnu.org>; Sun, 12 Apr 2020 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Apr 2020 04:17:30 -0000
From: Launchpad Bug Tracker <1663079@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor manuel-arguelles th-huth
X-Launchpad-Bug-Reporter: Paco (manuel-arguelles)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170209005538.4996.16948.malonedeb@wampee.canonical.com>
Message-Id: <158666505020.12794.14812831443059983804.malone@loganberry.canonical.com>
Subject: [Bug 1663079] Re: socket network not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f910d6f24434e5a11e3e9141f19c8a04e9bdc1b1
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
Reply-To: Bug 1663079 <1663079@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1663079

Title:
  socket network not working

Status in QEMU:
  Expired

Bug description:
  The socket network type is no longer working in 2.8.0.

  When trying to establish a network between 2 qemu instances:

  The listening host:
  qemu-system-x86_64 -netdev socket,id=3Din0,listen=3D127.0.0.1:9999 -devic=
e virtio-net-pci,netdev=3Din0

  works fine, but for the second one:

  qemu-system-x86_64 -netdev socket,id=3Din0,connect=3D127.0.0.1:9999
  -device virtio-net-pci,netdev=3Din0

  It fails with:

  qemu-system-x86_64: -device virtio-net-pci,netdev=3Din0: Property
  'virtio-net-device.netdev' can't find value 'in0'

  netstat shows a new connection to port 9999 in time_wait state every
  time.

  host: kernel 4.4.38, 64bits.

  It was working fine with previous version.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1663079/+subscriptions

