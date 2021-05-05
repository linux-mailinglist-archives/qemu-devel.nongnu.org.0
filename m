Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E326137475B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 20:03:05 +0200 (CEST)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLrU-0006pD-5d
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 14:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfa-0000cZ-17
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:51814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leLfV-0007jW-CR
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:50:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leLfU-0002GP-25
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 17:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0EBA82E8135
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 17:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 17:44:39 -0000
From: Thomas Huth <1809546@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dumanovskis pmaydell th-huth
X-Launchpad-Bug-Reporter: Daniels Umanovskis (dumanovskis)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154549130563.19742.15114184471142076379.malonedeb@soybean.canonical.com>
Message-Id: <162023667991.454.16845385787459112264.malone@chaenomeles.canonical.com>
Subject: [Bug 1809546] Re: Writing a byte to a pl011 SFR overwrites the whole
 SFR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e844707b09d0a837d380c6d012ef2b0ab68580b9
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
Reply-To: Bug 1809546 <1809546@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1809546

Title:
  Writing a byte to a pl011 SFR overwrites the whole SFR

Status in QEMU:
  Incomplete

Bug description:
  The bug is present in QEMU 2.8.1 and, if my analysis is correct, also
  on master.

  I first noticed that a PL011 UART driver, which is fine on real
  hardware, fails to enable the RX interrupt in the IMSC register when
  running in QEMU. However, the problem only comes up if the code is
  compiled without optimizations. I think I've narrowed it down to a
  minimal example that will exhibit the problem if run as a bare-metal
  application.

  Given:

  pl011_addr: .word 0x10009000

  The following snippet will be problematic:

       ldr r3, pl011_addr
       ldrb r2, [r3, #0x38]        // IMSC
       mov r2, #0
       orr r2, r2, #0x10           // R2 =3D=3D 0x10
       strb r2, [r3, #0x38]        // Whole word reads correctly after this
       ldrb r2, [r3, #0x39]
       mov r2, #0
       strb r2, [r3, #0x39]        // Problem here! Overwrites offset 0x38 =
as well

  After the first strb instruction, which writes to 0x10009038,
  everything is fine. It can be seen in the QEMU monitor:

  (qemu) xp 0x10009038
  0000000010009038: 0x00000010

  After the second strb instruction, the write to 0x10009039 clears the
  entire word:

  (qemu) xp 0x10009038
  0000000010009038: 0x00000000

  QEMU command-line, using the vexpress-a9 which has the PL011 at
  0x10009000:

  qemu-system-arm -S -M vexpress-a9 -m 32M -no-reboot -nographic
  -monitor telnet:127.0.0.1:1234,server,nowait -kernel pl011-sfr.bin
  -gdb tcp::2159 -serial mon:stdio

  Compiling the original C code with optimizations makes the driver
  work. It compiles down to assembly that only does a single write:

      ldr r3, pl011_addr
      mov r2, #0x10
      str r2, [r3, #0x38]

  Attached is the an assembly file, and linkscript, that shows the
  problem, and also includes the working code.

  I haven't debugged inside of QEMU itself but it seems to me that the
  problem is in pl011_write in pl011.c - the functions looks at which
  offset is being written, and then writes the entire SFR that offset
  falls under, which means that changing a single byte will change the
  whole SFR.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809546/+subscriptions

