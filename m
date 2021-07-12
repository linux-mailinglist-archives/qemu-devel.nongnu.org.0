Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE403C430A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:28:19 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nYI-0001wV-F8
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWR-0007Xt-S7
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWQ-0006MO-Bw
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWL-0005KE-JK
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 379E42E8223
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:18:00 -0000
From: Launchpad Bug Tracker <1913505@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 janitor mark-cave-ayland mishari
 pmaydell programmingkidx roolebo th-huth
X-Launchpad-Bug-Reporter: Mishari Muqbil (mishari)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161180131265.32409.4817508561083668447.malonedeb@chaenomeles.canonical.com>
Message-Id: <162606348014.2726.10285435731705120237.malone@loganberry.canonical.com>
Subject: [Bug 1913505] Re: Windows XP slow on Apple M1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 7ee83ce0f398b169b94bd382aac023b1eede6aa3
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
Reply-To: Bug 1913505 <1913505@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913505

Title:
  Windows XP slow on Apple M1

Status in QEMU:
  Expired

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

