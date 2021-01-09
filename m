Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FC2EFDC9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:40:29 +0100 (CET)
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky63A-0000KI-BC
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q4-0000DX-Kn
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q0-00072v-8F
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pn-0006xq-1v
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 926A92E81A2
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:45 -0000
From: Launchpad Bug Tracker <1689003@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor mhaertel th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Manfred_H=C3=A4rtel_=28mhaertel=29?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170507042529.2427.25374.malonedeb@wampee.canonical.com>
Message-Id: <161016586571.8490.6215134117021246819.malone@loganberry.canonical.com>
Subject: [Bug 1689003] Re: USB passthrough should not fail if SET
 CONFIGURATION fails
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: d0ff4b9bf671810f3067a89bfa0fd6827623f3f2
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
Reply-To: Bug 1689003 <1689003@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1689003

Title:
  USB passthrough should not fail if SET CONFIGURATION fails

Status in QEMU:
  Expired

Bug description:
  QEMU's USB passthrough was not working for my new smartphone.

  While analyzing the problem, I found out that a SET CONFIGURATION
  Request was NACKed by the USB device (probably because a SET
  CONFIGURATION request was already sent from the host to the device).

  So I wrote a simple program to fake a successful call to
  libusb_set_configuration and did an LD_PRELOAD on this program before
  starting qemu, and it worked.

  Looking at QEMU's code in host-libusb.c, I can see that QEMU does not
  try to claim the interface if its call to libusb_set_configuration
  fails.

  I think QEMU should try to claim the device anyway even if
  libusb_set_configuration fails.

  I did my tests against QEMU 2.6.2, but as I can see from the source
  code, this problem should happen on all versions.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1689003/+subscriptions

