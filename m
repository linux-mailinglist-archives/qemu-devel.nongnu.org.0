Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B56377EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 10:53:04 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1ex-0006ao-GX
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 04:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dC-0003zq-NB
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:33874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lg1dA-0008Ob-DI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:51:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lg1d4-0002f2-Lc
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 245162E8206
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:51:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 08:41:20 -0000
From: Thomas Huth <1874888@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: skotik th-huth
X-Launchpad-Bug-Reporter: Konstantin (skotik)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158775385817.8537.12364422091879172270.malonedeb@gac.canonical.com>
Message-Id: <162063608031.7066.15020787991607606635.malone@gac.canonical.com>
Subject: [Bug 1874888] Re: certain programs make QEMU crash with "tcg fatal
 error"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6e89dcbfdd57117482f5cc0f27b467d9489fd81e
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
Reply-To: Bug 1874888 <1874888@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: i386 tcg

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874888

Title:
  certain programs make QEMU crash with "tcg fatal error"

Status in QEMU:
  Incomplete

Bug description:
  The following code snippet crashes qemu with

  .../tcg/tcg.c:3279: tcg fatal error
  qemu-x86_64: /usr/local/google/home/kostik/qemu-5.0.0-rc4/accel/tcg/cpu-e=
xec.c:701: int cpu_exec(CPUState *): Assertion `!have_mmap_lock()' failed.

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  int main() {
    /*
  00000000 <.data>:
     0:   2e 45 71 ff             cs rex.RB jno 0x3
     4:   e9 00 00 f0 00          jmp    0xf00009
     9:   c4 42 7d 31 3e          vpmovzxbd ymm15,QWORD PTR [r14]
     e:   c4 a3 7d 08 64 82 44    vroundps ymm4,YMMWORD PTR [rdx+r8*4+0x44]=
,0x0
    15:   00 =

    16:   0f 1e 0a                nop    DWORD PTR [rdx]
    19:   43 0f ec 20             rex.XB paddsb mm4,QWORD PTR [r8]
    1d:   66 47 0f 3a 0c 3d 00    rex.RXB blendps xmm15,XMMWORD PTR [rip+0x=
8000],0x0        # 0x8028
    24:   80 00 00 00 =

    28:   c4 e3 f9 df 5f 86 0d    vaeskeygenassist xmm3,XMMWORD PTR [rdi-0x=
7a],0xd
    2f:   c4 e2 55 92 74 fc 0a    vgatherdps ymm6,DWORD PTR [rsp+ymm7*8+0xa=
],ymm5
    36:   c4 e2 f9 17 9a 01 00    vptest xmm3,XMMWORD PTR [rdx+0x1]
    3d:   00 00 =

  */
    char buf[] =3D {
      0x2E, 0x45, 0x71, 0xFF, 0xE9, 0x00, 0x00, 0xF0, 0x00, 0xC4, 0x42, 0x7=
D, 0x31, 0x3E, 0xC4, 0xA3, 0x7D, 0x08, 0x64, 0x82, 0x44, 0x00, 0x0F, 0x1E, =
0x0A, 0x43, 0x0F, 0xEC, 0x20, 0x66, 0x47, 0x0F, 0x3A, 0x0C, 0x3D, 0x00, 0x8=
0, 0x00, 0x00, 0x00, 0xC4, 0xE3, 0xF9, 0xDF, 0x5F, 0x86, 0x0D, 0xC4, 0xE2, =
0x55, 0x92, 0x74, 0xFC, 0x0A, 0xC4, 0xE2, 0xF9, 0x17, 0x9A, 0x01, 0x00, 0x0=
0, 0x00
    };
    void (*f)(void) =3D (void (*) (void))buf;
    f();
    return 0;
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Steps to reproduce:
  1) clang -static repro.c -o repro
  2) qemu-x86_64-static repro

  Tested with 4.2.0 and 5.0.0-rc4. Both -user and -system variants are
  affected.

  A few more snippets that cause the same sort of behavior:
  1) 0x64, 0x46, 0x7D, 0xFF, 0xDF, 0x27, 0x46, 0x0F, 0xD4, 0x83, 0x5E, 0x00=
, 0x00, 0x00, 0x3E, 0x0F, 0x6A, 0xEF, 0x0F, 0x05, 0xC4, 0x42, 0xFD, 0x1E, 0=
xCF, 0x46, 0x18, 0xE3, 0x47, 0xCD, 0x4E, 0x6E, 0x0F, 0x0F, 0x16, 0x8A

  2) 0x67, 0x45, 0xDB, 0xD0, 0xAA, 0xC4, 0xE2, 0xB1, 0x01, 0x57, 0x00,
  0xF3, 0x6F, 0xF3, 0x42, 0x0F, 0x1E, 0xFD, 0x64, 0x2E, 0xF2, 0x45,
  0xD9, 0xC4, 0x3E, 0xF3, 0x0F, 0xAE, 0xF4, 0x3E, 0x47, 0x0F, 0x1C,
  0x22, 0x42, 0x73, 0xFF, 0xD9, 0xFD

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874888/+subscriptions

