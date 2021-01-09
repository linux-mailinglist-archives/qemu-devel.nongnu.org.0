Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5472EFDB7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:33:59 +0100 (CET)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5ws-0000Ke-V5
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5qA-0000EX-8b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:47718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q2-00074U-B3
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pq-0007Hm-8j
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 288BA2E8138
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:39 -0000
From: Launchpad Bug Tracker <1687214@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alamot janitor th-huth
X-Launchpad-Bug-Reporter: Alamot (alamot)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170429175305.26812.79902.malonedeb@gac.canonical.com>
Message-Id: <161016586011.8490.16331632271455566116.malone@loganberry.canonical.com>
Subject: [Bug 1687214] Re: Rapid tremendous memory hog when using -net nic,
 vlan=0 -net user, vlan=0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: e32299844752d3fcd1ed37f5e64e0ff795c0a514
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
Reply-To: Bug 1687214 <1687214@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1687214

Title:
  Rapid tremendous memory hog when using -net nic,vlan=3D0 -net
  user,vlan=3D0

Status in QEMU:
  Expired

Bug description:
  A rapid tremendous memory hog is occuring when I use -net nic,vlan=3D0
  -net user,vlan=3D0. Tested with QEMU 2.8.0 & 2.9.0 in Gentoo. All
  available memory (8GB) + swap (over 20GB) is exhausted very rapidly.

  This bug is possibly related to =

  https://bugs.launchpad.net/qemu/+bug/1310714 =

  and maybe to
  https://bugs.launchpad.net/qemu/+bug/1288620

  The bug IS present wheh I use -net nic,vlan=3D0 -net user,vlan=3D0 (tested
  with no model and model=3De1000 and model=3Dvirtio, with all these the bug
  is present)

  The bug is NOT present with I use this:
  -netdev type=3Duser,id=3Dmynet0 -device virtio-net-pci,netdev=3Dmynet0

  I tested this bug only using windows guests (Windows XP & Windows 8).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1687214/+subscriptions

