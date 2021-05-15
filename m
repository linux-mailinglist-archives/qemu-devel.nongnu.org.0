Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC56381818
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:03:27 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhs4s-0004JH-2g
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhs2O-0001ze-PR
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:00:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:54682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhs2N-0000E8-2w
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:00:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhs2L-0007bS-Mp
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:00:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ABC8D2E8136
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:00:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:53:27 -0000
From: Thomas Huth <1916343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaronash th-huth
X-Launchpad-Bug-Reporter: kljsandjb (aaronash)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161384468452.28872.15441781033599210736.malonedeb@soybean.canonical.com>
Message-Id: <162107600728.1231.13679527298673235620.malone@wampee.canonical.com>
Subject: [Bug 1916343] Re: -daemonize not working on macOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: a6e80247b21fd9b7cf6977a8b09380b2b358022a
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
Reply-To: Bug 1916343 <1916343@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/313


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #313
   https://gitlab.com/qemu-project/qemu/-/issues/313

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916343

Title:
  -daemonize not working on macOS

Status in QEMU:
  Expired

Bug description:
  Basically e.g, if I try with below command on macOS:

  qemu-system-x86_64 \
                     -m 4G \
                     -vga virtio \
                     -display default,show-cursor=3Don \
                     -usb \
                     -device usb-tablet \
                     -machine type=3Dq35,accel=3Dhvf \
                     -smp 2 \
                     -drive file=3Dubuntu.qcow2,if=3Dvirtio -cpu max \
                     -net nic -net user,hostfwd=3Dtcp::50022-:22,hostfwd=3D=
tcp::8000-:80 \
                     -daemonize

  With this command, the QEMU processes hang there forever. I guess
  there is a bug when forking a child and kill the parent? Because when
  this issue occurs, there are actually 2 QEMU processes running

  ```
    501 14952 14951   0  7:08PM ??         0:00.00 (qemu-system-x86_)
    501 14953     1   0  7:08PM ??         0:00.03 qemu-system-x86_64 -m 4G=
 -vga virtio -display default,show-cursor=3Don -usb -device usb-tablet -mac=
hine type=3Dq35,accel=3Dhvf -smp 2 -drive file=3Dubuntu.qcow2,if=3Dvirtio -=
cpu max -net nic -net user,hostfwd=3Dtcp::50022-:22,hostfwd=3Dtcp::8000-:80=
 -daemonize
    501 14951 14626   0  7:08PM ttys000    0:00.03 qemu-system-x86_64 -m 4G=
 -vga virtio -display default,show-cursor=3Don -usb -device usb-tablet -mac=
hine type=3Dq35,accel=3Dhvf -smp 2 -drive file=3Dubuntu.qcow2,if=3Dvirtio -=
cpu max -net nic -net user,hostfwd=3Dtcp::50022-:22,hostfwd=3Dtcp::8000-:80=
 -daemonize
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916343/+subscriptions

