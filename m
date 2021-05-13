Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110D37FC7D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:25:29 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF5U-00005j-0h
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhEs1-000430-72
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:11:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:37218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhEry-0002Bv-RG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:11:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhErv-0004zT-Gn
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 17:11:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A80392E81AD
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 17:11:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 17:04:08 -0000
From: kljsandjb <1916343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaronash th-huth
X-Launchpad-Bug-Reporter: kljsandjb (aaronash)
X-Launchpad-Bug-Modifier: kljsandjb (aaronash)
References: <161384468452.28872.15441781033599210736.malonedeb@soybean.canonical.com>
Message-Id: <162092544927.7369.10700419975166543871.launchpad@gac.canonical.com>
Subject: [Bug 1916343] Re: -daemonize not working on macOS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: f77cd1fcd78430798c2530c6a8b48b6b90027472
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

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916343

Title:
  -daemonize not working on macOS

Status in QEMU:
  New

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

