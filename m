Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E0023F5A3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Aug 2020 02:52:22 +0200 (CEST)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4D5w-0003AG-Ko
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 20:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k4D4p-0002jQ-Os
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 20:51:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:45482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k4D4l-0006IB-0r
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 20:51:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k4D4i-0005ub-Uj
 for <qemu-devel@nongnu.org>; Sat, 08 Aug 2020 00:51:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E7BD12E804F
 for <qemu-devel@nongnu.org>; Sat,  8 Aug 2020 00:51:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2020 00:43:38 -0000
From: Launchpad Bug Tracker <1883984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Triaged; importance=Medium;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp janitor nhfbeebe rth
X-Launchpad-Bug-Reporter: Nelson H F Beebe (nhfbeebe)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159243063748.16697.11009205973276249282.malonedeb@chaenomeles.canonical.com>
Message-Id: <159684742355.462.15712908715015676576.malone@ackee.canonical.com>
Subject: [Bug 1883984] Re: QEMU S/390x sqxbr (128-bit IEEE 754 square root)
 crashes qemu-system-s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cad0beca7efd12463a22d14bc871690ab131d74b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 20:51:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1883984 <1883984@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug was fixed in the package qemu - 1:5.0-5ubuntu4

---------------
qemu (1:5.0-5ubuntu4) groovy; urgency=3Dmedium

  * xen: provide compat links to what libxen-dev reports where to find
    the binaries (LP: #1890005)
  * d/p/ubuntu/lp-1883984-target-s390x-Fix-SQXBR.patch: avoid crash on
    SQXBR (LP: #1883984)
  * d/p/lp-1890154-*: fix -no-reboot on s390x secure boot (LP: #1890154)

 -- Christian Ehrhardt <christian.ehrhardt@canonical.com>  Mon, 03 Aug
2020 07:15:28 +0200

** Changed in: qemu (Ubuntu)
       Status: In Progress =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883984

Title:
  QEMU S/390x sqxbr (128-bit IEEE 754 square root) crashes qemu-system-
  s390x

Status in QEMU:
  Fix Committed
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Triaged

Bug description:
  In porting software to guest Ubuntu 18.04 and 20.04 VMs for S/390x, I dis=
covered
  that some of my own numerical programs, and also a GNU configure script f=
or at
  least one package with CC=3Dclang, would cause an instant crash of the VM=
, sometimes
  also destroying recently opened files, and producing long strings of NUL =
characters
  in /var/log/syslog in the S/390 guest O/S.

  Further detective work narrowed the cause of the crash down to a single I=
BM S/390
  instruction: sqxbr (128-bit IEEE 754 square root).  Here is a one-line pr=
ogram
  that when compiled and run on a VM hosted on QEMUcc emulator version 4.2.=
0 =

  (Debian 1:4.2-3ubuntu6.1) [hosted on Ubuntu 20.04 on a Dell Precision 792=
0 =

  workstation with an Intel Xeon Platinum 8253 CPU],  and also on QEMU emul=
ator =

  version 5.0.0, reproducibly produces a VM crash under qemu-system-s390x.

  % cat bug-sqrtl-one-line.c
  int main(void) { volatile long double x, r; x =3D 4.0L; __asm__ __volatil=
e__("sqxbr %0, %1" : "=3Df" (r) : "f" (x)); return (0);}

  % cc bug-sqrtl-one-line.c && ./a.out
  Segmentation fault (core dumped)

  The problem code may be the function float128_sqrt() defined in qemu-5.0.=
0/fpu/softfloat.c
  starting at line 7619.  I have NOT attempted to run the qemu-system-s390x=
 executable
  under a debugger.  However, I observe that S/390 is the only CPU family t=
hat I know of,
  except possibly for a Fujitsu SPARC-64, that has a 128-bit square root in=
 hardware.
  Thus, this instruction bug may not have been seen before.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883984/+subscriptions

