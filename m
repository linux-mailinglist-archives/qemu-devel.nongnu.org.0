Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504037F819
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:42:06 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAfF-0007UN-4l
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPb-00067I-JF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPY-00044O-8t
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAPT-0007Mx-1e
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E7B072E8194
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:16:35 -0000
From: Thomas Huth <1898084@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: slirp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pere-jobs th-huth
X-Launchpad-Bug-Reporter: Ophir LOJKINE (pere-jobs)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160157283310.5327.3681752113841049978.malonedeb@soybean.canonical.com>
Message-Id: <162090819577.1546.9659484046400082280.malone@wampee.canonical.com>
Subject: [Bug 1898084] Re: Assertion failed: (buf_len != 0), function soread, 
 file socket.c, line 183.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 4c9b4918a405c8ee388e39652aeea32f67697b1d
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
Reply-To: Bug 1898084 <1898084@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/284


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #284
   https://gitlab.com/qemu-project/qemu/-/issues/284

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898084

Title:
  Assertion failed: (buf_len !=3D 0), function soread, file socket.c, line
  183.

Status in QEMU:
  Expired

Bug description:
  I have a virtual raspberry py that I am running qemu 5.1.0 for MacOS.

  Here is the command line I used:

  qemu-system-arm \
    -M versatilepb \
    -cpu arm1176 \
    -m 256 \
    -drive file=3D2020-08-20-raspios-buster-armhf-lite.img,if=3Dnone,index=
=3D0,media=3Ddisk,format=3Draw,id=3Ddisk0 \
    -device virtio-blk-pci,drive=3Ddisk0,disable-modern=3Don,disable-legacy=
=3Doff \
    -net nic -net user,hostfwd=3Dtcp::5022-:22 \
    -dtb versatile-pb-buster-5.4.51.dtb \
    -kernel kernel-qemu-5.4.51-buster \
    -append "root=3D/dev/vda2 panic=3D1" \
    -no-reboot \
    -serial stdio

  When trying to ssh from another machine while docker was running
  inside the VM, I got the following error:

  Assertion failed: (buf_len !=3D 0), function soread, file /private/tmp/qe=
mu-20200813-13289-1g95loa/qemu-5.1.0/slirp/src/socket.c, line 183
  ../boot.sh: line 12:  8592 Abort trap: 6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898084/+subscriptions

