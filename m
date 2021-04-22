Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E855E36797A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:48:35 +0200 (CEST)
Received: from localhost ([::1]:36762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSCT-0007I5-OQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS5P-0001uD-V7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:41:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:52712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS5N-0005wY-9H
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:41:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZS5M-0004Yh-7Q
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:41:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 258E72E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:41:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:30:55 -0000
From: Thomas Huth <1737444@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user sh4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151294713207.10703.11276532235992679828.malonedeb@wampee.canonical.com>
Message-Id: <161906945591.23416.16559000099180025591.malone@gac.canonical.com>
Subject: [Bug 1737444] Re: gccgo setcontext conftest crashes qemu-sh4
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 204770e1f47a6d3b0416093c230944fdda62ae45
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1737444 <1737444@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1737444

Title:
  gccgo setcontext conftest crashes qemu-sh4

Status in QEMU:
  Incomplete

Bug description:
  While testing gccgo on sh4 to add SH platform definitions to libgo, I
  discovered that the following conftest program which is part of the
  libgo configure script crashes on qemu-sh4:

  (sid-sh4-sbuild)root@z6:/# cat setcontext.c
  #include <pthread.h>                                                     =
                                                                           =
                                                                           =
                                                =

  #include <stdlib.h>                                                      =
                                                                           =
                                                                           =
                                                =

  #include <ucontext.h>                                                    =
                                                                           =
                                                                           =
                                                =

  #include <unistd.h>                                                      =
                                                                           =
                                                                           =
                                                =


  __thread int tls;

  static char stack[10 * 1024 * 1024];
  static ucontext_t c;

  /* Called via makecontext/setcontext.  */

  static void
  cfn (void)
  {
    exit (tls);
  }

  /* Called via pthread_create.  */

  static void *
  tfn (void *dummy)
  {
    /* The thread should still see this value after calling
       setcontext.  */
    tls =3D 0;

    setcontext (&c);

    /* The call to setcontext should not return.  */
    abort ();
  }

  int
  main ()
  {
    pthread_t tid;

    /* The thread should not see this value.  */
    tls =3D 1;

    if (getcontext (&c) < 0)
      abort ();

    c.uc_stack.ss_sp =3D stack;
  #ifdef MAKECONTEXT_STACK_TOP                                             =
                                                                           =
                                                                           =
                                                =

    c.uc_stack.ss_sp +=3D sizeof stack;
  #endif                                                                   =
                                                                           =
                                                                           =
                                                =

    c.uc_stack.ss_flags =3D 0;
    c.uc_stack.ss_size =3D sizeof stack;
    c.uc_link =3D NULL;
    makecontext (&c, cfn, 0);

    if (pthread_create (&tid, NULL, tfn, NULL) !=3D 0)
      abort ();

    if (pthread_join (tid, NULL) !=3D 0)
      abort ();

    /* The thread should have called exit.  */
    abort ();
  }

  (sid-sh4-sbuild)root@z6:/# gcc -o setcontext -lpthread setcontext.c
  (sid-sh4-sbuild)root@z6:/# ./setcontext =

  Unhandled trap: 0x180
  pc=3D0x7f69235e sr=3D0x00000000 pr=3D0x00400710 fpscr=3D0x00080000
  spc=3D0x00000000 ssr=3D0x00000000 gbr=3D0x7f658478 vbr=3D0x00000000
  sgr=3D0x00000000 dbr=3D0x00000000 delayed_pc=3D0x7f692320 fpul=3D0x000000=
00
  r0=3D0x00e11158 r1=3D0x00000000 r2=3D0x00000001 r3=3D0x7ffff2e0
  r4=3D0x00e11068 r5=3D0x7ffff314 r6=3D0x7ffff31c r7=3D0x00000000
  r8=3D0x004007b0 r9=3D0x00000000 r10=3D0x00000000 r11=3D0x00000000
  r12=3D0x7f79ac54 r13=3D0x00000000 r14=3D0x7ffff288 r15=3D0x7ffff288
  r16=3D0x00000000 r17=3D0x00000000 r18=3D0x00000000 r19=3D0x00000000
  r20=3D0x00000000 r21=3D0x00000000 r22=3D0x00000000 r23=3D0x00000000
  (sid-sh4-sbuild)root@z6:/#

  The same code works fine on my Renesas SH7785LCR evaluation board:

  root@tirpitz:~> uname -a
  Linux tirpitz 3.16.7-ckt7 #8 PREEMPT Fri Oct 21 18:47:41 CEST 2016 sh4a G=
NU/Linux
  root@tirpitz:~> gcc -o setcontext setcontext.c  -lpthread
  root@tirpitz:~> ./setcontext =

  root@tirpitz:~> echo $?
  0
  root@tirpitz:~>

  Due to this bug, it is not possible to compile gcc-7 with the Go
  frontend enabled on qemu-sh4.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1737444/+subscriptions

