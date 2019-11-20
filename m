Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C31036BC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 10:38:04 +0100 (CET)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXMR1-0006Ji-KZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 04:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iXMOp-0004yU-03
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iXMOn-0003ry-RC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:35:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:56138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iXMOn-0003rD-Lq
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:35:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iXMOl-000878-JA
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 09:35:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7276A2E80C8
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 09:35:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Nov 2019 09:22:10 -0000
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gkurz philmd th-huth wzis
X-Launchpad-Bug-Reporter: wzis (wzis)
X-Launchpad-Bug-Modifier: Greg Kurz (gkurz)
References: <157413352600.6824.7282626865462030571.malonedeb@gac.canonical.com>
Message-Id: <157424173100.22292.11046728314953589871.malone@chaenomeles.canonical.com>
Subject: [Bug 1853083] Re: qemu ppc64 4.0 boot AIX5.1 hung
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 66903dc8dd4277234412f287a750ab15bc347ca2
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
Reply-To: Bug 1853083 <1853083@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Answering comment #4:
> What I don't understand is ppc64 for IBM machine emulation, but qemu ppc64
> can't support AIX most of the time, but can support Linux on power very w=
ell.

QEMU doesn't implement the full PAPR specification. Historically we've only
added the bits that are essential for a Linux guest to be happy.

AIX 5.1 is fairly old and neither IBM, nor the QEMU community invested time
and effort in getting it to work under QEMU. AIX being a closed source OS
certainly didn't help things to go forward.

Things have changed recently though. IBM added virtio drivers and some
workarounds to AIX, as well some fixes to QEMU. Latest AIX 7.2 releases
should now be able to run under QEMU with a POWER8 or newer CPU model.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1853083

Title:
  qemu ppc64 4.0 boot AIX5.1 hung

Status in QEMU:
  Incomplete

Bug description:
  When boot AIX5.1 from cdrom device, qemu hung there, no further info
  is displayed and cpu consumption is high.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1853083/+subscriptions

