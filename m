Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE4788F4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 11:56:23 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs2OE-0006ou-02
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 05:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33751)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hs2Nc-0006Mf-VB
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hs2Nb-0005De-R0
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:55:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:48354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hs2Nb-0005CR-L1
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:55:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hs2Na-0002DF-65
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:55:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 286F32E806F
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:55:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jul 2019 09:48:29 -0000
From: elmarco <marcandre.lureau@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marcandre-lureau zhaoby
X-Launchpad-Bug-Reporter: zhaoby (zhaoby)
X-Launchpad-Bug-Modifier: elmarco (marcandre-lureau)
References: <154539736525.20217.16347056739487632712.malonedeb@soybean.canonical.com>
Message-Id: <156439370923.10930.9406834064518464093.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a3f2d31f7aac52044b88253c8d7cb3b3ba45ec8a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1809453] Re: Windows qemu download Big file bug
 in net user mode
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
Reply-To: Bug 1809453 <1809453@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What is your version of qemu? I understand you are running qemu on
ubuntu.

The VM is windows? which version? Which URL are you downloading? What is
the program being used?

thanks


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809453

Title:
  Windows  qemu download Big file bug in net user mode

Status in QEMU:
  Incomplete

Bug description:
  hi

  Windows qemu with -net user downloading big files has a bug, -net tap
  is good!

  I suspect that the Slirp protocol has a bug on the Windows pc, which
  is normal on ubuntu.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809453/+subscriptions

