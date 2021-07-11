Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340C3C3B74
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:07:11 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2WMg-00080h-4O
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2WLK-0007Hz-J7
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:05:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:54024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2WLI-0006sD-8n
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:05:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2WLE-0003ks-Na
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:05:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A57982E8058
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:05:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Jul 2021 09:59:34 -0000
From: Thomas Huth <1873769@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aperamak janitor markostamcar th-huth vvaltchev
X-Launchpad-Bug-Reporter: =?utf-8?q?Marko_=C5=A0tamcar_=28markostamcar=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158737489336.27883.11672421823937229418.malonedeb@gac.canonical.com>
Message-Id: <162599757429.17687.15080547801442727507.malone@gac.canonical.com>
Subject: [Bug 1873769] Re: SB16 audio playback freezes emulation in Windows 95
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: bec70b042f3c281526a398fbe8e2da9da53ca938
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
Reply-To: Bug 1873769 <1873769@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/469


** Tags added: audio

** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #469
   https://gitlab.com/qemu-project/qemu/-/issues/469

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873769

Title:
  SB16 audio playback freezes emulation in Windows 95 guest

Status in QEMU:
  Expired

Bug description:
  - QEMU 4.2.93 (v5.0.0-rc3) built from latest git master
  20038cd7a8412feeb49c01f6ede89e36c8995472 using MSYS2 on Windows 10 and
  launched on same Windows 10

  - Launched using "qemu-system-i386.exe -drive format=3Draw,file=3Dhdd-
  2gb.img -soundhw pcspk,sb16 -m 16 -cpu pentium -vga std -cdrom
  Windows_95.iso -boot c"

  - I have attached video screen capture of the issue

  ---

  I decided to make my first ever QEMU build after encountering the
  dsound issues using the latest 4.2.0 binary from
  https://qemu.weilnetz.de/w64/. In my 5.0.0-rc3 build the sound
  playback is working correctly, however the whole Windows 95 UI freezes
  while sound is playing.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873769/+subscriptions

