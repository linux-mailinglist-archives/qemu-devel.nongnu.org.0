Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D13AFC10
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:37:24 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYA7-0006a3-8v
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzg-0007GH-HO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:56746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXze-00056g-OC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzR-00014H-4H
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A692E2E81BC
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:26 -0000
From: Launchpad Bug Tracker <1838390@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felipe-1 janitor jimmyj jwillikers smartrejames
 th-huth
X-Launchpad-Bug-Reporter: James Smart (smartrejames)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156448241864.18390.18158373201974266058.malonedeb@gac.canonical.com>
Message-Id: <162433550695.20423.4973855455382452430.malone@loganberry.canonical.com>
Subject: [Bug 1838390] Re: vmx_write_mem: mmu_gva_to_gpa failed when using hvf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: f13402567ad35a9f08b9cacfc0c71174ccc8b762
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
Reply-To: Bug 1838390 <1838390@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838390

Title:
  vmx_write_mem: mmu_gva_to_gpa failed when using hvf

Status in QEMU:
  Expired

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

