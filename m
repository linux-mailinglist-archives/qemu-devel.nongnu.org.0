Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB2226D51
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 19:42:28 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxZo3-0002tx-7d
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 13:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxZmq-00023e-SK
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:41:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:41170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxZmo-0006Ec-PA
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 13:41:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jxZmm-0007nY-AI
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 17:41:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 45E162E8105
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 17:41:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2020 17:29:51 -0000
From: Richard Henderson <1880287@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: linux-user tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hdeller rth
X-Launchpad-Bug-Reporter: Helge Deller (hdeller)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <159022297856.20775.958724179871171148.malonedeb@soybean.canonical.com>
Message-Id: <159526619210.7835.7990272986832135840.malone@wampee.canonical.com>
Subject: [Bug 1880287] Re: gcc crashes in hppa emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 66d8c8e29dd7945e14750eb09f850af8030d06eb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 11:25:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1880287 <1880287@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the debugging.  Failure to free temporaries.

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
     Assignee: (unassigned) =3D> Richard Henderson (rth)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880287

Title:
  gcc crashes in hppa emulation

Status in QEMU:
  In Progress

Bug description:
  There seems to be a translation bug in the qemu-hppa (qemu v5.0.0) emulat=
ion:
  A stripped down testcase (taken from Linux kernel build) is attached.

  In there is "a.sh", a shell script which calls gcc-9 (fails with both
  debian gcc-9.3.0-11 or gcc-9.3.0-12). and "a.iii", the preprocessed
  source.

  When starting a.sh, in the emulation gcc crashes with segfault.
  On real hardware gcc succeeds to compile the source.

  In a hppa-user chroot running "apt update && apt install gcc-9" should
  be sufficient to get the needed reproducer environment.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880287/+subscriptions

