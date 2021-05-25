Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAAD38FC00
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:52:38 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRrX-0002YG-8l
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llRqc-00017o-Ne
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:51:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:56484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llRqX-00022l-Aj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:51:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llRqT-0000Ik-3Y
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:51:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 33E982E826C
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:51:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 May 2021 07:42:27 -0000
From: Thomas Huth <1926995@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=High;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314 th-huth
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162006770303.13621.18026521974059309297.malonedeb@wampee.canonical.com>
Message-Id: <162192854742.32409.18168712414132065534.malone@soybean.canonical.com>
Subject: [Bug 1926995] Re: hw/remote/mpqemu-link.c:221: bad error checking ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ba75dbf44f1013379e594c259682f14c0528180a"; Instance="production"
X-Launchpad-Hash: 1047eb6f5199b74f8c12f1836ba6312832b2a945
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
Reply-To: Bug 1926995 <1926995@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been merged now:
https://gitlab.com/qemu-project/qemu/-/commit/dcf20655ffca2b0219d2914d

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926995

Title:
  hw/remote/mpqemu-link.c:221: bad error checking ?

Status in QEMU:
  Fix Committed

Bug description:
  hw/remote/mpqemu-link.c:221:36: warning: logical =E2=80=98and=E2=80=99 of=
 mutually
  exclusive tests is always false [-Wlogical-op]

  Source code is

     if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
          return false;
      }

  Maybe better code:

     if (msg->cmd >=3D MPQEMU_CMD_MAX || msg->cmd < 0) {
          return false;
      }

  It might be useful to switch on gcc compiler flag -Wlogical-op
  to see these warnings.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926995/+subscriptions

