Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4C2B1F58
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:57:28 +0100 (CET)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbS3-0004vf-7D
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQM-0003wa-NB
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQK-0000NE-Mc
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbQI-00034n-Me
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 85CB72E812F
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 15:50:21 -0000
From: Peter Maydell <1904206@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: morade pmaydell
X-Launchpad-Bug-Reporter: abou (morade)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160527647106.19576.6752494336458097987.malonedeb@soybean.canonical.com>
Message-Id: <160528262118.19818.16889745618387882379.malone@soybean.canonical.com>
Subject: [Bug 1904206] Re: install QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: b814b69a9199a4a6b543ab7b2b59d74b4a3e065e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904206 <1904206@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU is working fine, but your guest kernel has crashed. Either your
guest kernel is the wrong one for the "versatilepb" machine type, or the
kernel wants a dtb file and you are not passing one via QEMU's -dtb
argument.

Unless you like debugging "board bring-up" issues, I recommend that you
find a good tutorial on running an Arm Linux system on QEMU and follow
it; that will be faster than trying to diagnose and fix what
config/kernel/etc mismatch you've made.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904206

Title:
  install QEMU

Status in QEMU:
  New

Bug description:
  I want install QEMU on Kali, I write :

  qemu-system-arm -kernel ~/qemu_vms/kernel-qemu-3.10.25-wheezy -cpu
  arm1176 -m 256 -M versatilepb -serial stdio -append "root=3D/dev/sda2
  rootfstype=3Dext4 rw" -hda ~/qemu_vms/2020-08-20-raspios-buster-armhf-
  full.img -nic user,hostfwd=3Dtcp::5022-:22 -no-reboot

  The answer :

  WARNING: Image format was not specified for '/home/kali/qemu_vms/2020-08-=
20-raspios-buster-armhf-full.img' and probing guessed raw.
           Automatically detecting the format is dangerous for raw images, =
write operations on block 0 will be restricted.
           Specify the 'raw' format explicitly to remove the restrictions.
  pulseaudio: set_sink_input_volume() failed
  pulseaudio: Reason: Invalid argument
  pulseaudio: set_sink_input_mute() failed
  pulseaudio: Reason: Invalid argument
  Uncompressing Linux... done, booting the kernel.

  I tried a lot of solutions but nothing worked. Please help

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904206/+subscriptions

