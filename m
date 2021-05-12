Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB837BC54
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:13:06 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnjd-0002gu-1U
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnhX-0000zk-BL
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:10:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnhT-0001Ss-Ta
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:10:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnhR-0001a0-63
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:10:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A7322E802E
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 12:03:38 -0000
From: Christian Schoenebeck <1908832@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: koalinux schoenebeck th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Jos=C3=A9_Pekkarinen_=28koalinux=29?=
X-Launchpad-Bug-Modifier: Christian Schoenebeck (schoenebeck)
References: <160848897234.4298.12739306431901820443.malonedeb@wampee.canonical.com>
Message-Id: <162082101816.22799.11122340542190694830.malone@soybean.canonical.com>
Subject: [Bug 1908832] Re: jack audio dev produces no sound
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: c4df89e32b1b01744bc7866d607d7c548aefe7b0
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
Reply-To: Bug 1908832 <1908832@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just for the records: the proposed patch was discussed on the QEMU
mailing list, but there was no final consensus (yet) to accept the
patch. Full discussion:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg785555.html

It's probably Ok to let this report expire for now. If there are more
users complaining about the current design of expecting the user to
connect QEMU's JACK ports, then we can still go ahead with the  patch.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908832

Title:
  jack audio dev produces no sound

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  I'm testing the new jack audiodev backend in my
  laptop. The host system is gentoo, using the
  ebuild for qemu 5.1.0-r2, and I'm using jack
  use flag globally in the system so any ebuild
  that have support for jack should be build with
  it. The jack setup reportedly works as I use it
  with firefox, and mumble with no trouble. When
  I launch the following script, I see the vm
  connects to jack:

  /usr/bin/qemu-system-x86_64 -enable-kvm -M q35 -vga virtio -display gtk,g=
l=3Don \
          -cpu host -smp 2,cores=3D2,threads=3D1 \
          -m 4G -L /usr/share/qemu \
          -global ICH9-LPC.disable_s3=3D1 -global ICH9-LPC.disable_s4=3D1 \
          -drive file=3D/usr/share/edk2-ovmf/OVMF_CODE.fd,if=3Dpflash,forma=
t=3Draw,unit=3D0,readonly=3Don \
          -drive file=3Ddebian_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1 \
          -audiodev id=3Djack,driver=3Djack -device ich9-intel-hda -device =
hda-duplex,audiodev=3Djack \
          -device virtio-serial-pci \
          -device virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.=
spice.0 \
          -chardev spicevmc,id=3Dspicechannel0,name=3Dvdagent \
          -device nec-usb-xhci,id=3Dusb \
          -device usb-host,vendorid=3D0x04ca,productid=3D0x708e \
          -device usb-host,vendorid=3D0x1050,productid=3D0x0407 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev1 \
          -device usb-redir,chardev=3Dusbredirchardev1,id=3Dusbredirdev1 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev2 \
          -device usb-redir,chardev=3Dusbredirchardev2,id=3Dusbredirdev2 \
          -chardev spicevmc,name=3Dusbredir,id=3Dusbredirchardev3 \
          -device usb-redir,chardev=3Dusbredirchardev3,id=3Dusbredirdev3 \
          -netdev user,id=3Duser.0 -device virtio-net-pci,netdev=3Duser.0 \
          -drive file=3Ddebian.qcow2,cache=3Dnone,aio=3Dio_uring,if=3Dvirtio

  Output of vm initialization:

  jack: JACK output configured for 48000Hz (1024 samples)
  jack: JACK input configured for 48000Hz (1024 samples)
  gl_version 46 - core profile enabled
  GLSL feature level 430

  Though executing any application that uses sound,
  for instance, any youtube video through browser,
  I listen nothing. By executing pkill jackd, and
  launching the same script replacing the audiodev
  line for the following:

          -audiodev id=3Dalsa,driver=3Dalsa -device ich9-intel-hda -device
  hda-duplex,audiodev=3Dalsa \

  The audio works, and I can listen to music, or
  any other kind of application, though I cannot
  listen anything else in the host.

  The guest is a simple debian testing(bullseye)
  system with plasma desktop, using pulseaudio,
  nothing fancy.

  Thanks!

  Jos=C3=A9

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908832/+subscriptions

