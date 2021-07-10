Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E533C3574
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 18:07:04 +0200 (CEST)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FVP-0003Rv-7Y
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 12:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2FUC-0002dd-H4
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:05:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2FUA-0006ur-26
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:05:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2FU6-0000Ms-QE
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 16:05:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1DA72E806E
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 16:05:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 15:57:12 -0000
From: Floyd42 <1905297@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: axelheider janitor michaelpeter philmd th-huth
X-Launchpad-Bug-Reporter: Michael Peter (michaelpeter)
X-Launchpad-Bug-Modifier: Floyd42 (axelheider)
References: <160614967524.17013.9714069541645314856.malonedeb@wampee.canonical.com>
Message-Id: <162593263218.18220.10953924983942644289.malone@gac.canonical.com>
Subject: [Bug 1905297] Re: Zynq7000 UART clock reset initialization
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 20e4af6483835e2d269f51989b0dd25741b120bb
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
Reply-To: Bug 1905297 <1905297@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any update?

** Changed in: qemu
       Status: Expired =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905297

Title:
  Zynq7000 UART clock reset initialization

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  we have come across a strange behavior in the Zynq7000 model of Qemu
  that seems to have been  introduced between 5.0.0 and 5.1.0.

  =

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

