Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC73AFC48
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:57:12 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYTH-0005GS-9w
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY09-0008U9-LA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:58042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzz-0005Sq-Ep
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:27:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzm-00015i-47
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E53102E8206
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:49 -0000
From: Launchpad Bug Tracker <1732981@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor netrolller-3d th-huth
X-Launchpad-Bug-Reporter: Googulator (netrolller-3d)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151094878036.7381.9952784988294541160.malonedeb@soybean.canonical.com>
Message-Id: <162433547011.20423.9458916521921097997.malone@loganberry.canonical.com>
Subject: [Bug 1732981] Re: usb-net on aarch64 has wrong class IDs,
 isn't recognized by Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 32f3b0cfd06fc4e608f9706e5facdfa1f54fcad7
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
Reply-To: Bug 1732981 <1732981@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1732981

Title:
  usb-net on aarch64 has wrong class IDs, isn't recognized by Windows

Status in QEMU:
  Expired

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

