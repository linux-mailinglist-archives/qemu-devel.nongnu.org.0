Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728833E0EE3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:08:24 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXUN-0001aj-He
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mBXS1-0008Br-Q4
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:05:57 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mBXRz-00087F-0C
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:05:57 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 4887D3F312
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 07:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628147149;
 bh=Wn0851cW8ktMkLvNqLY2hkY23u8UeDCmbPXLccyUyG8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=S9t33lUo6d2Avzo9WLAZD/jFmi7RLhwu70q2eNDUnHig9CNISHz0jmTvmVRTo9Pfk
 +4mgUAGF3YamVRjciyBLO6Ets5okGlc5mUfjVpp4C3m+lp5s4A4JycCfyBwsmwqf7c
 gBePTPJiP7Z6aC2oA8xRAksrWv0zPccKMxzBRjt5dGYCnJFsRjOj/NjOv8fgqvUkuo
 qOHyDDT6VJSHnEsW1pipRexQnR0rhS+QWN9BDWt9ekOMgEDyOm9IVJzBBQPVoAwsEF
 77vcOiE2OFDEQvYr8+9oxhYmQphW5/vwvNwXUEW+ZNd8Ksn6l37XqDh8+JmwdSbODy
 bAGp/kp7M4KTg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3C74F2E816B
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 07:05:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Aug 2021 06:56:32 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1905297@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: axelheider janitor michaelpeter philmd th-huth
X-Launchpad-Bug-Reporter: Michael Peter (michaelpeter)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd=29?=
References: <160614967524.17013.9714069541645314856.malonedeb@wampee.canonical.com>
Message-Id: <162814659292.29719.10237064706193506563.malone@gac.canonical.com>
Subject: [Bug 1905297] Re: Zynq7000 UART clock reset initialization
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c08a1e23be9b835a8d0e7a32b2e55270fac05933"; Instance="production"
X-Launchpad-Hash: 6797b20136667c66a9b6ee30c2ad81f8fc3240e4
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Bug 1905297 <1905297@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael your patch is still missing your Signed-off-tag. Can you re-attach =
it including it?
You can also use https://sr.ht/ to send the patch directly to the list.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905297

Title:
  Zynq7000 UART clock reset initialization

Status in QEMU:
  Expired

Bug description:
  Hello,

  we have come across a strange behavior in the Zynq7000 model of Qemu
  that seems to have been  introduced between 5.0.0 and 5.1.0.

 =20
  The reset values of the SLCR register, in particular those for UART_CLK_C=
TRL, are such that
  the UARTs should find functional clocks. Up to 5.0.0 this was also the be=
havior that was
  implemented in QEMU.

  Starting in 5.1.0, we found that - despite correct reset values [1] - the=
 UARTs are non-functional
  upon reset. Some investigation revealed that the cause for that is that t=
he corresponding
  clocks are not properly initialized.

  Between 5.0.0 and 5.1.0, there are three commits  that touch the Zynq
  UART clocks [2]. The last of them [3] triggers the faulty behavior.

  Attached is a patch that applies 5.2.0-rc2 and yields a functional UART. =
We surmise that the
  underlying device release issue runs much deeper, so it is only meant to =
identify the issue.


  [1] hw/misc/zynq_slcr.c
        static void zynq_slcr_reset_init(Object *obj, ResetType type)
         s->regs[R_UART_CLK_CTRL]  =3D 0x00003F03;
  [2] 38867cb7ec90..5b49a34c6800
  [3] commit 5b49a34c6800d0cb917f959d8e75e5775f0fac3f (refs/bisect/bad)
        Author: Damien Hedde <damien.hedde@greensocs.com>
        Date:   Mon Apr 6 15:52:50 2020 +0200

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905297/+subscriptions


