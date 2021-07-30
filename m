Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9513DB46C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 09:22:25 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Mqe-0003ho-ER
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 03:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m9Mp9-00031A-7g
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:20:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:49328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m9Mp7-00045f-6O
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:20:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m9Mp1-0000z9-MG
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 07:20:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF1952E81A4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 07:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Jul 2021 07:14:57 -0000
From: Maxim Devaev <1891748@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=charms; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee dilfridge ech1965 laurent-vivier mdevaev
 mirabilos rth th-huth tsp84
X-Launchpad-Bug-Reporter: Ech (ech1965)
X-Launchpad-Bug-Modifier: Maxim Devaev (mdevaev)
References: <159749143652.14755.7473614939867617680.malonedeb@gac.canonical.com>
Message-Id: <162762929773.22267.1970685051632210338.malone@gac.canonical.com>
Subject: [Bug 1891748] Re: qemu-arm-static 5.1 can't run gcc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="33e31d845587d75ee5a0727697204c950ad471d5"; Instance="production"
X-Launchpad-Hash: 3afad2374de0a1da5b333142a0bb6508184c5619
Received-SPF: none client-ip=91.189.90.7; envelope-from=noreply@launchpad.net;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1891748 <1891748@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I mean [0...52348] is working.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891748

Title:
  qemu-arm-static 5.1 can't run gcc

Status in QEMU:
  Fix Released
Status in Juju Charms Collection:
  New

Bug description:
  Issue discovered while trying to build pikvm (1)

  Long story short: when using qemu-arm-static 5.1, gcc exits whith
  message:

  Allocating guest commpage: Operation not permitted

 =20
  when using qemu-arm-static v5.0, gcc "works"

  Steps to reproduce will follow

  (1)  https://github.com/pikvm/pikvm/blob/master/pages/building_os.md

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891748/+subscriptions


