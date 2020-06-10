Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58701F4F29
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:54 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jivI5-0000Ck-RD
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 03:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jivH5-0007lX-4Q
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 03:35:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jivH4-0001w9-44
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 03:35:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jivH0-00013J-DH
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 07:35:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 391F52E8110
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 07:35:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2020 07:26:38 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1882817@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd theartlav
X-Launchpad-Bug-Reporter: Artyom (theartlav)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159172265471.31406.7196816329603804386.malonedeb@gac.canonical.com>
Message-Id: <159177399870.32462.17975347693674032703.launchpad@gac.canonical.com>
Subject: [Bug 1882817] Re: Segfault in audio_pcm_sw_write with audio over VNC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b17b448dc08fbea4b63689feaf267307dadec97a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 03:25:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1882817 <1882817@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882817

Title:
  Segfault in audio_pcm_sw_write with audio over VNC

Status in QEMU:
  In Progress

Bug description:
  QEMU 5.0.0, built with ./configure --target-list=3Dx86_64-softmmu
  --enable-debug --disable-strip --disable-docs --disable-sdl

  Running on a headless host (Ryzen 3600), Arch Linux, 64bit latest.
  Guest is also Arch Linux, 64bit.

  Started with qemu-system-x86_64 -vnc 0.0.0.0:0 -enable-kvm -m 4096 -cpu h=
ost -smp cores=3D2,threads=3D1,sockets=3D1 -machine q35 -vga std -device
   ich9-ahci,id=3Dahci -drive file=3Dvm0.qcow2,format=3Dqcow2,if=3Dnone,id=
=3Ddsk0 -device ide-hd,drive=3Ddsk0,bus=3Dahci.0 -soundhw hda

  So, a headless VM is running on a server and is being connected to
  over VNC. The virtual sound card is detected and speaker test is
  running inside the VM. So far so good.

  Then, i tell the VNC client to enable audio (QEMU Audio Client
  Message, 255,1,0). QEMU responds with a "stream is about to start"
  message (QEMU Audio Server Message, 255,1,1) and then promptly crashes
  without sending anything else.

  Running it in GDB produces a crash at audio/audio.c:739

  Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
  audio_pcm_sw_write (sw=3D0x5555575bbf30, buf=3D0x0, size=3D1628) at audio=
/audio.c:739
  739             if (!sw->hw->pcm_ops->volume_out) {

  The exact sequence of events does not matter - i can enable sound
  before playing anything, and then it would say nothing and keep
  working, but crash with the same message once anything sound-playing
  is launched in the VM.

  Using different soundhw or adding various audiodev options does not
  seem to affect anything.

  I can't quite figure out if the QEMU Audio VNC extension is supposed
  to work at all or not, but it would be handy to me if it is.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882817/+subscriptions

