Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A537F7B5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:19:29 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAJM-0003Bx-9d
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAFu-0008T1-V6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:15:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAFk-0007L6-Fu
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:15:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAFh-0005XV-Au
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:15:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3DDE22E818D
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:00:58 -0000
From: Thomas Huth <1916343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaronash th-huth
X-Launchpad-Bug-Reporter: kljsandjb (aaronash)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161384468452.28872.15441781033599210736.malonedeb@soybean.canonical.com>
Message-Id: <162090725835.1884.11366458575222520279.malone@wampee.canonical.com>
Subject: [Bug 1916343] Re: -daemonize not working on macOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: d20323a9c05df57a173b194097c99347fdb917e3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: macos

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916343

Title:
  -daemonize not working on macOS

Status in QEMU:
  Incomplete

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

