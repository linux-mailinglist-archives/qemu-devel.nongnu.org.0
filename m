Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BC2BC753
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 17:55:51 +0100 (CET)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgseT-0008L0-HM
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 11:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgsdf-0007jm-My
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 11:54:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:50466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgsdb-0007QU-01
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 11:54:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgsdW-0005GN-1R
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 16:54:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F05A92E813D
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 16:54:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2020 16:41:11 -0000
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
 <160600091066.32168.576608806302061569.malone@chaenomeles.canonical.com>
Message-Id: <20201122164111.xw2fk234ihsuiwpl@tansi.org>
Subject: Re: [Bug 645662] Re: QEMU x87 emulation of trig and other complex ops
 is only at 64-bit precision, not 80-bit
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: a5db10cf456b7df57e56e4aa05e58bb0d4e9afc6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 645662 <645662@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Talk about a "blast form the past!" This Bug is now over 10 years old. =

But at least somebody is still working on it and it was not
just quietly dropped. I can respect that. =


My original recommendation stands: At least use long double for the
calcuations where available. =


Regards,
Arno

On Sun, Nov 22, 2020 at 00:21:50 CET, Peter Maydell wrote:
> For 5.1 (commits 1f18a1e6ab8368a4, 5eebc49d2d0aa5fc7e,
> 5ef396e2ba865f34a, eca30647fc078f4) we reimplemented FPATAN, FYL2X,
> FYL2XP1, FPREM, FPREM1, F2XM1 to do proper 80-bit precision operations.
> However the trig operations FPTAN, FSINCOS, FSIN, FCOS are still
> implemented as naive "convert to host double and use host C library
> functions".
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

