Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937913C32DA
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:34:55 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24ha-0003x3-Lx
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZC-0007ts-At
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZA-0000Yt-KG
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Z6-0003jQ-3U
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4EADE2E824F
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1906184@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux sound stuttering
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fghgfh832 janitor th-huth
X-Launchpad-Bug-Reporter: johannes (fghgfh832)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160668360643.8467.1174467621705698044.malonedeb@soybean.canonical.com>
Message-Id: <162589064325.5654.15584100043205756592.malone@loganberry.canonical.com>
Subject: [Bug 1906184] Re: Lots of stuttering/crackling in guest sound
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: d8adaddf51ddf4d87433f4e914843c7bfdf61858
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906184 <1906184@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906184

Title:
  Lots of stuttering/crackling in guest sound

Status in QEMU:
  Expired

Bug description:
  When listening to music (e.g. with VLC) or watching Youtube on the
  guest, there's lots of stuttering and crackling in the sound.

  =

  Tested with the following QEMU start commands:

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga virtio -soundhw
  hda -display sdl,gl=3Don

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
  -display sdl

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -vga qxl -soundhw hda
  -display gtk

  =

  If I use the following command (QXL graphics, "remote" access via SPICE o=
ver unix socket), stuttering is not completely gone but MUCH less annoying:

  qemu-system-x86_64 -enable-kvm -m 6G -cpu host -smp 3 -cdrom
  ./linux/kubuntu-20.04-desktop-amd64.iso -boot d -soundhw hda -vga qxl
  -device virtio-serial-pci -device
  virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spice.0 -chardev
  spicevmc,id=3Dspicechannel0,name=3Dvdagent -spice
  unix,addr=3D/tmp/vm_spice.socket,disable-ticketing

  and this command for accessing the VM:
  remote-viewer spice+unix:///tmp/vm_spice.socket =



  Guest: Kubuntu 20.04 64-bit (live), but occurs with many other as well
  Host: Arch Linux, with KDE desktop
  CPU: Intel Xeon E3-1230v2 (4 cores + hyperthreading)
  RAM: 16 GB
  GPU: Nvidia GTX 980 Ti

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906184/+subscriptions

