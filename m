Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEC1A3982
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 20:02:41 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMbVg-00053B-7H
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 14:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jMbUE-00042D-Sr
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:01:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jMbUD-0000y0-OW
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:01:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:55760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jMbUD-0000xF-Iz
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:01:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jMbUB-000283-UY
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 18:01:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E52712E8104
 for <qemu-devel@nongnu.org>; Thu,  9 Apr 2020 18:01:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2020 17:53:36 -0000
From: Emin Ghuliev <1821595@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h ajbennee eminus
X-Launchpad-Bug-Reporter: Emin Ghuliev (eminus)
X-Launchpad-Bug-Modifier: Emin Ghuliev (eminus)
References: <155352235092.32006.12315829232895734213.malonedeb@soybean.canonical.com>
Message-Id: <158645481696.5694.17646887544357440561.malone@chaenomeles.canonical.com>
Subject: [Bug 1821595] Re: Failed to emulate MMIO access with
 EmulatorReturnStatus: 2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c4de5dab8082e433e09811883c391152fab8bfe8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1821595 <1821595@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think WHPX can't some MMIO requests for EFI.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821595

Title:
  Failed to emulate MMIO access with EmulatorReturnStatus: 2

Status in QEMU:
  New

Bug description:
  I have compiled qemu with enable-whpx parameter for Hyper-V Platform API =
in Mingw64 . When I tried run with Windows 7 iso file I have faced issue wi=
th the following problem: =

  qemu-system-x86_64.exe: WHPX: Failed to emulate MMIO access with Emulator=
ReturnStatus: 2
  qemu-system-x86_64.exe: WHPX: Failed to exec a virtual processor

  =

  configuration directives:

  ../configure --target-list=3Dx86_64-softmmu,i386-softmmu --enable-lzo\
   --enable-bzip2 --enable-tools --enable-sdl --enable-gtk --enable-hax\
   --enable-vdi --enable-qcow1 --enable-whpx --disable-capstone\
   --disable-werror --disable-stack-protector --prefix=3D"../../QEMU-bin"

  =

  Qemu command line:
  qemu-system-x86_64.exe -m 1024 -cdrom "C:\Users\vmcs\Documents\en_windows=
_7_home_premium_with_sp1_x86_dvd_u_676701.iso" -display sdl -machine q35 -a=
ccel whpx

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821595/+subscriptions

