Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B2149356
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jan 2020 05:27:37 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivD2m-0000MB-Va
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 23:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ivD1B-0007Ks-0Z
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 23:25:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ivD18-0000Pm-Dl
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 23:25:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:37000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ivD15-0000L3-Rk
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 23:25:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ivD13-0002uk-5k
 for <qemu-devel@nongnu.org>; Sat, 25 Jan 2020 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 27A772E80D3
 for <qemu-devel@nongnu.org>; Sat, 25 Jan 2020 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jan 2020 04:17:28 -0000
From: Launchpad Bug Tracker <1852781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntu-z-systems; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-20.04 s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: colin-king janitor paelzer th-huth
X-Launchpad-Bug-Reporter: Colin Ian King (colin-king)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157384084797.7162.9983011521410421204.malonedeb@gac.canonical.com>
Message-Id: <157992584871.32017.12366759333544870897.malone@loganberry.canonical.com>
Subject: [Bug 1852781] Re: qemu s390x on focal - applications breaking
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a13876f4b930b382b77cb62d2edd8b7432030b70
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
Reply-To: Bug 1852781 <1852781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for Ubuntu on IBM z Systems because there has been no activity
for 60 days.]

** Changed in: ubuntu-z-systems
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1852781

Title:
  qemu s390x on focal - applications breaking

Status in QEMU:
  Expired
Status in Ubuntu on IBM z Systems:
  Expired

Bug description:
  Running qemu-system-s390x (1:4.0+dfsg-0ubuntu10) on an x86-64 Focal
  host with an upgrade of a Eoan s390x VM to a Focal s390x is triggering
  random breakage, for example:

  sudo apt-get update && sudo apt-get dist-upgrade

  ...
  ...

  Unpacking debianutils (4.9) over (4.8.6.3) ...
  Setting up debianutils (4.9) ...
  Use of uninitialized value $ARGV[0] in string ne at /usr/sbin/update-mime=
 line 43.
  (Reading database ... 83640 files and directories currently installed.)
  Preparing to unpack .../bash_5.0-5ubuntu1_s390x.deb ...
  Unpacking bash (5.0-5ubuntu1) over (5.0-4ubuntu1) ...
  Setting up bash (5.0-5ubuntu1) ...
  [12124.788618] User process fault: interruption code 0007 ilc:3 in bash[2=
aa3d780000+149000]
  dpkg: error processing package bash (--configure):
   installed bash package post-installation script subprocess was killed by=
 signal (Floating point exception), core du
  mped
  Errors were encountered while processing:
   bash
  E: Sub-process /usr/bin/dpkg returned an error code (1)

  And now bash is completely broken:

  cking@eoan-s390x:~$ bash
  [12676.204389] User process fault: interruption code 0007 ilc:3 in bash[2=
aa14780000+149000]

  Floating point exception (core dumped)

  The upgrade works OK on a s390x, so I'm assuming it's something to do
  with the qemu emulation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1852781/+subscriptions

