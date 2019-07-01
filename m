Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0918E4C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 18:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOm8J-0007XB-Em
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 12:42:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hOm6H-0005uy-92
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hOm6G-0001QC-3r
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:40:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:57478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hOm6F-0001Pb-Re
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hOm6E-00078c-ER
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 16:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 68E5D2E800F
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 16:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 May 2019 16:31:40 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fonthime pmaydell
X-Launchpad-Bug-Reporter: Gwendolyn Haller (fonthime)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <155609911336.14005.5630723939838624325.malonedeb@gac.canonical.com>
Message-Id: <155741950051.32626.9595788297650951212.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18961";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 691022d6c45c910dc14066d4f2d1a97f995d333e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1826172] Re: Compilation on MSYS2/MinGW-w64 fails
 with error: "__USE_MINGW_ANSI_STDIO" redefined
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
Reply-To: Bug 1826172 <1826172@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; thanks for this bug report. It should be fixed by commit
946376c21be1cd9dcc3c7 in git master, which will be in the 4.1 release.


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826172

Title:
  Compilation on MSYS2/MinGW-w64 fails with error:
  "__USE_MINGW_ANSI_STDIO" redefined

Status in QEMU:
  Fix Committed

Bug description:
  Compilation against GIT master fails at the following step:

  =C2=A0=C2=A0CC      qga/commands.o
  In file included from qga/commands.c:13:
  C:/Tempy-chan/qemu/include/qemu/osdep.h:97: error: "__USE_MINGW_ANSI_STDI=
O" redefined [-Werror]
  =C2=A0#define __USE_MINGW_ANSI_STDIO 1

  In file included from C:/msys64/mingw64/x86_64-w64-mingw32/include/vadefs=
.h:9,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from C:/msys64/mingw64/x86_64-w64-mingw32/inc=
lude/_mingw_stdarg.h:14,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from C:/msys64/mingw64/x86_64-w64-mingw32/inc=
lude/stdarg.h:140,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from C:/msys64/mingw64/lib/gcc/x86_64-w64-min=
gw32/8.3.0/include/stdarg.h:1,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from C:/Tempy-chan/qemu/include/qemu/osdep.h:=
88,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from qga/commands.c:13:
  C:/msys64/mingw64/x86_64-w64-mingw32/include/_mingw.h:431: note: this is =
the location of the previous definition
  =C2=A0#define __USE_MINGW_ANSI_STDIO 0      /* was not defined so it shou=
ld be 0 */

  cc1.exe: all warnings being treated as errors
  make: *** [/c/Tempy-chan/qemu/rules.mak:69: qga/commands.o] Error 1

  Passing --extra-cflags=3D"-D__USE_MINGW_ANSI_STDIO" to configure
  resolves the error. Digging deeper in
  x86_64-w64-mingw32/include/_mingw.h, it looks like
  __USE_MINGW_ANSI_STDIO is only defined for _GNU_SOURCE in C++
  compilation. With C only code it's ignored and doesn't define
  __USE_MINGW_ANSI_STDIO as expected:

  /* We are activating __USE_MINGW_ANSI_STDIO for various define indicators.
  =C2=A0=C2=A0=C2=A0Note that we enable it also for _GNU_SOURCE in C++, but=
 not for C case. */
  #if (defined (_POSIX) || defined (_POSIX_SOURCE) || defined (_POSIX_C_SOU=
RCE) \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|| defined (_ISOC99_SOURCE) \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|| defined (_XOPEN_SOURCE) || defined (_XOP=
EN_SOURCE_EXTENDED) \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|| (defined (_GNU_SOURCE) && defined (__cpl=
usplus)) \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|| defined (_SVID_SOURCE)) \
  =C2=A0=C2=A0=C2=A0=C2=A0&& !defined(__USE_MINGW_ANSI_STDIO)
  /* Enable __USE_MINGW_ANSI_STDIO if _POSIX defined
  =C2=A0* and If user did _not_ specify it explicitly... */
  #  define __USE_MINGW_ANSI_STDIO			1
  #endif

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826172/+subscriptions

