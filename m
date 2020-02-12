Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85615B42B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 23:56:41 +0100 (CET)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j20vw-0005Tt-Sn
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 17:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j20v9-00053K-6p
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 17:55:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j20v7-0004Lp-6S
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 17:55:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:49296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j20v7-0004JB-1G
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 17:55:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j20v5-0008AU-Nr
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 22:55:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9DA232E8078
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2020 22:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Feb 2020 22:47:19 -0000
From: crocket <crockabiscuit@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crockabiscuit laurent-vivier
X-Launchpad-Bug-Reporter: crocket (crockabiscuit)
X-Launchpad-Bug-Modifier: crocket (crockabiscuit)
References: <157762661516.5433.16221584605990009162.malonedeb@gac.canonical.com>
Message-Id: <158154763916.30296.5905313912066757526.malone@wampee.canonical.com>
Subject: [Bug 1857811] Re: qemu user static binary seems to lack support for
 network namespace.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: efeb14222ebe67b24a61d3bc0271ae2507d9951c
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
Reply-To: Bug 1857811 <1857811@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-4.0.0

> uname -a
Linux gentoo 4.19.97-gentoo #3 SMP PREEMPT Mon Feb 10 15:09:44 KST 2020 x86=
_64 AMD FX(tm)-8300 Eight-Core Processor AuthenticAMD GNU/Linux

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857811

Title:
  qemu user static binary seems to lack support for network namespace.

Status in QEMU:
  New

Bug description:
  Whenever I execute emerge in gentoo linux in qemu-aarch64 chroot, I
  see the following error message.

  Unable to configure loopback interface: Operation not supported

  If I disable emerge's network-sandbox which utilizes network
  namespace, the error disappears.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857811/+subscriptions

