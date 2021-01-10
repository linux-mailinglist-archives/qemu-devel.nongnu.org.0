Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44A2F050E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:27:48 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySKR-0000yA-QN
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIi-0007kc-S5
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:40216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIg-0000ew-P1
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySId-0000Cm-Uh
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BAD322E8145
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:32 -0000
From: Launchpad Bug Tracker <1778182@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cirosantilli janitor pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2lybyBTYW50aWxsaSDlha3lm5vkuovku7Yg?=
 =?utf-8?b?5rOV6L2u5YqfIChjaXJvc2FudGlsbGkp?=
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152965079249.25456.13265375438612212422.malonedeb@soybean.canonical.com>
Message-Id: <161025225308.18863.6927305403087267159.malone@loganberry.canonical.com>
Subject: [Bug 1778182] Re: qemu-system-aarch64 shows black framebuffer window
 on minimal bare metal example on SDL but not on VNC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: c885400cc030a5c0d7662740b62ed9839b1f253e
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
Reply-To: Bug 1778182 <1778182@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1778182

Title:
  qemu-system-aarch64 shows black framebuffer window on minimal bare
  metal example on SDL but not on VNC

Status in QEMU:
  Expired

Bug description:
  QEMU v2.12.0, Ubuntu 18.04 host.

  Build QEMU and the bare metal image exactly as described at:
  https://raspberrypi.stackexchange.com/revisions/85135/4 with:

  Then cd into example 09_framebuffer.

  Now if I do:

  ../../qemu/aarch64-softmmu/qemu-system-aarch64 -M raspi3 -kernel
  kernel8.img -serial stdio

  the SDL window shows up black.

  However, if I use VNC:

  ../../qemu/aarch64-softmmu/qemu-system-aarch64 -M raspi3 -kernel kernel8.=
img -serial stdio -vnc :1
  vinagre :5901

  an image of Homer Simpson appears as expected.

  Therefore, I think this must be a QEMU / SDL bug instead of the
  repository, since we get different behaviors with `-vnc` and with SDL.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1778182/+subscriptions

