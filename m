Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD23C32DF
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:35:53 +0200 (CEST)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24iW-00053Q-3r
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Za-0000Wt-KW
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZU-0000fw-Cs
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24ZG-0003md-3b
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 197B32E81A9
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1874888@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor skotik th-huth
X-Launchpad-Bug-Reporter: Konstantin (skotik)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158775385817.8537.12364422091879172270.malonedeb@gac.canonical.com>
Message-Id: <162589064759.5654.8103306234760131348.malone@loganberry.canonical.com>
Subject: [Bug 1874888] Re: certain programs make QEMU crash with "tcg fatal
 error"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 8afe9167240ddf4cd6403ea164c22477ccaac781
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1874888 <1874888@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874888

Title:
  certain programs make QEMU crash with "tcg fatal error"

Status in QEMU:
  Expired

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

