Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12815802D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 17:52:11 +0100 (CET)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1CI6-0001g3-Nh
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 11:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j1CGh-0001Ex-VT
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j1CGg-0007VE-8e
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:50:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:42862)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j1CGg-0007Se-2r
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:50:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j1CGd-0002Wo-Ji
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 16:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7B82D2E80C7
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 16:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Feb 2020 16:43:39 -0000
From: Thierry Briot <1862619@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier tebounet
X-Launchpad-Bug-Reporter: Thierry Briot (tebounet)
X-Launchpad-Bug-Modifier: Thierry Briot (tebounet)
References: <158133547000.19789.14380673630783179726.malonedeb@wampee.canonical.com>
Message-Id: <158135302001.26327.5993481167014171135.malone@soybean.canonical.com>
Subject: [Bug 1862619] Re: "-serial telnet::xxxx,
 server" causes "Device 'serial0' is in use"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 94c6253452d24a40a094bb149f2116cc275bddea
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
Reply-To: Bug 1862619 <1862619@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If I use an installation support HP-UX 11.00, the installation starts autom=
atically. Then, it finds no disk for installation, but I will work on the d=
rive option of qemu to resolve this trouble.
Thanks a lot for your help !

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862619

Title:
  "-serial telnet::xxxx,server" causes "Device 'serial0' is in use"

Status in QEMU:
  New

Bug description:
  I start qemu version 4.2.50 in a first terminal :

  $ sudo ./qemu-system-hppa -boot d -serial telnet::4441,server -drive
  if=3Dscsi,bus=3D0,index=3D6,file=3D./hpux.img,format=3Draw -serial mon:st=
dio -D
  /tmp/foo -nographic -m 512 -d nochain -cdrom
  ./HPUX_9.05_Installation_Disc_S700.iso -D /tmp/foo -net
  nic,model=3Dtulip  -net tap

  qemu-system-hppa: -serial telnet::4441,server: info: QEMU waiting for
  connection on: disconnected:telnet:0.0.0.0:4441,server

  In another terminal, I launch "telnet localhost 4441"

  And in the qemu window I have the following error:

  Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:220:
  qemu-system-hppa: Device 'serial0' is in use

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862619/+subscriptions

