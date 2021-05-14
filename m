Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED58381052
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:12:53 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdEy-0000Tw-AI
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdDD-0006q3-B2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdD8-00028K-JV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdD7-0007g6-2J
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0FBF22E8187
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:04:56 -0000
From: Thomas Huth <1921092@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm debug
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: m-schoenstedt pmaydell th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Martin_Sch=C3=B6nstedt_=28m-schoenstedt?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161658153575.32717.2347487454546278840.malonedeb@soybean.canonical.com>
Message-Id: <162101909647.1637.2893560392245869208.malone@wampee.canonical.com>
Subject: [Bug 1921092] Re: gdbstub debug of multi-cluster machines is
 undocumented and confusing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: bdccafc9ab1abaa0377630734089ef0225f87867
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
Reply-To: Bug 1921092 <1921092@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is there still anything to do here or could we close the ticket now?

** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921092

Title:
  gdbstub debug of multi-cluster machines is undocumented and confusing

Status in QEMU:
  Incomplete

Bug description:
  Working with Zephyr RTOS, running a multi core sample on mps2_an521 works=
 fine. Both cpus start.
  Trying to debug with options -s -S the second core fails to boot.

  Posted with explanation also at: https://github.com/zephyrproject-
  rtos/zephyr/issues/33635

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921092/+subscriptions

