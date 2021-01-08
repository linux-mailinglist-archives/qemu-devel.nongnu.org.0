Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4634B2EEC7F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:30:17 +0100 (CET)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjPk-0006dl-7b
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLn-0001K0-ML
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:56140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLc-0003fH-EA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:11 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLZ-00045h-9G
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 952E12E8138
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1652373@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor lluis.vilanova th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Llu=C3=ADs_Vilanova_=28lluis=2Evilanova?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20161223191237.2387.49621.malonedeb@chaenomeles.canonical.com>
Message-Id: <161007943752.27824.7848102900271698628.malone@loganberry.canonical.com>
Subject: [Bug 1652373] Re: User-mode QEMU is not deterministic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 78cf0ff8c1668009dcb5131ef3247156b43c331d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1652373 <1652373@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1652373

Title:
  User-mode QEMU is not deterministic

Status in QEMU:
  Expired

Bug description:
  QEMU in user-mode (linux-user or bsd-user) has no way to get the
  equivalent of the "-icount" argument found in softmmu mode.

  It is true that some system calls in user-mode can prevent
  deterministic execution, but it would be very simple to patch time-
  related syscalls to return a number based on icount when in
  deterministic mode.

  Putting both changes together (icount + time-related syscalls) would
  cover the needs for deterministic execution of most benchmarks (i.e.,
  those not interacting with the network or other programs in the
  system).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1652373/+subscriptions

