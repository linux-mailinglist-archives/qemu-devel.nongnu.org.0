Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CD3D0F2E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:07:26 +0200 (CEST)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Bwb-00031T-OL
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m6Bv5-0001gK-US
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m6Bv3-0003ZF-6u
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:05:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m6Buy-0003qW-VQ
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:05:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ECCA62E816E
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:05:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Jul 2021 12:56:51 -0000
From: John Paul Adrian Glaubitz <1796520@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user sh4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz janitor mirabilos pmaydell th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
References: <153886120838.22456.12836438866392888832.malonedeb@gac.canonical.com>
Message-Id: <162687221165.27832.6671429551164081682.malone@soybean.canonical.com>
Subject: [Bug 1796520] Re: autogen crashes on qemu-sh4-user after 61dedf2af7
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9c0cb2d219338e530974f0e5d7d00aa1bf8a7de3"; Instance="production"
X-Launchpad-Hash: 7a5926d631c396901d10ba23b1e014b35de30cf3
Received-SPF: none client-ip=91.189.90.7; envelope-from=noreply@launchpad.net;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1796520 <1796520@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch suggested by Thorsten Glaser glibc Bugzilla #27543 fixes the
issue for me:

> https://sourceware.org/bugzilla/show_bug.cgi?id=3D27543#c2

** Bug watch added: Sourceware.org Bugzilla #27543
   https://sourceware.org/bugzilla/show_bug.cgi?id=3D27543

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1796520

Title:
  autogen crashes on qemu-sh4-user after 61dedf2af7

Status in QEMU:
  Incomplete

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
     =20
      Both frchg and fschg require PR =3D=3D 0, otherwise undefined_operati=
on.
     =20
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


