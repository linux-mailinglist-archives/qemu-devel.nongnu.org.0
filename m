Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606402B9845
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:43:43 +0100 (CET)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn26-0004yZ-BU
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuU-0004pF-A0
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfmuN-0004n8-0W
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:35:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfmuK-0006Rb-PC
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BE1102E813D
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 16:22:55 -0000
From: Thomas Huth <1530035@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kazbloxmc th-huth
X-Launchpad-Bug-Reporter: Jackson Bryn (kazbloxmc)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151230064849.12912.72842.malonedeb@chaenomeles.canonical.com>
Message-Id: <160580297566.18440.13387871905377390433.malone@gac.canonical.com>
Subject: [Bug 1530035] Re: usb-host: ATI Technologies,
 Inc. TV Wonder acts as a different device if used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 7ab9bbe61ce5adc5f8e1807d5427ad53928f9adb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:30:48
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
Reply-To: Bug 1530035 <1530035@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1530035

Title:
  usb-host: ATI Technologies, Inc. TV Wonder acts as a different device
  if used

Status in QEMU:
  Incomplete

Bug description:
  Title says it all. If you try to use the "ATI Technologies, Inc. TV
  Wonder" USB 1.1 TV Tuner for passthrough under any OS that has drivers
  for the device, the usb-host driver will confuse itself and give the
  device a new PID number for Linux.

  Tested on ReactOS and Windows XP with stable QEMU package from pacman
  on Arch Linux.

  Commands used: sudo qemu-system-x86_64 -enable-kvm -hda
  ~/QEMU/hd/winxp.img -usb -device usb-host,hostbus=3D2,hostaddr=3D3 -vga
  vmware

  Before starting qemu-kvm, lsusb reports:
  [
  Bus 002 Device 003: ID 0528:7561 ATI Technologies, Inc. TV Wonder
  ]

  After starting qemu-kvm, usb-host and lsusb report:
  [
  libusb: error [_get_usbfs_fd] File doesn't exist, wait 10 ms and try again
  libusb: error [_get_usbfs_fd] libusb couldn't open USB device /dev/bus/us=
b/002/003: No such file or directory

  The device in Bus 2, Device 3 is gone and it appears as this instead:
  Bus 002 Device 005: ID 0573:0400 Zoran Co. Personal Media Division (Nogat=
ech) D-Link V100
  ]

  This weird effect only lasts until you unplug the TV Wonder.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1530035/+subscriptions

