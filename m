Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1836796F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:46:04 +0200 (CEST)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSA7-00048Y-G6
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS08-0007KJ-0V
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:35:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:51662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS06-0004oU-6n
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:35:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZS04-0003Wf-R2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:35:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BBE912E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:35:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:29:37 -0000
From: Thomas Huth <1732981@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: netrolller-3d th-huth
X-Launchpad-Bug-Reporter: Googulator (netrolller-3d)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151094878036.7381.9952784988294541160.malonedeb@soybean.canonical.com>
Message-Id: <161906937782.6248.8200422094007839721.malone@chaenomeles.canonical.com>
Subject: [Bug 1732981] Re: usb-net on aarch64 has wrong class IDs,
 isn't recognized by Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 35ce8d834a72332f380042cb0592402290aad059
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
Reply-To: Bug 1732981 <1732981@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1732981

Title:
  usb-net on aarch64 has wrong class IDs, isn't recognized by Windows

Status in QEMU:
  Incomplete

Bug description:
  If I run qemu-system-aarch64 with "-device usb-net,...", the resulting
  USB device will be seen in the guest as class 0x2, subclass 0x2,
  protocol 0xFF, instead of the expected class 0xe0, subclass 0x1,
  protocol 0x3. This prevents Windows' in-box class driver from binding
  to the device. On x86 and x64 Windows, this is not an issue, as
  another driver will bind to the device, but in Windows for ARM64, that
  driver is unavailable, so the USB device is incorrectly recognized as
  a serial port.

  Installing a modified version of the inbox driver in "Disable Driver
  Signature Enforcement" mode solves the issue, but it's not a very
  clean solution.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1732981/+subscriptions

