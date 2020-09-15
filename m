Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EFD26AB6A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 20:03:44 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIFIt-00078q-Up
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 14:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kIFGI-0005NW-5r
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 14:01:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:52486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kIFGD-0000zI-8P
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 14:01:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kIFGB-00058o-3c
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 18:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1A7892E804B
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 18:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2020 17:51:09 -0000
From: Brendan Dolan-Gavitt <1892604@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brendandg pauldzim petunia2000 pmaydell
X-Launchpad-Bug-Reporter: Brendan Dolan-Gavitt (brendandg)
X-Launchpad-Bug-Modifier: Brendan Dolan-Gavitt (brendandg)
References: <159814309088.988.14645850566795174578.malonedeb@wampee.canonical.com>
Message-Id: <160019227021.22139.106462529568441270.malone@wampee.canonical.com>
Subject: [Bug 1892604] Re: qemu-system-arm: ../hw/usb/hcd-dwc2.c:666:
 dwc2_glbreg_read: Assertion `addr <= GINTSTS2' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: f5d06949ce3aa5a47117b8dd42e04e28cef3e7e6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 09:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1892604 <1892604@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That part is easily fixed by running

qemu-img resize 2016-05-27-raspbian-jessie.img 4G

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892604

Title:
  qemu-system-arm: ../hw/usb/hcd-dwc2.c:666: dwc2_glbreg_read: Assertion
  `addr <=3D GINTSTS2' failed.

Status in QEMU:
  New

Bug description:
  When trying to run the 2016-05-27 Raspbian image on the emulated
  raspi2 platform, the system boots but shortly after the login prompt
  QEMU (master; commit ID ca489cd037e4d50dc6c40570a167504ad7e5a521) dies
  with:

  qemu-system-arm: ../hw/usb/hcd-dwc2.c:666: dwc2_glbreg_read: Assertion
  `addr <=3D GINTSTS2' failed.

  Steps to reproduce:

  1. Get the image: wget
  http://downloads.raspberrypi.org/raspbian/images/raspbian-2016-05-31/2016=
-05-27
  -raspbian-jessie.zip

  2. Extract the kernel image and DTB:

  sudo losetup -f --show -P 2016-05-27-raspbian-jessie.img
  sudo mkdir /mnt/rpi
  sudo mount /dev/loop11p1 /mnt/rpi/
  cp /mnt/rpi/kernel7.img .                                                =
                                                                           =
                                                                           =
                                                                   =

  cp /mnt/rpi/bcm2709-rpi-2-b.dtb .                                        =
                                                                           =
                                                                           =
                                                                   =

  sudo umount /mnt/rpi =

  sudo losetup -d /dev/loop11 =


  3. Run QEMU:
  qemu-system-arm -M raspi2 -m 1G -dtb bcm2709-rpi-2-b.dtb -kernel kernel7.=
img -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200 dwc_otg.l=
pm_enable=3D0 root=3D/dev/mmcblk0p2" -sd 2016-05-27-raspbian-jessie.img -sm=
p 4 -serial stdio -display none

  A few seconds after the login prompt is displayed, QEMU will exit with
  the assertion failure.

  I also tried changing all of the asserts to if statements that (for
  MMIO reads) returned 0 and (for writes) just returned, but this
  resulted in a non-responsive system.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892604/+subscriptions

