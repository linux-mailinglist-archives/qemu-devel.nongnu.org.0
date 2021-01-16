Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FEB2F8B26
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:29:23 +0100 (CET)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dDG-00014G-J2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAE-0007rP-Ap
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAC-00066Q-8G
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dA9-0001VX-2M
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A72FF2E8144
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1744009@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor qihaimou th-huth
X-Launchpad-Bug-Reporter: qihaimou (qihaimou)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151626726470.4861.474936740354528920.malonedeb@wampee.canonical.com>
Message-Id: <161077067449.27726.7590399147040676384.malone@loganberry.canonical.com>
Subject: [Bug 1744009] Re: qemu for windows fails to use multicast socket as
 netdev
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: be798aeb529dc9dcaa27aa0283dfa308c021810f
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
Reply-To: Bug 1744009 <1744009@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1744009

Title:
  qemu for windows fails to use multicast socket as netdev

Status in QEMU:
  Expired

Bug description:
  My host OS is Windows 7 x64 SP1. I installed qemu for windows from
  https://qemu.weilnetz.de/w64/.The version is 2.10.1,
  qemu-w64-setup-20171006.exe. I run qemu with the following command:

  qemu-system-x86_64.exe -net nic -net socket,mcast=3D234.5.5.5:6000
  disk1.qcow2

  It stopped with error:
  bind: Unknown error
  qemu-system-x86_64.exe: -net socket,mcast=3D234.5.5.5:6000: Device 'socke=
t' could not be initialized

  Using the -netdev option has the same problem:
  qemu-system-x86_64.exe -netdev socket,id=3Dhostnet0,mcast=3D234.5.5.5:600=
0 -device e1000,netdev=3Dhostnet0 disk1.qcow2

  I tried many versions from https://qemu.weilnetz.de/w64/, but none of
  them could work.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1744009/+subscriptions

