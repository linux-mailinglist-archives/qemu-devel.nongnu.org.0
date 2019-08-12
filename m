Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4B8A1B5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 16:56:19 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxBkA-0003DM-GI
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 10:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38429)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hxBjZ-0002jO-A1
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hxBjX-000068-UU
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:55:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:46808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hxBjX-00005Z-PA
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hxBjW-0005K2-HZ
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 14:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 829532E802E
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 14:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Aug 2019 14:48:55 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user sh4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz pmaydell
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <153886120838.22456.12836438866392888832.malonedeb@gac.canonical.com>
Message-Id: <156562133567.18294.8070044824231788162.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19021";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a385aec0e06749c1db24c58ade37b090b22e6fec
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1796520] Re: autogen crashes on qemu-sh4-user
 after 61dedf2af7
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
Reply-To: Bug 1796520 <1796520@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Edit to note that "that hardware" is an SH7785LCR with an SH7785 CPU.)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1796520

Title:
  autogen crashes on qemu-sh4-user after 61dedf2af7

Status in QEMU:
  Confirmed

Bug description:
  Running "autogen --help" crashes on qemu-sh4-user with:

  (sid-sh4-sbuild)root@nofan:/# autogen --help
  Unhandled trap: 0x180
  pc=3D0xf64dd2de sr=3D0x00000000 pr=3D0xf63b9c74 fpscr=3D0x00080000
  spc=3D0x00000000 ssr=3D0x00000000 gbr=3D0xf61102a8 vbr=3D0x00000000
  sgr=3D0x00000000 dbr=3D0x00000000 delayed_pc=3D0xf64dd2a0 fpul=3D0x000000=
03
  r0=3D0xf6fc1320 r1=3D0x00000000 r2=3D0xffff5dc4 r3=3D0xf67bfb50
  r4=3D0xf6fc1230 r5=3D0xf6fc141c r6=3D0x000003ff r7=3D0x00000000
  r8=3D0x00000004 r9=3D0xf63e20bc r10=3D0xf6fc141c r11=3D0xf63e28f0
  r12=3D0xf63e2258 r13=3D0xf63eae1c r14=3D0x00000804 r15=3D0xf6fc1220
  r16=3D0x00000000 r17=3D0x00000000 r18=3D0x00000000 r19=3D0x00000000
  r20=3D0x00000000 r21=3D0x00000000 r22=3D0x00000000 r23=3D0x00000000
  (sid-sh4-sbuild)root@nofan:/#

  Bi-secting found this commit to be the culprit:

  61dedf2af79fb5866dc7a0f972093682f2185e17 is the first bad commit
  commit 61dedf2af79fb5866dc7a0f972093682f2185e17
  Author: Richard Henderson <rth@twiddle.net>
  Date:   Tue Jul 18 10:02:50 2017 -1000

      target/sh4: Add missing FPSCR.PR =3D=3D 0 checks
      =

      Both frchg and fschg require PR =3D=3D 0, otherwise undefined_operati=
on.
      =

      Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
      Signed-off-by: Richard Henderson <rth@twiddle.net>
      Message-Id: <20170718200255.31647-26-rth@twiddle.net>
      Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

  :040000 040000 980d79b69ae712f23a1e4c56983e97a843153b4a
  1024c109f506c7ad57367c63bc8bbbc8a7a36cd7 M      target

  Reverting 61dedf2af79fb5866dc7a0f972093682f2185e17 fixes the problem
  for me.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1796520/+subscriptions

