Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC1203667
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 14:07:12 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnLEF-0005FY-Al
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 08:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnLCp-0004K9-Dk
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:05:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:52714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnLCl-0005z9-I2
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:05:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jnLCj-0007gq-Cz
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 12:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 506CC2E8109
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 12:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2020 12:00:11 -0000
From: Francesco Turco <1884302@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fturco kraxel-redhat
X-Launchpad-Bug-Reporter: Francesco Turco (fturco)
X-Launchpad-Bug-Modifier: Francesco Turco (fturco)
References: <159259247450.25654.11249497243330169394.malonedeb@gac.canonical.com>
Message-Id: <159282721117.5653.421297417198178540.malone@soybean.canonical.com>
Subject: [Bug 1884302] Re: disable automatic mouse grabbing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d8f80f3a6d0e9f2a6dac93ca6b76bf51e06236a7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 08:05:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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

Thanks for the info, but I prefer to continue using the SDL interface, if p=
ossible.
Is there a plan to add the grab-on-hover=3Doff option to the SDL interface?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884302

Title:
  disable automatic mouse grabbing

Status in QEMU:
  New

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

