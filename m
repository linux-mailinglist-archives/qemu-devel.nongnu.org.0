Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F7367872
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:20:17 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQp6-0005Ba-6D
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQjv-000846-65
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:14:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQjs-00049D-6K
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:14:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQjr-0005sA-3E
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:14:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B3D52E8160
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:14:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:00:52 -0000
From: Thomas Huth <1309034@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: masm-e th-huth
X-Launchpad-Bug-Reporter: Yuuki Harano (masm-e)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140417141213.27030.31355.malonedeb@gac.canonical.com>
Message-Id: <161906405253.9724.1005284518612671091.malone@wampee.canonical.com>
Subject: [Bug 1309034] Re: A way not to grab keyboards or mice
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 996baabb99fc56cbd0c5bec108c5d9c9c9fc34f0
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
Reply-To: Bug 1309034 <1309034@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1309034

Title:
  A way not to grab keyboards or mice

Status in QEMU:
  Incomplete

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

