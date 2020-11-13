Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB92B288D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 23:32:37 +0100 (CET)
Received: from localhost ([::1]:52042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdhcR-00046n-Nl
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 17:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdhaf-0003NP-9s
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 17:30:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:46410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdhac-0005lk-B3
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 17:30:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdhaa-0001vd-Bg
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 22:30:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 54C142E802E
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 22:30:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 22:18:25 -0000
From: abou <1904206@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: morade pmaydell
X-Launchpad-Bug-Reporter: abou (morade)
X-Launchpad-Bug-Modifier: abou (morade)
References: <160527647106.19576.6752494336458097987.malonedeb@soybean.canonical.com>
 <160528262118.19818.16889745618387882379.malone@soybean.canonical.com>
Message-Id: <1689397168.9463605.1605305905657@mail.yahoo.com>
Subject: Re: [Bug 1904206] Re: install QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 450c87d17b7b8a40d0f48560026a1c1d808d665a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 17:30:40
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

Thank you very much for your answer. I have already watched two
tutorials, but it does not work. Do you have a tutorial for me?=C2=A0Thank
you

Regard
    Le vendredi 13 novembre 2020 =C3=A0 16:55:40 UTC+1, Peter Maydell <1904=
206@bugs.launchpad.net> a =C3=A9crit :  =

 =

 QEMU is working fine, but your guest kernel has crashed. Either your
guest kernel is the wrong one for the "versatilepb" machine type, or the
kernel wants a dtb file and you are not passing one via QEMU's -dtb
argument.

Unless you like debugging "board bring-up" issues, I recommend that you
find a good tutorial on running an Arm Linux system on QEMU and follow
it; that will be faster than trying to diagnose and fix what
config/kernel/etc mismatch you've made.

-- =

You received this bug notification because you are subscribed to the bug
report.
https://bugs.launchpad.net/bugs/1904206

Title:
=C2=A0 install QEMU

Status in QEMU:
=C2=A0 New

Bug description:
=C2=A0 I want install QEMU on Kali, I write :

=C2=A0 qemu-system-arm -kernel ~/qemu_vms/kernel-qemu-3.10.25-wheezy -cpu
=C2=A0 arm1176 -m 256 -M versatilepb -serial stdio -append "root=3D/dev/sda2
=C2=A0 rootfstype=3Dext4 rw" -hda ~/qemu_vms/2020-08-20-raspios-buster-armh=
f-
=C2=A0 full.img -nic user,hostfwd=3Dtcp::5022-:22 -no-reboot

=C2=A0 The answer :

=C2=A0 WARNING: Image format was not specified for '/home/kali/qemu_vms/202=
0-08-20-raspios-buster-armhf-full.img' and probing guessed raw.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Automatically detecting the format is da=
ngerous for raw images, write operations on block 0 will be restricted.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Specify the 'raw' format explicitly to r=
emove the restrictions.
=C2=A0 pulseaudio: set_sink_input_volume() failed
=C2=A0 pulseaudio: Reason: Invalid argument
=C2=A0 pulseaudio: set_sink_input_mute() failed
=C2=A0 pulseaudio: Reason: Invalid argument
=C2=A0 Uncompressing Linux... done, booting the kernel.

=C2=A0 I tried a lot of solutions but nothing worked. Please help

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904206/+subscriptions

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

