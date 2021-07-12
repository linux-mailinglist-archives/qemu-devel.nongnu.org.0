Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D953C430F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:31:58 +0200 (CEST)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nbp-0001HG-7c
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWQ-0007XT-Qd
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWP-0006LA-6s
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWK-0005KD-29
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 155932E8216
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:59 -0000
From: Launchpad Bug Tracker <1913913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dniggema janitor th-huth
X-Launchpad-Bug-Reporter: Dirk A Niggemann (dniggema)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161205186910.7685.15364607958324067276.malonedeb@gac.canonical.com>
Message-Id: <162606347934.2726.4128001162622734458.malone@loganberry.canonical.com>
Subject: [Bug 1913913] Re: i386-linux-user returns -1 in sigcontext->trapno 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 51b4c21a440b0c7179bda2e1f57fdee6639fe52d
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
Reply-To: Bug 1913913 <1913913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913913

Title:
  i386-linux-user returns -1 in sigcontext->trapno

Status in QEMU:
  Expired

Bug description:
  QEMU development version, git commit
  74208cd252c5da9d867270a178799abd802b9338. Behaviour has been noted in
  5.2.0 generally.

  Certain 16-bit windows programs crash WINE under QEMU linux-user with:

  0084:err:seh:segv_handler Got unexpected trap -1
  wine: Unhandled illegal instruction at address 00006D65 (thread 0084), st=
arting debugger...

  They run correctly on native i386.

  Upon further inspection,it becomes clear these programs are failing at
  addresses where they are making DOS calls (int 21h ie CD 21 for
  instance).

  It is also clear that WINE is expecting an exception/signal at this
  point, to patch in the actual int21h handling code inside WINE.

  However, wine uses sigcontext output extensively to do its structured
  exception handling. sigcontext->trapno being set to -1 seems to
  confuse it, causing it to treat the exception as an actual unhandled
  error.

  I do not know if exception_index is being left at -1 due to the case
  of privileged instructions being executed in 16-bit ldts not being
  handled specifically, or if there is some other illegal instruction
  case causing this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913913/+subscriptions

