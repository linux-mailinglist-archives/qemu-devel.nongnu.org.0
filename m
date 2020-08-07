Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DCC23E8BC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 10:17:50 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3xZV-0001Ws-ON
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 04:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3xWe-0006eZ-QP
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:14:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:58298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3xWd-00028L-2P
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:14:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3xWb-0005SZ-VR
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 08:14:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E38EB2E806D
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 08:14:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 08:04:22 -0000
From: Thomas Huth <811683@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: exceptions ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: afaerber agraf th-huth till-straumann
X-Launchpad-Bug-Reporter: till (till-straumann)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110716214931.3466.65125.malonedeb@soybean.canonical.com>
Message-Id: <159678746232.9911.10486657183141826245.malone@chaenomeles.canonical.com>
Subject: [Bug 811683] Re: 7400, 7410,
 7450 cpus vector have wrong exception prefix at reset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a6081d77f648ae26bc7393a1d218d9a2a08265e6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Looking through old bug tickets... can you still reproduce this issue
with the latest version of QEMU? Or could we close this ticket nowadays?


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/811683

Title:
  7400,7410,7450 cpus vector have wrong exception prefix at reset

Status in QEMU:
  Incomplete

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

