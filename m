Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1B71DBA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 19:30:57 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpycq-0008Pv-62
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 13:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hpycc-000814-0n
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 13:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hpyca-00032L-SN
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 13:30:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:48256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hpyca-00031X-LJ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 13:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hpycZ-00018R-6E
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 17:30:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2778F2E80C8
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 17:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jul 2019 17:20:58 -0000
From: Randy Rhoads <1837651@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: randy3
X-Launchpad-Bug-Reporter: Randy Rhoads (randy3)
X-Launchpad-Bug-Modifier: Randy Rhoads (randy3)
Message-Id: <156390245893.17717.9714318475636842772.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: de6ff16c5c28cc0f556a3495096ba6f60c7badc7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1837651] [NEW] -netdev socket uses 100% cpu on
 Windows host
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
Reply-To: Bug 1837651 <1837651@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

On Windows hosts, any `-netdev socket` option (tcp listen, tcp connect,
udp passing a fd) causes qemu to use 100% cpu. The guest still runs, but
only sluggishly.

A simple testcase is:

> qemu-system-i386.exe -netdev socket,listen=3D:8000,id=3Dn

And, in another command prompt:

> echo foo | nc.exe localhost 8000

Where nc.exe is netcat.

Tested on qemu 3.1 (from https://qemu.weilnetz.de/w64/) and 4.0 (self
compiled).

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837651

Title:
  -netdev socket uses 100% cpu on Windows host

Status in QEMU:
  New

Bug description:
  On Windows hosts, any `-netdev socket` option (tcp listen, tcp
  connect, udp passing a fd) causes qemu to use 100% cpu. The guest
  still runs, but only sluggishly.

  A simple testcase is:

  > qemu-system-i386.exe -netdev socket,listen=3D:8000,id=3Dn

  And, in another command prompt:

  > echo foo | nc.exe localhost 8000

  Where nc.exe is netcat.

  Tested on qemu 3.1 (from https://qemu.weilnetz.de/w64/) and 4.0 (self
  compiled).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837651/+subscriptions

