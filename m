Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF93383BC6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:55:39 +0200 (CEST)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihSs-0008Ht-DN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lihO5-0008P4-P7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lihO2-0003CU-SP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lihO0-0007D3-Ic
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 17:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A5842E8136
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 17:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 17:38:38 -0000
From: Vasiliy Nikonov <1923648@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: app-nap freezes macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nnlkcncff th-huth
X-Launchpad-Bug-Reporter: Vasiliy Nikonov (nnlkcncff)
X-Launchpad-Bug-Modifier: Vasiliy Nikonov (nnlkcncff)
References: <161833605825.22256.5828075734668933155.malonedeb@soybean.canonical.com>
Message-Id: <162127311965.7316.14074525872045476536.launchpad@gac.canonical.com>
Subject: [Bug 1923648] Re: macOS App Nap feature gradually freezes QEMU process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 327078282b55acf9e2d6101627b4b0b02fc26755
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
Reply-To: Bug 1923648 <1923648@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923648

Title:
  macOS App Nap feature gradually freezes QEMU process

Status in QEMU:
  Fix Released

Bug description:
  macOS version: 10.15.2
  QEMU versions: 5.2.0 (from MacPorts)
                 5.2.92 (v6.0.0-rc2-23-g9692c7b037)

  If the QEMU window is not visible (hidden, minimized or another
  application is in full screen mode), the QEMU process gradually
  freezes: it still runs, but the VM does not respond to external
  requests such as Telnet or SSH until the QEMU window is visible on the
  desktop.

  This behavior is due to the work of the macOS App Nap function:
  https://developer.apple.com/library/archive/documentation/Performance/Con=
ceptual/power_efficiency_guidelines_osx/AppNap.html#//apple_ref/doc/uid/TP4=
0013929-CH2-SW1

  It doesn't matter how the process is started -- as a background job or
  as a foreground shell process in case QEMU has a desktop window.

  My VM does not have a display output, only a serial line, most likely
  if the VM was using OpenGL, or playing sound (or any other App Nap
  triggers), then the problem would never have been detected.

  In my case only one starting way without this problem:
  sudo qemu-system-x86_64 -nodefaults \
  -cpu host -accel hvf -smp 1 -m 384 \
  -device virtio-blk-pci,drive=3Dflash0 \
  -drive file=3D/vios-adventerprisek9-m.vmdk.SPA.156-1.T.vmdk,if=3Dnone,for=
mat=3Dvmdk,id=3Dflash0 \
  -device e1000,netdev=3Dlocal -netdev tap,id=3Dlocal,ifname=3Dtap0,script=
=3Dno,downscript=3Dno \
  -serial stdio -display none

  The typical way from the internet to disable App Nap doesn't work:
  defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923648/+subscriptions

