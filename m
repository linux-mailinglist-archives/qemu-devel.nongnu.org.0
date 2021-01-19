Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DA2FAF72
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:36:17 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ikY-0005Pj-DR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifs-0000bL-Kv
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:57702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifp-0004ys-Nw
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifm-00046t-DZ
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 309B62E8148
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:31 -0000
From: Launchpad Bug Tracker <1549298@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jubalh th-huth
X-Launchpad-Bug-Reporter: Michael Vetter (jubalh)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160224135313.2329.80076.malonedeb@gac.canonical.com>
Message-Id: <161102985148.12094.4711487689536206885.malone@loganberry.canonical.com>
Subject: [Bug 1549298] Re: Add missing MSRs for powertop
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 1935753d2d2bd8c6997765e2c970bd696e338286
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
Reply-To: Bug 1549298 <1549298@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1549298

Title:
  Add missing MSRs for powertop

Status in QEMU:
  Expired

Bug description:
  I reported this same bug on the powertop bugtracker [1] because I
  think both projects need to change something here.

  When running powertop it crashes and prints:

    unknown op '{'
                  read_msr cpu0 0xe8 : Input/output error

  It seems that powertop is trying to access model specific registers and b=
ecause qemu doesn't emulate them it crashes.
  Clearly powertop shouldn't crash in such case but I think it would also b=
e better if qemu could add support for these registers.

  1: https://app.devzing.com/powertopbugs/bugzilla/show_bug.cgi?id=3D4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1549298/+subscriptions

