Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E14364AC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:48:12 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZMY-0008CM-Sz
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdZKF-0006hL-Gl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:45:47 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:56152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdZKC-0001WO-8S
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:45:47 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id CE4BF40344
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1634827539;
 bh=4Q8tIDd/c1J0yDR65C90ktkBldk4K4ImQ8iKxcA9Vhg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=KLeoXVt7XHpx1A8Pqu5w4o5y0Trw+eOjlI0BShZhsrzGgFqW7O3BIfmvYPHOnvTdi
 Rc3y0TRtizyL3Qzn+mPVjpIALaGEAZqxtALx8EgkaDMxRiGZGtkcbDJUDnui9N357w
 07dkyHBsGCyuCZsOmcVW2Boh9ERcBFYWblT1MEn4datGQjgUueK0vrH/X2i/zR+2K+
 lZppgFPbVleoETnqtr70A5beZEPUqJNGAvp546mgaobPHrI/I7ikf/SjAxePRyvcq1
 urnkc+P4CbFLNH8844s+ZSWAcns3LGOSap8a0EjFp8YRK0drRJIlTcMCItnZ20FjTY
 UBIogv99SyPpw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C3B1E2E817B
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:45:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Oct 2021 14:36:56 -0000
From: Thomas Huth <1874888@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor philmd skotik th-huth
X-Launchpad-Bug-Reporter: Konstantin (skotik)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158775385817.8537.12364422091879172270.malonedeb@gac.canonical.com>
Message-Id: <163482701608.6261.5961162094011610687.malone@chaenomeles.canonical.com>
Subject: [Bug 1874888] Re: certain programs make QEMU crash with "tcg fatal
 error"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: 24493022712e684b6b85638737d119931be9c5fc
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/683


** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #683
   https://gitlab.com/qemu-project/qemu/-/issues/683

--=20
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
    15:   00=20
    16:   0f 1e 0a                nop    DWORD PTR [rdx]
    19:   43 0f ec 20             rex.XB paddsb mm4,QWORD PTR [r8]
    1d:   66 47 0f 3a 0c 3d 00    rex.RXB blendps xmm15,XMMWORD PTR [rip+0x=
8000],0x0        # 0x8028
    24:   80 00 00 00=20
    28:   c4 e3 f9 df 5f 86 0d    vaeskeygenassist xmm3,XMMWORD PTR [rdi-0x=
7a],0xd
    2f:   c4 e2 55 92 74 fc 0a    vgatherdps ymm6,DWORD PTR [rsp+ymm7*8+0xa=
],ymm5
    36:   c4 e2 f9 17 9a 01 00    vptest xmm3,XMMWORD PTR [rdx+0x1]
    3d:   00 00=20
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


