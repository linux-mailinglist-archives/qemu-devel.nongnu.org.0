Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE72D9218
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 04:47:32 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koepf-0005zJ-AO
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 22:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koenz-0005ZH-3g
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 22:45:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:58860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koenw-0007u5-B6
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 22:45:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1koent-0008Ew-G3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7773D2E8138
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:45:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Dec 2020 03:39:04 -0000
From: Diego Viola <1892581@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Diego Viola (diego-viola)
References: <159810419955.15369.6411904597131705076.malonedeb@soybean.canonical.com>
Message-Id: <160791714445.16547.11748618846813465909.malone@chaenomeles.canonical.com>
Subject: [Bug 1892581] Re: QEMU 5.1 no longer says anything about inaccessible
 devices
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: f7b94f842b76c6fab1695e596934ffb015cf8516
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
Reply-To: Bug 1892581 <1892581@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I no longer need this (it's no longer an issue for me), feel free to
reopen if this issue affects you.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892581

Title:
  QEMU 5.1 no longer says anything about inaccessible devices

Status in QEMU:
  Incomplete

Bug description:
  Previously, with QEMU 5.0.0 running a VM with the following command:

  $ qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -device
  usb-ehci,id=3Dehci -device usb-
  host,bus=3Dehci.0,vendorid=3D0x04f2,productid=3D0xb449 -device intel-hda
  -device hda-duplex -vga virtio

  Would display something like the following:

  libusb: error [_get_usbfs_fd] libusb couldn't open USB device /dev/bus/us=
b/002/004: Permission denied
  libusb: error [_get_usbfs_fd] libusb requires write access to USB device =
nodes.
  libusb: error [_get_usbfs_fd] libusb couldn't open USB device /dev/bus/us=
b/002/004: Permission denied
  libusb: error [_get_usbfs_fd] libusb requires write access to USB device =
nodes.

  With insufficient permissions.

  QEMU 5.1.0 no longer displays anything.

  I did a git bisect and this is the result:

  [diego@thinkpad qemu]$ git bisect bad
  9f815e83e983d247a3cd67579d2d9c1765adc644 is the first bad commit
  commit 9f815e83e983d247a3cd67579d2d9c1765adc644
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Fri Jun 5 14:59:52 2020 +0200

      usb: add hostdevice property to usb-host

      The new property allows to specify usb host device name.  Uses standa=
rd
      qemu_open(), so both file system path (/dev/bus/usb/$bus/$dev on linu=
x)
      and file descriptor passing can be used.

      Requires libusb 1.0.23 or newer.  The hostdevice property is only
      present in case qemu is compiled against a new enough library version,
      so the presence of the property can be used for feature detection.

      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Message-Id: <20200605125952.13113-1-kraxel@redhat.com>

   hw/usb/host-libusb.c | 75 ++++++++++++++++++++++++++++++++++++++++++----=
------
   hw/usb/trace-events  |  1 +
   2 files changed, 62 insertions(+), 14 deletions(-)
  [diego@thinkpad qemu]$

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892581/+subscriptions

