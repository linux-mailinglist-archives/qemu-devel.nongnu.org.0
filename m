Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60845312089
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 00:56:59 +0100 (CET)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8XRi-0005Gn-22
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 18:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8XQS-0004kM-5W
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 18:55:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:48190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l8XQP-00048G-Jv
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 18:55:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l8XQN-0003CS-GM
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 23:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3A3122E8088
 for <qemu-devel@nongnu.org>; Sat,  6 Feb 2021 23:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Feb 2021 23:44:37 -0000
From: Roman Bolshakov <1914849@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: roolebo tnishinaga
X-Launchpad-Bug-Reporter: Toshifumi NISHINAGA (tnishinaga)
X-Launchpad-Bug-Modifier: Roman Bolshakov (roolebo)
References: <161259505296.24527.7729976640303273029.malonedeb@wampee.canonical.com>
Message-Id: <161265507761.1781.11029372260457510890.malone@gac.canonical.com>
Subject: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: db38ea4890af631b23add1be1df3687e4f9729cf
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1914849 <1914849@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for submitting the ticket.
I've just stumbled upon it after updating to 11.2.

The question was already asked on apple developer forums:
https://developer.apple.com/forums/thread/672804

And there's a thread going on with regard to broken nodejs on 11.2:
https://github.com/nodejs/node/issues/37061#issuecomment-774175983

** Bug watch added: github.com/nodejs/node/issues #37061
   https://github.com/nodejs/node/issues/37061

** Tags added: macos tcg

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914849

Title:
  mprotect fails after MacOS 11.2 on arm mac

Status in QEMU:
  New

Bug description:
  I got the following error when I ran qemu on arm mac(MacOS 11.2).

  ```
  $ ./qemu-system-x86_64
  qemu-system-x86_64: qemu_mprotect__osdep: mprotect failed: Permission den=
ied
  **
  ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  Bail out! ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  [1]    34898 abort      ./qemu-system-x86_64
  ```

  I tested the same version of qemu on intel mac(MacOS 11.2), but it
  works fine.

  And my friend told me that they did not have this error with MacOS
  11.1.

  So, I think it is CPU architecture or an OS version dependent error.

  =

  Environment:

  Qemu commit id: d0dddab40e472ba62b5f43f11cc7dba085dabe71
  OS: MacOS 11.2(20D64)
  Hardware: MacBook Air (M1, 2020)

  =

  How to build:

  ```
  mkdir build/
  cd build/
  ../configure --target-list=3Daarch64-softmmu,x86_64-softmmu
  make
  ```

  =

  How to reproduce:

  ```
  ./qemu-system-x86_64
  ```

  =

  Error message:

  ```
  $ ./qemu-system-x86_64
  qemu-system-x86_64: qemu_mprotect__osdep: mprotect failed: Permission den=
ied
  **
  ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  Bail out! ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  [1]    34898 abort      ./qemu-system-x86_64
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914849/+subscriptions

