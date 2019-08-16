Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57B90659
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 19:01:29 +0200 (CEST)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyfbU-000168-Gs
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 13:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyfaJ-0000Y1-QJ
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 13:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyfaI-0001Eo-Cv
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 13:00:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:51056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyfaI-0001EB-7L
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 13:00:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyfaH-0000Bc-0n
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 17:00:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 901F22E80CB
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 17:00:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 16:46:06 -0000
From: Arno Wagner <645662@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arno-wagner pmaydell th-huth wagner-tansi
X-Launchpad-Bug-Reporter: Arno Wagner (wagner-tansi)
X-Launchpad-Bug-Modifier: Arno Wagner (arno-wagner)
References: <20100923002702.20683.97345.malonedeb@soybean.canonical.com>
 <156596438916.26483.10355280680334978106.malone@soybean.canonical.com>
Message-Id: <20190816164606.GA3850@tansi.org>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 70013caf4f25226de1f38d0c8d8244e8fe42d2a4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 645662] Re: QEMU x87 emulation of trig and
 other complex ops is only at 64-bit precision, not 80-bit
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
Reply-To: Bug 645662 <645662@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fine by me. I suggest to keep tracking this though, if necessary
in another bug item.

Regards,
Arno


On Fri, Aug 16, 2019 at 16:06:29 CEST, Peter Maydell wrote:
> Looking at our code we're still implementing the x87 insns FSIN, FCOS,
> FSINCOS, FPTAN, FPATAN, F2XM1, FYL2X, FYL2XP1 by "convert the floatx80
> to a host double and use the host C library functions", so I think this
> bug is still unfixed. If the C program in comment 1 and/or the Python
> code has stopped reporting failures it's probably just because the guest
> C library routines have stopped using the x87 80-bit FPU instructions
> internally.
> =

> =

> ** Changed in: qemu
>        Status: Fix Released =3D> Confirmed
> =

> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/645662
> =

> Title:
>   QEMU x87 emulation of trig and other complex ops is only at 64-bit
>   precision, not 80-bit
> =

> Status in QEMU:
>   Confirmed
> =

> Bug description:
>   When doing the regression tests for Python 3.1.2 with Qemu 0.12.5, (Lin=
ux version 2.6.26-2-686 (Debian 2.6.26-25lenny1)),
>   gcc (Debian 4.3.2-1.1) 4.3.2, Python compiled from sources within qemu,
>   3 math tests fail, apparently because the floating point unit is buggy.=
 Qmeu was compiled from original sources
>   on Debian Lenny with kernel  2.6.34.6 from kernel.org, gcc  (Debian 4.3=
.2-1.1) 4.3. =

> =

>   Regression testing errors:
> =

>   test_cmath
>   test test_cmath failed -- Traceback (most recent call last):
>     File "/root/tools/python3/Python-3.1.2/Lib/test/test_cmath.py", line =
364, in
>       self.fail(error_message)
>   AssertionError: acos0034: acos(complex(-1.0000000000000002, 0.0))
>   Expected: complex(3.141592653589793, -2.1073424255447014e-08)
>   Received: complex(3.141592653589793, -2.1073424338879928e-08)
>   Received value insufficiently close to expected value.
> =

>   =

>   test_float
>   test test_float failed -- Traceback (most recent call last):
>     File "/root/tools/python3/Python-3.1.2/Lib/test/test_float.py", line =
479, in
>       self.assertEqual(s, repr(float(s)))
>   AssertionError: '8.72293771110361e+25' !=3D '8.722937711103609e+25'
> =

>   =

>   test_math
>   test test_math failed -- multiple errors occurred; run in verbose mode =
for deta
> =

>   =3D>
> =

>   runtests.sh -v test_math
> =

>   le01:~/tools/python3/Python-3.1.2# ./runtests.sh -v test_math
>   test_math BAD
>    1 BAD
>    0 GOOD
>    0 SKIPPED
>    1 total
>   le01:~/tools/python3/Python-3.1.2#
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/645662/+subscriptions

-- =

Arno Wagner,     Dr. sc. techn., Dipl. Inform.,    Email: arno@wagner.name
GnuPG: ID: CB5D9718  FP: 12D6 C03B 1B30 33BB 13CF  B774 E35C 5FA1 CB5D 9718
----
A good decision is based on knowledge and not on numbers. -- Plato

If it's in the news, don't worry about it.  The very definition of =

"news" is "something that hardly ever happens." -- Bruce Schneier

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/645662

Title:
  QEMU x87 emulation of trig and other complex ops is only at 64-bit
  precision, not 80-bit

Status in QEMU:
  Confirmed

Bug description:
  When doing the regression tests for Python 3.1.2 with Qemu 0.12.5, (Linux=
 version 2.6.26-2-686 (Debian 2.6.26-25lenny1)),
  gcc (Debian 4.3.2-1.1) 4.3.2, Python compiled from sources within qemu,
  3 math tests fail, apparently because the floating point unit is buggy. Q=
meu was compiled from original sources
  on Debian Lenny with kernel  2.6.34.6 from kernel.org, gcc  (Debian 4.3.2=
-1.1) 4.3. =


  Regression testing errors:

  test_cmath
  test test_cmath failed -- Traceback (most recent call last):
    File "/root/tools/python3/Python-3.1.2/Lib/test/test_cmath.py", line 36=
4, in
      self.fail(error_message)
  AssertionError: acos0034: acos(complex(-1.0000000000000002, 0.0))
  Expected: complex(3.141592653589793, -2.1073424255447014e-08)
  Received: complex(3.141592653589793, -2.1073424338879928e-08)
  Received value insufficiently close to expected value.

  =

  test_float
  test test_float failed -- Traceback (most recent call last):
    File "/root/tools/python3/Python-3.1.2/Lib/test/test_float.py", line 47=
9, in
      self.assertEqual(s, repr(float(s)))
  AssertionError: '8.72293771110361e+25' !=3D '8.722937711103609e+25'

  =

  test_math
  test test_math failed -- multiple errors occurred; run in verbose mode fo=
r deta

  =3D>

  runtests.sh -v test_math

  le01:~/tools/python3/Python-3.1.2# ./runtests.sh -v test_math
  test_math BAD
   1 BAD
   0 GOOD
   0 SKIPPED
   1 total
  le01:~/tools/python3/Python-3.1.2#

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/645662/+subscriptions

