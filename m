Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA0367B11
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:29:26 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTm9-0004Wv-ED
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTim-0000J5-7V
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTij-000136-NY
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTii-0005JM-IM
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 897D02E806D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:16:35 -0000
From: Thomas Huth <1838390@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felipe-1 jimmyj jwillikers smartrejames th-huth
X-Launchpad-Bug-Reporter: James Smart (smartrejames)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156448241864.18390.18158373201974266058.malonedeb@gac.canonical.com>
Message-Id: <161907579512.10272.11155671478109108074.malone@wampee.canonical.com>
Subject: [Bug 1838390] Re: vmx_write_mem: mmu_gva_to_gpa failed when using hvf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 54b1133e6a481aaa82f12aa5555581504d1ba622
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
Reply-To: Bug 1838390 <1838390@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838390

Title:
  vmx_write_mem: mmu_gva_to_gpa failed when using hvf

Status in QEMU:
  Incomplete

Bug description:
  Installed qemu 4.0.0 by homebrew, used below commands:

  1. qemu-img create -f raw arch-vm.img 100G
  2. qemu-system-x86_64 -show-cursor -only-migratable -nodefaults -boot ord=
er=3Dd -cdrom archlinux-2019.07.01-x86_64.iso -cpu host -device virtio-keyb=
oard -device virtio-mouse -device virtio-tablet -drive file=3Darch-vm.img,f=
ormat=3Draw,if=3Dvirtio -m 4096 -machine q35,accel=3Dhvf,vmport=3Doff -nic =
user,ipv6=3Doff,model=3Dvirtio -smp 4,sockets=3D1,cores=3D2,threads=3D2 -so=
undhw hda -vga virtio

  Displayed bootloader menu successfully, select "Boot Arch Linux" then
  crashed with message: vmx_write_mem: mmu_gva_to_gpa ffff91953b540000
  failed.

  Use tcg accelerator has no problem but very slow.

  See attachment for full crash report.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838390/+subscriptions

