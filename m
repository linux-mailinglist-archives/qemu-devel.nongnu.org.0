Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF344ED66A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:02:25 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqhE-00060c-5R
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:02:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nZqW2-00056b-Ka
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:50:53 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:34220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nZqVy-0000XV-2g
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:50:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 4D23A4008E
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1648716637;
 bh=+Ff50oZBl+eRliCH1tRtZeWBETKWjRVWofBEvwHKrvE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:Message-Id:
 Subject;
 b=T7QjyNuuYpibS2gma3mIb/owCsytWSm/wtSV58uPkDuTGnNaaPxbxubi0JfdMouD/
 Lk92lzEcUjFI2RSFfHAkz7PdaYCBnjgbIhWqg/p9/vuWZMwTberXXKK+7cwik4/671
 /DccJscPeGLUnAWOurPI1w0LlskIzbYctAkBPE+7uPEBIE3DVqeXt9NoI2XN1REt7Q
 kLHXegvAWOqpXGJkAzFfoqnc6SaZA125n5dxyDEXnUco0xROsKIzLoIdrYmXuIsL1S
 uzS39BDhX1DHbk+RQfd8EwBfRC4yC6So+owImplFSzTMdLT9nHeryP//40XmAiYN4Q
 3CnPxu16sbxrQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 59B4B2E8216
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 08:42:36 -0000
From: Jolyon <1967248@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jolyonyoung
X-Launchpad-Bug-Reporter: Jolyon (jolyonyoung)
X-Launchpad-Bug-Modifier: Jolyon (jolyonyoung)
Message-Id: <164871615669.29661.3736663210463094333.malonedeb@dale.canonical.com>
Subject: [Bug 1967248] [NEW] qemu: uncaught target signal 5 (Trace/breakpoint
 trap)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8668e93803333858d822a57f8780c5bef185741f"; Instance="production"
X-Launchpad-Hash: 4d37ea6ab2782e9129a798a203f5a573f5ba22d8
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1967248 <1967248@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I'm getting core dumped when running the attached hello binary in qemu,
but when using Gdb to remote-debug the program, it exited normally. will
appreciate if you can help look into this qemu issue.

And I found that QEMU's 32-bit arm linux-user mode doesn't correctly
turn guest BKPT insns into SIGTRAP signal.

0xa602 <_start>         movs    r0, #22                                    =
                                                                           =
                                             =20
0xa604 <_start+2>       addw    r1, pc, #186    ; 0xba
0xa608 <_start+6>       bkpt    0x00ab

$readelf -h hello
ELF Header:
=C2=A0=C2=A0Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
=C2=A0=C2=A0Class:                             ELF32
=C2=A0=C2=A0Data:                              2's complement, little endian
=C2=A0=C2=A0Version:                           1 (current)
=C2=A0=C2=A0OS/ABI:                            UNIX - System V
=C2=A0=C2=A0ABI Version:                       0
=C2=A0=C2=A0Type:                              EXEC (Executable file)
=C2=A0=C2=A0Machine:                           ARM
=C2=A0=C2=A0Version:                           0x1
=C2=A0=C2=A0Entry point address:               0xa603
=C2=A0=C2=A0Start of program headers:          52 (bytes into file)
=C2=A0=C2=A0Start of section headers:          144128 (bytes into file)
=C2=A0=C2=A0Flags:                             0x5000200, Version5 EABI, so=
ft-float ABI
=C2=A0=C2=A0Size of this header:               52 (bytes)
=C2=A0=C2=A0Size of program headers:           32 (bytes)
=C2=A0=C2=A0Number of program headers:         5
=C2=A0=C2=A0Size of section headers:           40 (bytes)
=C2=A0=C2=A0Number of section headers:         16
=C2=A0=C2=A0Section header string table index: 14

$qemu-arm --version
qemu-arm version 6.2.0
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

And I have check that the bug(https://bugs.launchpad.net/qemu/+bug/1873898)=
 is fixed.
But it's coredump.

** Affects: qemu
     Importance: Undecided
         Status: New

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1967248

Title:
  qemu: uncaught target signal 5 (Trace/breakpoint trap)

Status in QEMU:
  New

Bug description:
  I'm getting core dumped when running the attached hello binary in
  qemu, but when using Gdb to remote-debug the program, it exited
  normally. will appreciate if you can help look into this qemu issue.

  And I found that QEMU's 32-bit arm linux-user mode doesn't correctly
  turn guest BKPT insns into SIGTRAP signal.

  0xa602 <_start>         movs    r0, #22                                  =
                                                                           =
                                               =20
  0xa604 <_start+2>       addw    r1, pc, #186    ; 0xba
  0xa608 <_start+6>       bkpt    0x00ab

  $readelf -h hello
  ELF Header:
  =C2=A0=C2=A0Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  =C2=A0=C2=A0Class:                             ELF32
  =C2=A0=C2=A0Data:                              2's complement, little end=
ian
  =C2=A0=C2=A0Version:                           1 (current)
  =C2=A0=C2=A0OS/ABI:                            UNIX - System V
  =C2=A0=C2=A0ABI Version:                       0
  =C2=A0=C2=A0Type:                              EXEC (Executable file)
  =C2=A0=C2=A0Machine:                           ARM
  =C2=A0=C2=A0Version:                           0x1
  =C2=A0=C2=A0Entry point address:               0xa603
  =C2=A0=C2=A0Start of program headers:          52 (bytes into file)
  =C2=A0=C2=A0Start of section headers:          144128 (bytes into file)
  =C2=A0=C2=A0Flags:                             0x5000200, Version5 EABI, =
soft-float ABI
  =C2=A0=C2=A0Size of this header:               52 (bytes)
  =C2=A0=C2=A0Size of program headers:           32 (bytes)
  =C2=A0=C2=A0Number of program headers:         5
  =C2=A0=C2=A0Size of section headers:           40 (bytes)
  =C2=A0=C2=A0Number of section headers:         16
  =C2=A0=C2=A0Section header string table index: 14

  $qemu-arm --version
  qemu-arm version 6.2.0
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

  And I have check that the bug(https://bugs.launchpad.net/qemu/+bug/187389=
8) is fixed.
  But it's coredump.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1967248/+subscriptions


