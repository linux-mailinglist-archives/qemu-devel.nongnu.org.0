Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03337085A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:08:19 +0200 (CEST)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcu2M-0008Qq-E2
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzq-0006gc-W1
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:43124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lctzo-0004r1-CE
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:05:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lctzn-0004cZ-0r
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 18:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 02D922E815C
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 18:05:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 17:57:35 -0000
From: Thomas Huth <1884302@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fturco kraxel-redhat th-huth
X-Launchpad-Bug-Reporter: Francesco Turco (fturco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159259247450.25654.11249497243330169394.malonedeb@gac.canonical.com>
Message-Id: <161989185579.4988.3277806308291996589.malone@chaenomeles.canonical.com>
Subject: [Bug 1884302] Re: disable automatic mouse grabbing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 5e289541e33a8bd0fd76ff1483f64a8d77f2ff81
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
Reply-To: Bug 1884302 <1884302@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/75


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #75
   https://gitlab.com/qemu-project/qemu/-/issues/75

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884302

Title:
  disable automatic mouse grabbing

Status in QEMU:
  Expired

Bug description:
  I'm using QEMU 5.0.0 on a Gentoo Linux host system. Guest is an Arch
  Linux system.

  I'd like to disable automatic mouse grabbing when the QEMU window is focu=
sed.
  I would prefer for QEMU to grab the mouse only after a click.

  I use the i3 window manager on my host system.
  Suppose I'm in workspace 1, while the QEMU window is in workspace 2.
  In order to switch to workspace 2, I need to press the "Win+2" key combin=
ation ("Win" is the Windows key).
  The problem is that the character "2" (from "Win+2") will get transferred=
 to the guest system.
  For example, if I have a text editor opened under the guest system, the c=
haracter "2" will be pasted inside the document I'm working on, which is pr=
etty annoying.

  I would like instead to press the "Win+2" key combination and then
  explicitely click on the QEMU window with the mouse before grabbing
  it.

  Command line:

  qemu-system-x86_64 -drive
  file=3D/home/fturco/qemu/arch.img,media=3Ddisk,index=3D0,if=3Dvirtio,form=
at=3Draw,cache=3Dnone
  -cpu host -m 2G -k it -enable-kvm -net nic,model=3Dvirtio -net user -vga
  virtio -display sdl -usb -rtc base=3Dutc -soundhw ac97 -monitor stdio
  -no-quit

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884302/+subscriptions

