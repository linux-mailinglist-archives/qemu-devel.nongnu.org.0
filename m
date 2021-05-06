Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49050375864
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:23:55 +0200 (CEST)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legn4-0005l7-Dw
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkO-00041F-L8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:50322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkI-00026S-0G
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1legkE-0007zg-52
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 16:20:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F0EAE2E81A7
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 16:20:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 16:12:04 -0000
From: Thomas Huth <1883400@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha th-huth toddandmargo-n
X-Launchpad-Bug-Reporter: Toddandmargo-n (toddandmargo-n)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1877716
References: <159209820759.11242.7518482343283209679.malonedeb@soybean.canonical.com>
Message-Id: <162031752493.4321.4575881290268818175.malone@gac.canonical.com>
Subject: [Bug 1883400] Re: Windows 10 extremely slow and unresponsive
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 35bb3acb17652d987d596e34016e842351503708
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
Reply-To: Bug 1883400 <1883400@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1877716 ***
    https://bugs.launchpad.net/bugs/1877716

ok, closing this as a duplicate

** This bug has been marked a duplicate of bug 1877716
   Win10 guest unusable after a few minutes

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883400

Title:
  Windows 10 extremely slow and unresponsive

Status in QEMU:
  New

Bug description:
  Hi,

  Fedora 32, x64
  qemu-5.0.0-2.fc32.x86_64

  https://www.microsoft.com/en-us/software-download/windows10ISO
  Win10_2004_English_x64.iso

  Windows 10 is excruciatingly slow since upgrading to 5.0.0-2.fc32.
  Disabling your repo and downgrading to 2:4.2.0-7.fc32 and corrects the
  issue (the package in the Fedora repo).

  You can duplicate this off of the Windows 10 ISO (see above) and do
  not even have to install Windows 10 itself.

  No such problem with Windows 7.

  And the clipboard works better under 2L4.2.0-07 too

  Please fix,

  Many thanks,
  -T

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883400/+subscriptions

