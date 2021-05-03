Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E86371356
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:06:53 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVTY-0008J3-46
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRh-0006vS-Ia
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldVRe-0002sg-98
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:04:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldVRc-0005dh-An
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:04:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 311CC2E8144
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 10:04:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 09:51:23 -0000
From: Thomas Huth <922076@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: safinaskar th-huth
X-Launchpad-Bug-Reporter: Askar Safin (safinaskar)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120126133438.17636.69999.malonedeb@soybean.canonical.com>
Message-Id: <162003548309.12323.1229780727013632057.malone@soybean.canonical.com>
Subject: [Bug 922076] Re: doesn't clear screen on boot
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d816ae60163c195327d30a6f67afd6d16e35deca
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 922076 <922076@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/87


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #87
   https://gitlab.com/qemu-project/qemu/-/issues/87

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/922076

Title:
  doesn't clear screen on boot

Status in QEMU:
  Expired

Bug description:
  When I start Linux in Qemu via "qemu -kernel /vmlinuz ...", Qemu
  window appears and it shows message "Starting Seabios (version
  0.5.1-2010...)", and then Linux writes messages like "Loading, please
  wait..." on top of previous message!

  For example, I can see "Loading, please wait...on 0.5.1-2010...)"

  So, Qemu doesn't clean screan before booting OS.

  Moreover, when I start Linux via "qemu /disk-image", Qemu shows
  "Starting Seabios (version 0.5.1-2010...)", then switches to graphical
  mode, shows GRUB, then switches back to text mode and shows "Starting
  Seabios" again! And again Linux prints messages on top of Seabios
  messages, and we see a mix of symbols on screen.

  Also, I found another bug! I am learning now to write kernels. And I
  see that operator "*(char *)0xb8000 =3D 0" in C code of kernel doesn't
  clean first charaster of screen in Qemu in "-curses" mode! If I want
  to real clean this charaster, I must type "*(char *)0xb8000 =3D ' '".

  I attach a kernel (x86, multiboot) with this bug. Just type "make"
  (you need gcc) and "qemu -curses -kernel kernel". You will see that
  screen is not cleared, but kernel tries to clean it. If you change 0
  to ' ', all will work!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/922076/+subscriptions

