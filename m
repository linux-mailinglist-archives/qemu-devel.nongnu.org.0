Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562B2271E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 18:05:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSOJE-0001OX-Ae
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 12:05:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hSOEx-0006tj-Ek
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hSOEw-0007FS-8k
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:00:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:47568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hSOEw-0007Ez-3B
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:00:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hSOEu-000272-8u
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 16:00:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 428052E80CC
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 16:00:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 May 2019 15:52:23 -0000
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc64
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ivmn jlsantiago0 mark-cave-ayland
X-Launchpad-Bug-Reporter: Jose Santiago (jlsantiago0)
X-Launchpad-Bug-Modifier: Ivan Warren (ivmn)
References: <155812687142.26079.4364411221525864419.malonedeb@soybean.canonical.com>
Message-Id: <155828114316.15638.7357231494953184129.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 3471878e4155da42b1fd21caab3c7ce45435ad47
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829576] Re: QEMU-SYSTEM-PPC64 Regression
 QEMU-4.0.0
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Ivan Warren via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Bug 1829576 <1829576@bugs.launchpad.net>
Cc: Ivan Warren <ivan@vmfacility.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same thing here using https://github.com/dgibson/qemu/commits/ppc-
for-4.1 ... It might be a completely different problem (athough it looks
like a MMU problem).

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

