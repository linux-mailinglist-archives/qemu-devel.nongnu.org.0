Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F97F377001
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:13:15 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGDC-0001yt-Eb
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGAs-0008Ic-0a
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:10:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:54118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGAq-0001BR-FM
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:10:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGAo-0006vk-3S
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 171962E8136
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:01:45 -0000
From: Thomas Huth <1892544@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159803800981.15495.12589210706265225996.malonedeb@soybean.canonical.com>
Message-Id: <162045370533.10951.12312752879823181931.malone@chaenomeles.canonical.com>
Subject: [Bug 1892544] Re: meson qemu 5.2 can not built with msys2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: a5d7fd4e033f02e25ea55b34085bf51b79e93b6b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1892544 <1892544@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As far as I know, MSYS2 was finally working again after the change to
the meson build system, so this should have been fixed. If there are
still problems left, please open a new ticket in the new issue tracker
at gitlab: https://gitlab.com/qemu-project/qemu/-/issues

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892544

Title:
  meson qemu 5.2 can not built with msys2

Status in QEMU:
  Fix Released

Bug description:
  pacman -S base-devel mingw-w64-x86_64-toolchain git
  pacman -S mingw-w64-x86_64-python mingw-w64-x86_64-python-setuptools
  pacman -S mingw-w64-x86_64-spice-protocol

  cd /mingw64/bin
  cp x86_64-w64-mingw32-gcc-ar.exe x86_64-w64-mingw32-ar.exe
  cp x86_64-w64-mingw32-gcc-ranlib.exe x86_64-w64-mingw32-ranlib.exe
  cp windres.exe x86_64-w64-mingw32-windres.exe
  cp nm.exe x86_64-w64-mingw32-nm.exe
  cp objcopy.exe x86_64-w64-mingw32-objcopy.exe
  cd ~
  cd qemu.org-x64

  =

  ../qemu.org/configure \
    --python=3Dpython3 \
    --cross-prefix=3Dx86_64-w64-mingw32- --enable-gtk --enable-sdl \
    --enable-capstone=3Dgit \
    --enable-stack-protector \
    --enable-gnutls \
    --enable-nettle \
    --enable-vnc \
    --enable-vnc-sasl \
    --enable-vnc-jpeg \
    --enable-vnc-png \
    --enable-membarrier \
    --enable-slirp=3Dgit \
    --disable-kvm \
    --enable-hax \
    --enable-whpx \
    --disable-spice \
    --enable-lzo \
    --enable-snappy \
    --enable-bzip2 \
    --enable-vdi \
    --enable-qcow1 \
    --enable-tools \
    --enable-libusb \
    --enable-usb-redir \
    --disable-libnfs \
    --enable-libssh

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892544/+subscriptions

