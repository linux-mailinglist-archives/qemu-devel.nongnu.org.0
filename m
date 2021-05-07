Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3F3766F7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:17:10 +0200 (CEST)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1Hx-00065U-Bd
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lf1Gd-0005Bx-6x
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:15:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lf1Ga-0007Rq-Vc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:15:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lf1GY-00054y-Eh
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 14:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6775D2E818E
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 14:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 14:08:03 -0000
From: TheCatFelix <1884684@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth thecatfelix
X-Launchpad-Bug-Reporter: TheCatFelix (thecatfelix)
X-Launchpad-Bug-Modifier: TheCatFelix (thecatfelix)
References: <159287262873.13509.14889128175029136647.malonedeb@wampee.canonical.com>
Message-Id: <162039648401.6207.15462343012102975122.malone@gac.canonical.com>
Subject: [Bug 1884684] Re: QEMU 5.0: Guest VM hangs/freeze when unplugging USB
 device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: a6ba7bf637de9b5620e853a3b7f3b687426bc3b0
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
Reply-To: Bug 1884684 <1884684@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issue does not occur in latest version of QEMU anymore.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884684

Title:
  QEMU 5.0: Guest VM hangs/freeze when unplugging USB device

Status in QEMU:
  Fix Released

Bug description:
  Setup:

  Host: Debian/SID, Kernel 5.6, QEMU 5.0
  Guest: Windows 10 VM with PCI and USB device passthrough.

  Problem: Guest VM suddenly hangs when pulling USB device out from the
  Host.

  Observations:
   - Issue appears to be related to QEMU 5.0
     - It started after an upgrade to QEMU 5.0.
     - Downgrading only QEMU on multiple systems fixes the issue.

   - Issue is very reproducible.
     - Most of the time within a few attempts of pulling/reconnecting the d=
evice.
     - Issue happens with multiple devices (I did try standard HID devices,=
 a webcam and an x-ray sensor).

   - Guest just hangs.
     - Display output remains on last frame shown.
     - Ping to Guest immediately stops working.
     - Logs in the Guest stop logging immediately.

   - Host is fine and thinks the Guest is fine. =

     - Guest continues to show as running in "virsh list".
     - No suspicious entries in the QEMU logs.
     - No suspicious entries in Host syslogs/messages.
     - Host can can kill guest "virsh destroy" and respawn fine.

   - Issue seems widespread.
     - Multiple similar reports from ProxMox users after upgrade to ProxMox=
 6.2 for both Windows and Linux guests (First version that uses QEMU 5.0)

  https://forum.proxmox.com/threads/vm-freezes-when-disconnecting-usb-keybo=
ard-and-mouse.70287/
  https://forum.proxmox.com/threads/usb-drive-crashes-vm.70214/
  https://forum.proxmox.com/threads/latest-proxmox-usb-disconnects-freeze-k=
vm.70398/
  https://forum.proxmox.com/threads/vm-with-gpu-passthrough-freezes-when-tu=
rning-off-monitor-after-proxmox-6-2-upgrade.69821/
  https://forum.proxmox.com/threads/vm-with-gpu-passthrough-freezes-when-tu=
rning-off-monitor-after-proxmox-6-2-upgrade.69824/

  I'd be more than happy any debugs that might be helpful.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884684/+subscriptions

