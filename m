Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BAB347D86
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:18:58 +0100 (CET)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6Dh-00087q-FE
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP6Aa-00079m-6R
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:15:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:58088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP6AW-0002Nh-C9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:15:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lP6AU-0004c1-9M
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 16:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 45C292E8157
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 16:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 16:08:26 -0000
From: Peter Maydell <1921092@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm debug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m-schoenstedt pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161658153575.32717.2347487454546278840.malonedeb@soybean.canonical.com>
Message-Id: <161660210625.19496.49787149668938267.malone@wampee.canonical.com>
Subject: [Bug 1921092] Re: how do i delete this bug?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 32726c396ef0532b24924f5704939185660e375b
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
Reply-To: Bug 1921092 <1921092@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In general, you don't need to delete bugs that turn out to be user
error, or edit the description/title; just mark them as 'invalid',
perhaps with a comment about what turned out to be the cause. That
leaves the trail of what was going on for future readers who might be
going down the same path as you.

There are actually a couple of things we should do here in upstream
QEMU:

* we should document the process for using the debugstub with multi-cluster=
 board models like the mps2-an521
* we should check whether we are doing the right/most appropriate thing whe=
n the user connects to the debug stub and is only attaching to one 'inferio=
r' -- it sounds from your report like the un-attached inferior is left perm=
anently in the 'stopped' state. Maybe that's what the gdb protocol requires=
, but it seems a bit unhelpful.

I'm going to update the bug status/text accordingly.


** Summary changed:

- how do i delete this bug?
+ gdbstub debug of multi-cluster machines is undocumented and confusing

** Changed in: qemu
       Status: Invalid =3D> Confirmed

** Description changed:

- no bugs here
+ Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
+ Trying to debug with options -s -S the second core fails to boot.
+ =

+ Posted with explanation also at: https://github.com/zephyrproject-
+ rtos/zephyr/issues/33635

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921092

Title:
  gdbstub debug of multi-cluster machines is undocumented and confusing

Status in QEMU:
  Confirmed

Bug description:
  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.

  Posted with explanation also at: https://github.com/zephyrproject-
  rtos/zephyr/issues/33635

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921092/+subscriptions

