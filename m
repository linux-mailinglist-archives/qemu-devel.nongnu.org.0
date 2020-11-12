Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D770A2B0055
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:27:41 +0100 (CET)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd71A-0005lH-TQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6ud-0007gR-LD
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:54940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd6uZ-0006Jc-4H
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:20:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd6uX-0005dw-U7
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E19AC2E802A
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:20:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 07:12:59 -0000
From: Thomas Huth <1795799@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth uli-rgbg
X-Launchpad-Bug-Reporter: 1448412 (uli-rgbg)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153854876970.8093.8281977753870845379.malonedeb@soybean.canonical.com>
Message-Id: <160516518000.4526.4455054851664870605.malone@soybean.canonical.com>
Subject: [Bug 1795799] Re: Cirrus video, graphical corruption, bad fonts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: c977288fb876b5c333942b15869baaccbb7dfaf1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1795799 <1795799@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1795799

Title:
  Cirrus video, graphical corruption, bad fonts

Status in QEMU:
  Incomplete

Bug description:
  The error
  =3D=3D=3D

  I started qemu by

  `shell
  $ ./qemu-system-i386 -serial stdio -cdrom /dev/cdrom -vga cirrus
  S1111111111S1111111111S1111111111S1111111111=E2=96=92*n*n*n*n
  `

  with the original suse7.0 cd 1 in the cdrom drive (I think
  https://archive.org/details/suse-7.0_release_i386 has the image).
  After some console output (that uses a vga framebuffer which seems to
  work fine) the suse installer is started. It is displayed mostly
  correct, but several text passages are completely garbled.

  I noticed the same type of corruption when trying to run an old XF86
  SVGA Server on a SuSE 6.2 System using the `-vga cirrus` option.

  Therefore I think that the cirrus emulation might not work as intended
  any more.

  Qemu version
  =3D=3D=3D

  I used  qemu-w64-setup-20180815.exe provided by
  https://qemu.weilnetz.de/w64/

  ./qemu-system-i386 -version
  QEMU emulator version 3.0.0 (v3.0.0-11723-ge2ddcc5879-dirty)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  Hope you can fix it.

  Best regards!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1795799/+subscriptions

