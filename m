Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16133736B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:02:41 +0200 (CEST)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDQW-0001bc-TB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOt-0000jp-6K
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:48388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leDOq-0000IC-Mk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leDOo-0008Pu-Qp
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C87A42E813A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 09:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:52:05 -0000
From: Thomas Huth <1809665@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kawsper saveriomiroddi th-huth ticketsolve
X-Launchpad-Bug-Reporter: Saverio Miroddi (saveriomiroddi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154566626385.25910.12711983515604457304.malonedeb@chaenomeles.canonical.com>
Message-Id: <162020472587.6225.15034703676026177592.malone@wampee.canonical.com>
Subject: [Bug 1809665] Re: Xbox One controller USB passthrough disconnections
 and stops
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 83280843964c4e93645abaad2244813b09f15843
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1809665 <1809665@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/157


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #157
   https://gitlab.com/qemu-project/qemu/-/issues/157

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809665

Title:
  Xbox One controller USB passthrough disconnections and stops

Status in QEMU:
  Expired

Bug description:
  I can't properly passthrough my Xbox One controller to a virtual
  machine; it causes USB disconnections on the host, ultimately
  preventing it to work (at all) on the guest

  I've seen a few other cases reported in other websites, which show the
  same symptoms:

  - https://www.reddit.com/r/VFIO/comments/97dhbw/qemu_w10_xbox_one_control=
ler
  - https://unix.stackexchange.com/questions/452751/how-can-i-pass-through-=
an-xbox-one-controller-to-a-windows-vm-on-ubuntu

  This is sample:

      libusb: error [udev_hotplug_event] ignoring udev action bind
      qemu-system-x86_64: libusb_release_interface: -4 [NO_DEVICE]
      qemu-system-x86_64: libusb_release_interface: -4 [NO_DEVICE]
      qemu-system-x86_64: libusb_release_interface: -4 [NO_DEVICE]
      libusb: error [_get_usbfs_fd] File doesn't exist, wait 10 ms and try =
again
      libusb: error [_get_usbfs_fd] libusb couldn't open USB device
          /dev/bus/usb/003/016: No such file or directory

  I think this is a quite long-standing issue, as I've been experiencing
  through several versions, including the current one (3.1).

  I can reproduce this 100% of the times, on multiple host O/S
  distributions (the current one being based on Ubuntu 18.04 x86-64).

  I compile QEMU directly from source, and execute it via commandline;
  the command is very long, however, the relevant part is standard (I
  think):

      -usb \
      -device usb-tablet \
      -device usb-host,vendorid=3D0x$VGAPT_XBOX_PAD_VEND_ID,productid=3D0x$=
VGAPT_XBOX_PAD_PROD_ID \

  The guest is Windows 10 64bit.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809665/+subscriptions

