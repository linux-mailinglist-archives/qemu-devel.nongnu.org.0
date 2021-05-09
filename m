Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E84377709
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:39:14 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkaP-0007S9-3B
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkWt-0001GS-Rp
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:53196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkWq-0007UU-KN
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkWp-0005Od-C6
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:35:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A4112E800F
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:35:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:28:10 -0000
From: Thomas Huth <1898490@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ethannij noneenon novhak s-launchpad-paulsd-com
 th-huth
X-Launchpad-Bug-Reporter: Ethan (ethannij)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160185589302.24503.10461684970761806737.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057049081.16222.12376444704432889329.malone@soybean.canonical.com>
Subject: [Bug 1898490] Re: gtk with virtio and opengl black screen
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 46099a10044190d9630e1350aa373d5b32872e3f
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
Reply-To: Bug 1898490 <1898490@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898490

Title:
  gtk with virtio and opengl black screen

Status in QEMU:
  Incomplete

Bug description:
  qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display sdl,gl=3Don Boots properly and has working 3d
  acceleration with virgl.

  Running qemu-system-x86_64 -name manjaro -enable-kvm -cpu host -smp
  cores=3D4,threads=3D1 -M q35 -m 8G -cdrom /mnt/Storage/ISO/manjaro-
  gnome-20.0.3-minimal-200606-linux56.iso -machine type=3Dpc,accel=3Dkvm
  -vga virtio -display gtk,gl=3Don however, (difference being gtk instead
  of sdl), the screen is black, and the vm still starts.

  System Specs
  Gentoo Linux 64bit
  Gentoo-Sources 5.8.13 Kernel
  Qemu 5.10.0-r1 compiled with USE=3D"aio bzip2 caps curl fdt filecaps gtk =
jpeg ncurses nls opengl oss pin-upstream-blobs png pulseaudio sdl seccomp s=
lirp spice usb usbredir vhost-net virgl vnc xattr xkb" PYTHON_TARGETS=3D"py=
thon3_7" QEMU_SOFTMMU_TARGETS=3D"x86_64" QEMU_USER_TARGETS=3D"x86_64"

  Ryzen 7 2700x
  Nvidia 1070ti GPU

  I can confirm the same issue when using libvirt with opengl.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898490/+subscriptions

