Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12DDE75F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:06:49 +0200 (CEST)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMTeK-00031T-I8
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iMTdW-0002Y3-7J
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iMTdU-0004Gr-SI
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:05:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:55416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iMTdU-0004GT-MW
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:05:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iMTdT-0000hT-DW
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:05:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 63FEE2E80C9
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:05:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Oct 2019 08:57:27 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1848556@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Triaged; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=eoan; sourcepackage=qemu;
 component=main; status=Triaged; importance=Medium; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Triaged; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer rodsmith xanclic
X-Launchpad-Bug-Reporter: Rod Smith (rodsmith)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <157133449178.19203.719001918774596241.malonedeb@gac.canonical.com>
Message-Id: <157164824744.25789.7265872238255097751.malone@chaenomeles.canonical.com>
Subject: [Bug 1848556] Re: qemu-img check failing on remote image in Eoan
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6a611d053d3e0b4dda496e948ac1fffe3f7a50d3
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

Hi Max,
libcurl 7.65.3-1ubuntu3 and was >7.59 for several releases (more than a yea=
r at least) - so there must be something else going on that this triggers n=
ow.

But never the less with the fix from [1] I can again get it to work
successfully.

I think I should backport that to our qemu 4.0 in Ubunutu.
It seems to apply fine (just offset -3, no fuzz)
The former seem not affected e.g. qemu 3.1 along libcurl 7.64.0-2ubuntu1 do=
es not expose the behavior.

@Max - As the Author, just to check, do you see any issue backporting
that to qemu 4.0

[1]:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbfb23b480a49114315877aacf=
700b49453e0f9d9

** Also affects: qemu (Ubuntu Eoan)
   Importance: Undecided
       Status: New

** Also affects: qemu (Ubuntu Focal)
   Importance: Undecided
       Status: New

** Changed in: qemu (Ubuntu Focal)
       Status: New =3D> Triaged

** Changed in: qemu (Ubuntu Eoan)
       Status: New =3D> Triaged

** Changed in: qemu (Ubuntu Eoan)
   Importance: Undecided =3D> Medium

** Changed in: qemu (Ubuntu Focal)
   Importance: Undecided =3D> Medium

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1848556

Title:
  qemu-img check failing on remote image in Eoan

Status in QEMU:
  Confirmed
Status in qemu package in Ubuntu:
  Triaged
Status in qemu source package in Eoan:
  Triaged
Status in qemu source package in Focal:
  Triaged

Bug description:
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

