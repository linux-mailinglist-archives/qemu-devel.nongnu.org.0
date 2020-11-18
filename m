Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729932B8133
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:52:21 +0100 (CET)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPkq-0001xx-Gq
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfPjf-0001Al-N3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:51:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfPje-0006O0-4O
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:51:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfPjc-000670-2k
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 15:51:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ABDFD2E8164
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 15:51:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2020 15:40:49 -0000
From: Peter Maydell <1904206@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: morade pmaydell
X-Launchpad-Bug-Reporter: abou (morade)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160527647106.19576.6752494336458097987.malonedeb@soybean.canonical.com>
Message-Id: <160571405054.535.11259439581774418221.launchpad@soybean.canonical.com>
Subject: [Bug 1904206] Re: install QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 8319959ca0c8469d86f9b3845435e39e4a2c484c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:41:28
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

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904206

Title:
  install QEMU

Status in QEMU:
  Invalid

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

