Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D03C32C7
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:28:13 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24b6-0001tM-FM
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z9-0007nt-3O
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:45136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z6-0000VP-0z
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Z0-0003md-Jo
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D7D842E81BC
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:39 -0000
From: Launchpad Bug Tracker <1906608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor ruimeiyan th-huth
X-Launchpad-Bug-Reporter: ruimeiyan (ruimeiyan)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160697929082.24737.7684799499074231317.malonedeb@gac.canonical.com>
Message-Id: <162589065985.5654.12698948535798046584.malone@loganberry.canonical.com>
Subject: [Bug 1906608] Re:  [Feature request]For some ehci controller,
 qemu should implement using portsc[26-27] to detect the speed of
 device.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: da9dcb1c52977879ea699fb3565fa8d26819e8a8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906608 <1906608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906608

Title:
   [Feature request]For some ehci controller, qemu should implement
  using portsc[26-27]  to detect the speed of device.

Status in QEMU:
  Expired

Bug description:
  for some ehci controller ,for example ehci controller on fsl_imx6,it
  using portsc[26-27] to decide a full speed device or high speed device
  was connected, hub-ehci.c should set the portsc[26-27] to return the
  right speed.

  line:1001 in hub-ehci.c
          if (dev && dev->attached && (dev->speedmask & USB_SPEED_MASK_HIGH=
)) {
              val |=3D PORTSC_PED;
          }

  below is the spec for fsl_imx6 USB PART.
  PORTSC:27=E2=80=9326 :PSPD
  Port Speed - Read Only.
  This register field indicates the speed at which the port is operating.
  00 Full Speed
  01 Low Speed
  10 High Speed
  11 Undefined

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906608/+subscriptions

