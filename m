Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D728137066C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:22:56 +0200 (CEST)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lckts-0005aB-01
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckql-0002Ub-Ew
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lckqi-0003vN-4p
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:19:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lckqg-0003jm-JV
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:19:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 860D52E8164
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:19:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:06:36 -0000
From: Thomas Huth <1255303@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fturco t-artem th-huth
X-Launchpad-Bug-Reporter: Francesco Turco (fturco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20131126203906.17117.92053.malonedeb@soybean.canonical.com>
Message-Id: <161985639631.10612.18008359884836784465.malone@gac.canonical.com>
Subject: [Bug 1255303] Re: ALSA underruns occurr when using QEMU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 1a7a27efb4eda0fcf835696bb4fd938fa6c37415
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1255303 <1255303@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/69


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #69
   https://gitlab.com/qemu-project/qemu/-/issues/69

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1255303

Title:
  ALSA underruns occurr when using QEMU

Status in QEMU:
  Expired

Bug description:
  I'm running QEMU 1.6.1 on a 64-bit Gentoo Linux system. The guest
  operating system is Windows 7 32-bit. I get multiple identical warning
  messages when using the ac97 or hda sound cards:

  > ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.0.27.2/work/alsa-
  lib-1.0.27.2/src/pcm/pcm.c:7843:(snd_pcm_recover) underrun occurred

  The difference between ac97 and hda is that the former works well,
  while the latter causes the sound to be garbled.

  /var/tmp/portage is the directory where Portage, the Gentoo package
  manager, builds programs. I don't know why it is mentioned in the
  error message.

  I also don't know if this is an ALSA problem or a QEMU problem.

  The command I use is:

  > qemu-system-i386 -cpu host -m 1G -k it -drive
  file=3D~/QEMU/Windows_7_Privato.qcow2,media=3Ddisk,index=3D0 -vga std -net
  nic -net user -enable-kvm -display sdl -soundhw ac97 -device usb-
  ehci,id=3Dehci -usb -rtc base=3Dlocaltime -usbdevice tablet

  My real sound card is an Intel HD Audio:

  > lspci | grep "Audio device"

  > 00:1b.0 Audio device: Intel Corporation 82801I (ICH9 Family) HD
  Audio Controller (rev 02)

  Please tell me if you need other informations.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1255303/+subscriptions

