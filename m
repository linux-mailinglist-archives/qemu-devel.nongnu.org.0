Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4F2ADAC0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:47:07 +0100 (CET)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVrO-0008EZ-9h
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVq4-0007eu-AJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:45:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:49304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcVq2-0006Ds-6H
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:45:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcVq0-0002bO-Cb
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CE292E8072
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 15:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 15:39:14 -0000
From: Peter Maydell <1778182@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cirosantilli pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2lybyBTYW50aWxsaSDlha3lm5vkuovku7Yg?=
 =?utf-8?b?5rOV6L2u5YqfIChjaXJvc2FudGlsbGkp?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <152965079249.25456.13265375438612212422.malonedeb@soybean.canonical.com>
Message-Id: <160502275425.27879.8563497181211325767.malone@chaenomeles.canonical.com>
Subject: [Bug 1778182] Re: qemu-system-aarch64 shows black framebuffer window
 on minimal bare metal example on SDL but not on VNC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: cee01ae3884a36d58dbef0b942143665ae768db9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
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
Reply-To: Bug 1778182 <1778182@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I'm moving this bug to 'incomplete', because I was never able to
repro it -- gtk and sdl displays both worked for me.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1778182

Title:
  qemu-system-aarch64 shows black framebuffer window on minimal bare
  metal example on SDL but not on VNC

Status in QEMU:
  Incomplete

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

