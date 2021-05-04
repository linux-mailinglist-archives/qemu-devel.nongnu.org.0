Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72FD3726A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:39:17 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpeH-0005x0-16
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZv-0002Cl-Sv
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZt-0002XT-VC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldpZr-0004R3-CX
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:34:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5AF8F2E8195
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 07:34:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 07:23:15 -0000
From: Thomas Huth <1511887@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=wine1.6; component=universe;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: hid oscilloscope uhci usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jirkacejka th-huth
X-Launchpad-Bug-Reporter: Jiri Cejka (jirkacejka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151031002349.21474.82964.malonedeb@soybean.canonical.com>
Message-Id: <162011299509.12465.13708991042905583449.malone@soybean.canonical.com>
Subject: [Bug 1511887] Re: USB device 1.1 not correctly passedthru from Linux
 host to Windows guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e94c4815a3ed8f4c27bd35f3bf2488e185c22558
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
Reply-To: Bug 1511887 <1511887@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/118


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #118
   https://gitlab.com/qemu-project/qemu/-/issues/118

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1511887

Title:
  USB device 1.1 not correctly passedthru from Linux host to Windows
  guest

Status in QEMU:
  Expired
Status in wine1.6 package in Ubuntu:
  New

Bug description:
  I have USB Digital Oscilloscope which works great on pure Windows
  machine but not work on virtualized one. I tried passthru the device
  from my Debian Jessie (64bit) host machine to Windows 7 (32bit) guest
  machine but unfortunately it does not work very well. It looks that
  device is passed thru so Windows machine knows about new device and
  loads HID device driver for it but the device driver failed to start
  the device and details of an error provided by device manager is "This
  device cannot start" Code 10.

  Installed Qemu version: 2.1+dfsg-12+deb8u4 0

  USB device spec: Dynon Instruments ELAB-080, USB 1.1

  On linux host computer
  ---------------------------
  lsusb identify it as:
  Bus 003 Device 009: ID 13a3:0001 =


  lsusb -t identify it as:
  /: Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
      |__ Port 1: Dev 9, If 0, Class=3DHuman Interface Device, Driver=3Dusb=
hid, 12M

  This is how I started my Windows guest machine
  ------------------------------------------------------
  kvm -cpu host \
      -m 2048MiB \
      -hda test.vdi \
      -ctrl-grab \
      -parallel /dev/parport0 \
      -usbdevice host:13a3:0001

  ...also instead of last line I tried this one:
      -device usb-host,vendorid=3D0x13a3,productid=3D0x0001

  none of them help to properly handle my device inside guest machine.

  Only one time the Windows guest machine properly start the device so
  software for that oscilloscope can identify the Oscilloscope and
  measure for a while but unfortunately after I guess 5 seconds of
  measurement the device was disconnected from Windows and never start
  working again even after couple of restarts of guest machine even
  after plug and unplug it's USB cable and power cable.

  I searched for a solution or some clues to get it work but none of my
  searching over the internet was successful. Because device works on
  pure Windows but not work on virtualized one, I think there is a
  problem with handling not standard USB devices (like sticks,
  keyboards, mouses etc.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1511887/+subscriptions

