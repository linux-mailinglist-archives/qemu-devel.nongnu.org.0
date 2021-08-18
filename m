Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99763F056F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:57:09 +0200 (CEST)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGM44-0002JI-Ix
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGM2n-0001cA-6i
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:55:49 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:51842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGM2k-0005FA-PH
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:55:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 7EB833F6C4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629294941;
 bh=I/OqMedEcL6hwS2MB7lWwmNJuKx5wc4MBvRTBekNi/c=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Cb7rgvKIiILsPcfqYbPqqze9w0k5k853hOWwj0KZB6tccWVRZFgBI8MHPEy4zeJKB
 f6eEIXqHsQV1ROXO30KFXeq+Gz57Z5S7Lc7WVmlAN2p1CiYqiPfomjHj2SI4CUICl2
 gfdjjXk35nkYiAj+aYXBOsmAalDwK4e1z8Gmc0WWRzc2u9mq9CnAcv1prPGgcQjdjp
 9jNX+E99j2Rk7ygop6WY8I75ZZ2O+eDQ1cWVVPCFzpFm6/sM0FW9XnHiDxs6JOBleQ
 KzLTnom8x7NH09jXhJr0h8HsbQXJ/iAoEvB9VS8EV87afx2STAEJcDeFmcXd1mYEvy
 MQjcxrrprH3BA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6C2182E8196
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 13:45:42 -0000
From: Thomas Huth <1796520@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user sh4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz janitor mirabilos pmaydell th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153886120838.22456.12836438866392888832.malonedeb@gac.canonical.com>
Message-Id: <162929434220.303.9427963138408023849.malone@wampee.canonical.com>
Subject: [Bug 1796520] Re: autogen crashes on qemu-sh4-user after 61dedf2af7
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b08a7ac7ee9dae6cca70a44dbdbee2a2b52e9053"; Instance="production"
X-Launchpad-Hash: 68fb7dc300aabe81446bae0249df5f32224ccce2
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thanks, closing now.

** Changed in: qemu
       Status: Incomplete =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1796520

Title:
  autogen crashes on qemu-sh4-user after 61dedf2af7

Status in QEMU:
  Invalid

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


