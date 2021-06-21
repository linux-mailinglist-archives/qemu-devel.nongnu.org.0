Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A846C3AE276
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:36:33 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBfk-0006rE-ON
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZI-00084k-Vj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:37992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBZG-0001bT-Ut
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:29:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBZF-0003ac-0F
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 00C932E8088
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:29:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:38 -0000
From: Launchpad Bug Tracker <1309034@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor masm-e th-huth
X-Launchpad-Bug-Reporter: Yuuki Harano (masm-e)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20140417141213.27030.31355.malonedeb@gac.canonical.com>
Message-Id: <162424905904.11837.642221222675973528.malone@loganberry.canonical.com>
Subject: [Bug 1309034] Re: A way not to grab keyboards or mice
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 5cf394d9013695368194b276ba3eff5c666bc9e1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1309034 <1309034@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1309034

Title:
  A way not to grab keyboards or mice

Status in QEMU:
  Expired

Bug description:
  I set up the window manager to move windows with Alt-Btn1, and to
  iconify windows with Shift-Btn1. But since qemu grabs keyboards and
  mice, I can't move or iconify the qemu window.

  I tried not to grab anything, by inserting return, just beginnig of
  ui/sdl.c:sdl_grab_start() as follows:

  static void sdl_grab_start(void)
  {
      return;
      /*

  It is comfortable. I'm glad if you make a way not to grab.
  Environment variables, options, etc are welcome.

  Current command line is:
  QEMU_AUDIO_DRV=3Dpa /usr/local/bin/qemu-system-x86_64 -enable-kvm -hda /d=
osc/win8_x64.img -soundhw hda -boot c -m 2G -cpu Nehalem,+sep -usb -usbdevi=
ce tablet -display sdl -rtc base=3Dlocaltime

  qemu version is:
  luna:linux % qemu-system-x86_64 --version
  QEMU emulator version 1.7.93, Copyright (c) 2003-2008 Fabrice Bellard
  luna:linux % =


  Host: slackware64 14.1
  Host Environment: xfce4 / sawfish
  Guest: Windows 8.1 x64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1309034/+subscriptions

