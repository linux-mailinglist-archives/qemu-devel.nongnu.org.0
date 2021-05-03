Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC176371496
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:52:20 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX7b-00084R-PX
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWvM-0005f4-Uf
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:39:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWvC-0002uz-AJ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:39:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldWvA-0004N3-OC
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:39:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B0AB82E815F
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 11:39:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 11:27:03 -0000
From: Thomas Huth <1096714@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h hramrach kraxel-redhat sven-koehler
 th-huth
X-Launchpad-Bug-Reporter: Sven (sven-koehler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130107012337.1165.80927.malonedeb@gac.canonical.com>
Message-Id: <162004122349.4638.8731331269093468189.malone@chaenomeles.canonical.com>
Subject: [Bug 1096714] Re: qemu 1.3.0: usb devices shouldn't have same
 vendor/product ID and same serial
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 3bbc5fe0a6ec56795324913a67d7856e4fad99e2
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
Reply-To: Bug 1096714 <1096714@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/92


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #92
   https://gitlab.com/qemu-project/qemu/-/issues/92

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1096714

Title:
  qemu 1.3.0: usb devices shouldn't have same vendor/product ID and same
  serial

Status in QEMU:
  Expired

Bug description:
  Boot Windows XP with
  ./qemu-system-i386 -device pci-ohci -device usb-tablet
  and then with
  ./qemu-system-i386 -device pci-ohci -device usb-kbd

  and you will notice, that the usb keyboard is not detected. In fact,
  Windows XP detects the usb tablet and loads the driver for the tablet
  instead of the driver for the keyboard.

  The problem seems to be, that vendor and product ID and even the
  seriel of both the usb tablet and the usb keyboard are the same as an
  lsusb reveiles. Hence, Windows XP doesn't detect when you replace the
  tablet by a keyboard and vice versa. I didn't check other USB devices,
  but it seems a bad idea to me to have devices with the same
  vendor/product Id. I'm not aware, whether it is sufficient to change
  the seriel numbers of the devices.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1096714/+subscriptions

