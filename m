Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC5E6CA5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 08:03:37 +0100 (CET)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOz3w-0000jc-0b
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 03:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iOz1O-0006zI-2R
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iOz1M-0006qM-P4
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:00:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:56098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iOz1M-0006ng-J0
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iOz1K-0007zl-L3
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 07:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9CA3F2E80C3
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 07:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Oct 2019 06:52:22 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1848556@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Triaged; importance=Medium; assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=eoan; sourcepackage=qemu;
 component=main; status=Triaged; importance=Medium;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Triaged; importance=Medium;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer rodsmith xanclic
X-Launchpad-Bug-Reporter: Rod Smith (rodsmith)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <157133449178.19203.719001918774596241.malonedeb@gac.canonical.com>
Message-Id: <157224554289.28519.4929491490425157426.malone@chaenomeles.canonical.com>
Subject: [Bug 1848556] Re: qemu-img check failing on remote image in Eoan
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="469f241f4e73cc0bdffa4e30654052a2af068e06";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8d47c527b0393f99d2bac0e8e69e3df7ada811c1
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
Reply-To: Bug 1848556 <1848556@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that Focal is open I have opened proper Focal MP replacing the old one =
and also an Eoan SRU MP right away.
=3D> https://code.launchpad.net/~paelzer/ubuntu/+source/qemu/+git/qemu/+mer=
ge/374770
=3D> https://code.launchpad.net/~paelzer/ubuntu/+source/qemu/+git/qemu/+mer=
ge/374771

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1848556

Title:
  qemu-img check failing on remote image in Eoan

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Triaged
Status in qemu source package in Eoan:
  Triaged
Status in qemu source package in Focal:
  Triaged

Bug description:
  Ubuntu SRU Template:

  [Impact]

   * There is fallout due to changes in libcurl that affect qemu and might =

     lead to a hang.

   * Fix by backporting the upstream fix

  [Test Case]

   * If you have network just run
     $ qemu-img check http://10.193.37.117/cloud/eoan-server-cloudimg-amd64=
.img

   * Without network, install apache2, and get a complex qemu file (like a =

     cloud image) onto the system. Then access the file via apache http but =

     not localhost (that would work)

  [Regression Potential]

   * The change is local to the libcurl usage of qemu, so that could be =

     affected. But then this is what has been found to not work here, so I'=
d =

     expect not too much trouble. But if so then in the curl usage (which =

     means disks on http)

  [Other Info]
   =

   * n/a

  ---

  The "qemu-img check" function is failing on remote (HTTP-hosted)
  images, beginning with Ubuntu 19.10 (qemu-utils version 1:4.0+dfsg-
  0ubuntu9). With previous versions, through Ubuntu 19.04/qemu-utils
  version 1:3.1+dfsg-2ubuntu3.5, the following worked:

  $ /usr/bin/qemu-img check  http://10.193.37.117/cloud/eoan-server-cloudim=
g-amd64.img
  No errors were found on the image.
  19778/36032 =3D 54.89% allocated, 90.34% fragmented, 89.90% compressed cl=
usters
  Image end offset: 514064384

  The 10.193.37.117 server holds an Apache server that hosts the cloud
  images on a LAN. Beginning with Ubuntu 19.10/qemu-utils 1:4.0+dfsg-
  0ubuntu9, the same command never returns. (I've left it for up to an
  hour with no change.) I'm able to wget the image from the same server
  and installation on which qemu-img check fails. I've tried several
  .img files on the server, ranging from Bionic to Eoan, with the same
  results with all of them.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1848556/+subscriptions

