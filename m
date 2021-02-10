Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4C6316ABA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:08:07 +0100 (CET)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s2A-0006gu-FA
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9s10-000613-Kj
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:06:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:48602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9s0v-0007Oa-JN
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:06:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9s0r-0000Sc-94
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:06:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 297192E8148
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:06:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Feb 2021 15:58:46 -0000
From: John Arbuckle <1913505@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 mark-cave-ayland mishari pmaydell
 programmingkidx roolebo th-huth
X-Launchpad-Bug-Reporter: Mishari Muqbil (mishari)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161180131265.32409.4817508561083668447.malonedeb@chaenomeles.canonical.com>
Message-Id: <161297272692.17465.9137612471059439064.malone@wampee.canonical.com>
Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 5e877844905ba402c443833406b2bd556b2a0e8b
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
Reply-To: Bug 1913505 <1913505@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tried the patch.
Start up time does not appear to be improved.
I used both qemu-system-i386 and qemu-system-x86_64 with the same results.
To compare notes I tried Windows 7. It starts up much faster than Windows X=
P.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913505

Title:
  Windows XP slow on Apple M1

Status in QEMU:
  New

Bug description:
  Qemu installed by using brew install qemu -s on M1

  QEMU emulator version 5.2.0
  XP image from: https://archive.org/details/WinXPProSP3x86

  Commands run:
  $ qemu-img create -f qcow2 xpsp3.img 10G
  $ qemu-system-i386 -m 512 -hda xpsp3.img -cdrom WinXPProSP3x86/en_windows=
_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso -boot d

  It's taken 3 days now with qemu running at around 94% CPU and
  installation hasn't finished. The mouse pointer moves and occasionally
  changes between the pointer and hourglass so it doesn't seem to have
  frozen.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913505/+subscriptions

