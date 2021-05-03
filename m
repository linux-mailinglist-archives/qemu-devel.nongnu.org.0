Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522F37131B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:41:54 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldV5N-0001TM-FN
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldV3A-000089-Dq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:39:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:34886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldV36-0003vI-SK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:39:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldV33-0003tg-SH
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:39:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA9E12E815A
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 09:39:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 09:29:05 -0000
From: Thomas Huth <811683@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: exceptions ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: afaerber agraf balaton-4 th-huth till-straumann
X-Launchpad-Bug-Reporter: till (till-straumann)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110716214931.3466.65125.malonedeb@soybean.canonical.com>
Message-Id: <162003414596.10956.3796967956353556027.malone@gac.canonical.com>
Subject: [Bug 811683] Re: 7400, 7410,
 7450 cpus vector have wrong exception prefix at reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f2ab8a7ba73fac8eba2f6948b5f2bd0adde47117
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 811683 <811683@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/85


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #85
   https://gitlab.com/qemu-project/qemu/-/issues/85

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/811683

Title:
  7400,7410,7450 cpus vector have wrong exception prefix at reset

Status in QEMU:
  Expired

Bug description:
  I have a proprietary ROM implementing system calls that are executed
  via the 'SC' instruction.

  I use qemu-0.14.1,

  qemu-system-ppc -M prep -cpu $CPU -bios my_bios -kernel my_kernel

  That works fine on a 604 (CPU=3D0x00040103) - but does not on an emulated=
 7400 (CPU=3D0x000c0209) or 7450 (CPU=3D0x80000201). I found that the emula=
tor jumps to 0x00000c00 instead of 0xfff00c00.
  Probably this is due to a wrong setting in target-ppc/translate_init.c:

  init_excp_604() correctly sets env->hreset_vector=3D0xfff00000UL;

  but

  init_excp_7400() says env->hreset_vector=3D0x00000000UL;

  which seems wrong. (the 7400 manual says a hard-reset jumps initializes t=
he
  prefix to 0xfff00000.)

  Likewise, init_excp_7450() (and probably other, related CPUs) are
  wrong.

  Indeed, when I change the value in init_excp_7400() to 0xfff00000UL then
  everything works as expected for me.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/811683/+subscriptions

