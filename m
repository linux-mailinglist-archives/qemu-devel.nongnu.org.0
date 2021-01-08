Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1C2EEC8D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:37:34 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjWn-0001Zh-JA
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLt-0001S8-PR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLd-0003fc-Vq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:17 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLZ-0004CG-SS
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2FEE72E814F
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1649236@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: commit daemonize
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6sense.ru janitor th-huth
X-Launchpad-Bug-Reporter: Vasya (6sense.ru)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20161212102447.23016.40899.malonedeb@chaenomeles.canonical.com>
Message-Id: <161007943688.27824.7150703943879799712.malone@loganberry.canonical.com>
Subject: [Bug 1649236] Re: Commit snapshot fails with Permission denied when
 daemonized
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 16fb9ebddea0b7319b8911b23edc5fd6e5346dd0
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
Reply-To: Bug 1649236 <1649236@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1649236

Title:
  Commit snapshot fails with Permission denied when daemonized

Status in QEMU:
  Expired

Bug description:
  When running qemu with daemonize option it is impossible to run
  "commit all" in monitor.

  I run qemu 2.7.0 under gentoo 64 bit distribution with following
  command line:

  qemu-system-x86_64 -m 4096 -cpu host -smp 2 -enable-kvm -snapshot \
      -drive file=3Dvm.img,if=3Dvirtio \
      -net nic,model=3Dvirtio,macaddr=3D11:11:11:11:11:11 \
      -net tap,ifname=3Dtap$PORT,script=3Dno,downscript=3Dno \
      -vnc :1 -daemonize \
      -chardev vc,id=3Dmon0 -mon chardev=3Dmon0,mode=3Dreadline \
      -chardev socket,id=3Dmon1,host=3Dlocalhost,port=3D10001,server,nowait=
 -mon chardev=3Dmon1,mode=3Dcontrol =


  I connect to vm through VNC viewer and press CTRL+ALT+2 and run "commit a=
ll" command.
  Following error is shown:
  `commit` error for `all`: Permission denied

  When I run my VM without `daemonize` option the command "commit all"
  works without errors.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1649236/+subscriptions

