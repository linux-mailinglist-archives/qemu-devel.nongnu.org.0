Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49F3AFC41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:53:27 +0200 (CEST)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYPe-0004p7-7x
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY06-0008PY-T6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:57820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzv-0005Ph-JB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzh-00016C-MT
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C833E2E8198
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1774149@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnaudalies-py janitor lukasdurfina th-huth
X-Launchpad-Bug-Reporter: mou (arnaudalies-py)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152766936065.4012.2532535303592891582.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433547437.20423.6426531912047911263.malone@loganberry.canonical.com>
Subject: [Bug 1774149] Re: qemu-user x86_64 x86 gdb call function from gdb
 doesn't work
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 21a3b17347a9ff25ddbdc6bd0a9dbde7a743f0b2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1774149 <1774149@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774149

Title:
  qemu-user x86_64 x86 gdb call function from gdb doesn't work

Status in QEMU:
  Expired

Bug description:
  While running qemu user x86_64 x86 with gdb server, calling functions
  are not working.

  Here is how to reproduce it:

  run in a terminal:
  $ qemu-x86_64 -g 12345 -L / /bin/ls

  In another terminal run gdb:
  (gdb) file /bin/ls
  (gdb) target remote :12345
  (gdb) b _init
  (gdb) c
  (gdb) call malloc(1)
  Could not fetch register "fs_base"; remote failure reply 'E14'

  In other cases we also got the error:
  Could not fetch register "orig_rax"; remote failure reply 'E14'

  Here is how I patched it (it is only a workaround):

  diff --git a/gdbstub.c b/gdbstub.c
  index 2a94030..5749efe 100644
  --- a/gdbstub.c
  +++ b/gdbstub.c
  @@ -668,6 +668,11 @@ static int gdb_read_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0return r->get_reg(env, mem_buf, reg - r->base_reg);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  +#ifdef TARGET_X86_64
  +    return 8;
  +#elif TARGET_I386
  +    return 4;
  +#endif
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
  =C2=A0}

  (Our guess for this issue was, gdb is requesting for 'fake' registers
  to know register size)

  Once we patched that, we got another problem while calling functions
  from gdb: We could call functions, but only once.

  Here is how to reproduce it:
  run in a terminal:
  $ qemu-x86_64 -g 12345 -L / /bin/ls

  In another terminal run gdb:
  (gdb) file /bin/ls
  (gdb) target remote :12345
  (gdb) b _init
  (gdb) c
  (gdb) call malloc(1)
  $1 =3D (void *) 0x620010
  (gdb) call malloc(1)
  Cannot access memory at address 0x40007ffb8f

  Here is how we patched it to make it work:

  diff --git a/exec.c b/exec.c
  index 03238a3..d303922 100644
  --- a/exec.c
  +++ b/exec.c
  @@ -2833,7 +2833,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong=
 addr,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(flags & PAGE_=
VALID))
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0return -1;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_write) {
  -            if (!(flags & PAGE_WRITE))
  +            if (!(flags & (PAGE_WRITE | PAGE_WRITE_ORG)))
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0/* XXX: this code should not depend on lock_user */
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (!(p =3D lock_user(VERIFY_WRITE, addr, l, 0)))

  From what we saw, there is a page which is passed to read-only after
  first execution, and gdb need to write on that page to put a
  breakpoint. (on the stack to get function return)

  We suspect this is linked to this:
  https://qemu.weilnetz.de/w64/2012/2012-06-28/qemu-tech.html#Self_002dmodi=
fying-code-and-translated-code-invalidation

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774149/+subscriptions

