Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6981BF1EB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 09:57:44 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU44k-0005Fw-Ng
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 03:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU43R-0004Sk-Pw
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU43Q-0004wR-SB
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:56:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:53126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU43Q-0004rW-Cr
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:56:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU43P-0001Oa-Ac
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 07:56:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CD292E8060
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 07:56:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 07:50:00 -0000
From: chen <1869858@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chenyifei2008 th-huth
X-Launchpad-Bug-Reporter: chen (chenyifei2008)
X-Launchpad-Bug-Modifier: chen (chenyifei2008)
References: <158564614354.21602.16034266356442698815.malonedeb@gac.canonical.com>
Message-Id: <158823300014.5188.2480716508702370649.malone@chaenomeles.canonical.com>
Subject: [Bug 1869858] Re: qemu can't start Windows10arm64 19H1(with kvm)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 790505ea124390aaa3aad762da4b4b34f0c58941
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:56:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1869858 <1869858@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And I am try Windows 10 build 19613=EF=BC=8Cbut was cant not start=EF=BC=8C=
too(sorry=EF=BC=8CMy
english It's not well)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869858

Title:
  qemu can't start Windows10arm64 19H1(with kvm)

Status in QEMU:
  Incomplete

Bug description:
  My cpu's model is arm64(cortex-a53),I want start Win10arm64 with kvm,Beca=
use is fast than x86.But it's did'nt work.The screnn is card in Uefi's logo=
. But I am use ramfb now,So it has nothing to do with the graphics card.But=
 if I discard kvm,It can start now.But its so slowly.But I use the uefi and=
 kvm can start with Debian arm64 buster. So who's the problem?qemu or kvm o=
r Microsoft?But others use it to start successfully. I don't know what I wo=
uld like to do
  This is start command(Qemu version is 4.1')
  qemu-system-aarch64 -hda /win10.vhdx -cdrom /win10arm.iso -m 1G -accel kv=
m -smp 4 -cpu host -pflash efi.img -pflash var.img -device ramfb -device qe=
mu-xhci -device usb-kbd -device usb-mouse -device usb-tablet
  If I replace the above three parameters with "- CPU cortex-a53" and "- ac=
cel TCG" and "- device VGA", I can start normally. What's the matter?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869858/+subscriptions

