Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA94ED68B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:11:12 +0200 (CEST)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqpj-0007z3-AB
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:11:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nZqbS-00020E-2M
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:26 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nZqbO-0002yM-HN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:25 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id C1CBF43A50
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1648716970;
 bh=GfgIY86OMGROwVtME2GoxpYT4qyXFVkLHZxKuFqbh7E=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=OUpqrACxa5nnZdWWCTr3+YnJdpR0bffcxmI2xg312pIXHJFl6EX/PalQ/zXgdACpf
 7ogNyAP8kIteT5mPnWFtfg0N/hl9zXf1O/IyAA2v3EbK/g6pJewrpfu6cWAKSHSkzf
 LccAOT/PojgEDVjV+m0SAWzKu40RarsNexfXOd4M6yFLZIyexG3+qaW8Z8ujg9P+G8
 XOu7fnIRKFfKlvius/fFAA4rLUvKSaqEpyCQ6jtuYD3uoF8LzaSQ6Cwbg1KN2bJD9x
 naHAkxHCLzifoIfuGjQXmumtcJtf3X0XNX6twBhZVD53D+4l6YetoQYNxgaPHNXVZj
 A+cw8LMI8pAIQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E24092E825B
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:55:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 08:47:41 -0000
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
References: <164871615669.29661.3736663210463094333.malonedeb@dale.canonical.com>
Message-Id: <164871646170.6570.14254782009379313142.malone@angus.canonical.com>
Subject: [Bug 1967248] Re: qemu: uncaught target signal 5 (Trace/breakpoint
 trap)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8668e93803333858d822a57f8780c5bef185741f"; Instance="production"
X-Launchpad-Hash: ed54a77b16d8d3f5cdbff265662ce2675ca94d75
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

It seem to can not upload a binary?

** Description changed:

- I'm getting core dumped when running the attached a.out_err binary in
- qemu, but when using Gdb to remote-debug the program, it exited
- normally. will appreciate if you can help look into this qemu issue.
+ I'm getting core dumped when running the attached hello binary in qemu,
+ but when using Gdb to remote-debug the program, it exited normally. will
+ appreciate if you can help look into this qemu issue.
 =20
  And I found that QEMU's 32-bit arm linux-user mode doesn't correctly
  turn guest BKPT insns into SIGTRAP signal.
 =20
- 0xa602 <_start>         movs    r0, #22                                  =
                                                                           =
                                                0xa604 <_start+2>       add=
w    r1, pc, #186    ; 0xba                                                =
                                                                           =
               =20
- 0xa608 <_start+6>       bkpt    0x00ab      =20
+ 0xa602 <_start>         movs    r0, #22                                  =
                                                                           =
                                                0xa604 <_start+2>       add=
w    r1, pc, #186    ; 0xba
+ 0xa608 <_start+6>       bkpt    0x00ab
 =20
  $readelf -h hello
  ELF Header:
-   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
-   Class:                             ELF32
-   Data:                              2's complement, little endian
-   Version:                           1 (current)
-   OS/ABI:                            UNIX - System V
-   ABI Version:                       0
-   Type:                              EXEC (Executable file)
-   Machine:                           ARM
-   Version:                           0x1
-   Entry point address:               0xa603
-   Start of program headers:          52 (bytes into file)
-   Start of section headers:          144128 (bytes into file)
-   Flags:                             0x5000200, Version5 EABI, soft-float=
 ABI
-   Size of this header:               52 (bytes)
-   Size of program headers:           32 (bytes)
-   Number of program headers:         5
-   Size of section headers:           40 (bytes)
-   Number of section headers:         16
-   Section header string table index: 14
+ =C2=A0=C2=A0Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
+ =C2=A0=C2=A0Class:                             ELF32
+ =C2=A0=C2=A0Data:                              2's complement, little end=
ian
+ =C2=A0=C2=A0Version:                           1 (current)
+ =C2=A0=C2=A0OS/ABI:                            UNIX - System V
+ =C2=A0=C2=A0ABI Version:                       0
+ =C2=A0=C2=A0Type:                              EXEC (Executable file)
+ =C2=A0=C2=A0Machine:                           ARM
+ =C2=A0=C2=A0Version:                           0x1
+ =C2=A0=C2=A0Entry point address:               0xa603
+ =C2=A0=C2=A0Start of program headers:          52 (bytes into file)
+ =C2=A0=C2=A0Start of section headers:          144128 (bytes into file)
+ =C2=A0=C2=A0Flags:                             0x5000200, Version5 EABI, =
soft-float ABI
+ =C2=A0=C2=A0Size of this header:               52 (bytes)
+ =C2=A0=C2=A0Size of program headers:           32 (bytes)
+ =C2=A0=C2=A0Number of program headers:         5
+ =C2=A0=C2=A0Size of section headers:           40 (bytes)
+ =C2=A0=C2=A0Number of section headers:         16
+ =C2=A0=C2=A0Section header string table index: 14
 =20
  $qemu-arm --version
  qemu-arm version 6.2.0
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
 =20
-=20
  And I have check that the bug(https://bugs.launchpad.net/qemu/+bug/187389=
8) is fixed.
  But it's coredump.

** Description changed:

  I'm getting core dumped when running the attached hello binary in qemu,
  but when using Gdb to remote-debug the program, it exited normally. will
  appreciate if you can help look into this qemu issue.
 =20
  And I found that QEMU's 32-bit arm linux-user mode doesn't correctly
  turn guest BKPT insns into SIGTRAP signal.
 =20
- 0xa602 <_start>         movs    r0, #22                                  =
                                                                           =
                                                0xa604 <_start+2>       add=
w    r1, pc, #186    ; 0xba
+ 0xa602 <_start>         movs    r0, #22                                  =
                                                                           =
                                               =20
+ 0xa604 <_start+2>       addw    r1, pc, #186    ; 0xba
  0xa608 <_start+6>       bkpt    0x00ab
 =20
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
 =20
  $qemu-arm --version
  qemu-arm version 6.2.0
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
 =20
  And I have check that the bug(https://bugs.launchpad.net/qemu/+bug/187389=
8) is fixed.
  But it's coredump.

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


