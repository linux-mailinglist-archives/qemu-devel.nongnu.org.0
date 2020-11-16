Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9992B5057
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:55:06 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejeb-0003LT-KB
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejHE-0002xo-TM
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:30:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejHC-0005xq-RI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:30:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kejHB-00020s-8K
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:30:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E0E42E811E
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:30:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:21:34 -0000
From: Thomas Huth <1744009@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qihaimou th-huth
X-Launchpad-Bug-Reporter: qihaimou (qihaimou)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151626726470.4861.474936740354528920.malonedeb@wampee.canonical.com>
Message-Id: <160555089470.28800.9533537856848597229.malone@gac.canonical.com>
Subject: [Bug 1744009] Re: qemu for windows fails to use multicast socket as
 netdev
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 6de6ba44991ecb7d8217c47c99c038fb1ebec673
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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

Have you ever tried to suggest your change as a patch to the qemu-devel mai=
ling list? See:
https://wiki.qemu.org/Contribute/SubmitAPatch

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1744009

Title:
  qemu for windows fails to use multicast socket as netdev

Status in QEMU:
  Incomplete

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

