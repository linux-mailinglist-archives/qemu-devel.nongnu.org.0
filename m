Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D65370859
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:08:17 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcu2L-0008O7-2K
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzq-0006gH-Cj
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:43062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzn-0004qb-A8
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lctzm-0004g1-4W
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 18:05:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E0592E815C
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 18:05:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 17:58:57 -0000
From: Thomas Huth <1888663@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mouse msmouse serial
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gattilorenz th-huth
X-Launchpad-Bug-Reporter: Lorenzo Gatti (gattilorenz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159550865727.2767.17464111511631671280.malonedeb@gac.canonical.com>
Message-Id: <161989193760.12015.1390160688987065790.malone@soybean.canonical.com>
Subject: [Bug 1888663] Re: msmouse not recognized in guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6447fe043a8e9299d274af5485e564ee10b22e05
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
Reply-To: Bug 1888663 <1888663@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/77


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #77
   https://gitlab.com/qemu-project/qemu/-/issues/77

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888663

Title:
  msmouse not recognized in guest

Status in QEMU:
  Expired

Bug description:
  The msmouse option for emulating a serial mouse does not seem to work
  in a DOS guest.

  I'm on Windows 10 X64, I have tried launching qemu (commit d0cc248164961a=
7ba9d43806feffd76f9f6d7f41 but also way older) with:
  ./qemu-system-i386 -serial msmouse -fda mousetest.img
  ./qemu-system-i386 -chardev msmouse,id=3Dmsmouse -device isa-serial,chard=
ev=3Dmsmouse -fda mousetest.img
  ./qemu-system-i386 -chardev msmouse,id=3Dmsmouse -device pci-serial,chard=
ev=3Dmsmouse -chardev msmouse,id=3Dmsmouse -fda mousetest.img

  Then I boot FreeDOS (but regular DOS shows same behavior), start the Cute=
Mouse driver and force the scan of a serial mouse with CTM /S.
  The mouse is never found. With other drivers (in the attachment), the mou=
se is probably not found but the driver is installed anyway, but it does no=
t work (there's a MOUSETST in the same floppy; it works iwth CTM and PS/2 m=
ouse emulation).

  Using a serial port sniffer inside the guest, it would seem that data
  is indeed transmitted. Setting a few printf in msmouse.c also confirms
  that the mouse gets initilized and starts transmitting data. However,
  it does not work...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888663/+subscriptions

