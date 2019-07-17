Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443406BEDA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 17:11:41 +0200 (CEST)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnlam-0003me-EM
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 11:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54638)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hnla9-0001Pk-Mb
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hnla8-0001zi-IW
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:60680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hnla8-0001yy-CP
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:11:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hnla7-0006wc-M3
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 15:10:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9D0352E80BA
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 15:10:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jul 2019 15:04:50 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc64
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee ivmn jlsantiago0 mark-cave-ayland
X-Launchpad-Bug-Reporter: Jose Santiago (jlsantiago0)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <155812687142.26079.4364411221525864419.malonedeb@soybean.canonical.com>
Message-Id: <156337589060.1096.12626132991631170188.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19009";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: e36e0fe55f6c370e23f7eae8de65f51569dc52f9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829576] Re: QEMU-SYSTEM-PPC64 Regression
 QEMU-4.0.0
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
Reply-To: Bug 1829576 <1829576@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this fixed now? Can we mark as fix committed?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829576

Title:
  QEMU-SYSTEM-PPC64 Regression QEMU-4.0.0

Status in QEMU:
  New

Bug description:
  I have been using QEMU-SYSTEM-PPC64 v3.1.0 to run CentOS7 PPC emulated
  system. It stopped working when I upgraded to QEMU-4.0.0 . I
  downgraded back to QEMU-3.1.0 and it started working again. The
  problem is that my CentOS7 image will not boot up udner QEMU-4.0.0,
  but works fine under QEMU-3.1.0.

  I have an QCOW2 image available at
  https://www.mediafire.com/file/d8dda05ro85whn1/linux-
  centos7-ppc64.qcow2/file . NOTE: It is 15GB. Kind of large.

  I run it as follows:

     qemu-system-ppc64 \
        -name "CENTOS7-PPC64" \
        -cpu POWER7 -machine pseries \
        -m 4096 \
        -netdev bridge,id=3Dnetbr0,br=3Dbr0 \
        -device e1000,netdev=3Dnetbr0,mac=3D52:54:3c:13:21:33 \
        -hda "./linux-centos7-ppc64.qcow2" \
        -monitor stdio

  HOST: I am using Manjaro Linux on an Intel i7 machine with the QEMU
  packages installed via the package manager of the distribution.

  [jsantiago@jlsws0 ~]$ uname -a
  Linux jlsws0.haivision.com 4.19.42-1-MANJARO #1 SMP PREEMPT Fri May 10 20=
:52:43 UTC 2019 x86_64 GNU/Linux

  jsantiago@jlsws0 ~]$ cpuinfo =

  Intel(R) processor family information utility, Version 2019 Update 3 Buil=
d 20190214 (id: b645a4a54)
  Copyright (C) 2005-2019 Intel Corporation.  All rights reserved.

  =3D=3D=3D=3D=3D  Processor composition  =3D=3D=3D=3D=3D
  Processor name    : Intel(R) Core(TM) i7-6700K  =

  Packages(sockets) : 1
  Cores             : 4
  Processors(CPUs)  : 8
  Cores per package : 4
  Threads per core  : 2

  =3D=3D=3D=3D=3D  Processor identification  =3D=3D=3D=3D=3D
  Processor	Thread Id.	Core Id.	Package Id.
  0       	0   		0   		0   =

  1       	0   		1   		0   =

  2       	0   		2   		0   =

  3       	0   		3   		0   =

  4       	1   		0   		0   =

  5       	1   		1   		0   =

  6       	1   		2   		0   =

  7       	1   		3   		0   =

  =3D=3D=3D=3D=3D  Placement on packages  =3D=3D=3D=3D=3D
  Package Id.	Core Id.	Processors
  0   		0,1,2,3		(0,4)(1,5)(2,6)(3,7)

  =3D=3D=3D=3D=3D  Cache sharing  =3D=3D=3D=3D=3D
  Cache	Size		Processors
  L1	32  KB		(0,4)(1,5)(2,6)(3,7)
  L2	256 KB		(0,4)(1,5)(2,6)(3,7)
  L3	8   MB		(0,1,2,3,4,5,6,7)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829576/+subscriptions

