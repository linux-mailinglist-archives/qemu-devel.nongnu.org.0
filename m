Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2042245160
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 18:12:48 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6ynX-0005P6-QA
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 12:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k6ylV-0003LB-CW
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 12:10:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k6ylT-0002mA-F1
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 12:10:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k6ud2-0006xG-1Y
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 11:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 020CD2E80D2
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 11:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2020 11:37:16 -0000
From: Ech <1891748@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ech1965
X-Launchpad-Bug-Reporter: Ech (ech1965)
X-Launchpad-Bug-Modifier: Ech (ech1965)
Message-Id: <159749143652.14755.7473614939867617680.malonedeb@gac.canonical.com>
Subject: [Bug 1891748] [NEW] qemu-arm-static 5.1 can't run gcc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6d0b96812d8def2ca0ffcc25cb4d200f2f30aeb";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dcf917a4b689d61919e498b8fa6aa84c031b22ce
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 12:06:21
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
Reply-To: Bug 1891748 <1891748@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Issue discovered while trying to build pikvm (1)

Long story short: when using qemu-arm-static 5.1, gcc exits whith
message:

Allocating guest commpage: Operation not permitted


when using qemu-arm-static v5.0, gcc "works"

Steps to reproduce will follow

(1)  https://github.com/pikvm/pikvm/blob/master/pages/building_os.md

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891748

Title:
  qemu-arm-static 5.1 can't run gcc

Status in QEMU:
  New

Bug description:
  Issue discovered while trying to build pikvm (1)

  Long story short: when using qemu-arm-static 5.1, gcc exits whith
  message:

  Allocating guest commpage: Operation not permitted

  =

  when using qemu-arm-static v5.0, gcc "works"

  Steps to reproduce will follow

  (1)  https://github.com/pikvm/pikvm/blob/master/pages/building_os.md

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891748/+subscriptions

