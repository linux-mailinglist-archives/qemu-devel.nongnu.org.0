Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F93AFC47
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:57:07 +0200 (CEST)
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYTC-0004x5-4S
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzr-0007xU-7I
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:57254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzm-0005GG-EH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzZ-00016M-IJ
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C045E2E81AF
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:13 -0000
From: Launchpad Bug Tracker <1834051@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor roblabla th-huth
X-Launchpad-Bug-Reporter: roblabla (roblabla)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156138866047.31005.4592891012762616724.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433549415.20423.14625261559214386516.malone@loganberry.canonical.com>
Subject: [Bug 1834051] Re: IRQ2 ignored under KVM when using IOAPIC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 5b83e770326d8375dcf69b52c3fb8b3c80a97581
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
Reply-To: Bug 1834051 <1834051@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1834051

Title:
  IRQ2 ignored under KVM when using IOAPIC

Status in QEMU:
  Expired

Bug description:
  When using KVM, and an OS that supports the IOAPIC, interrupts mapped
  on IRQ2 (for instance, routing an HPET timer on interrupt 2) will
  cause the interrupts to never be delivered. This is because QEmu, when
  setting up the KVM interrupt routes, will not set one up for IRQ2[0].
  When running without KVM, IRQ2 is identity-mapped to GSI2.

  My understanding is that IRQs should be identity mapped to their
  equivalent GSI unless a redirection entry is present in the MADT. This
  is supported by ACPI 6.2 spec[1], 5.2.12.5 Interrupt Source Override
  Structure, which claims: "It is assumed that the ISA interrupts will
  be identity-mapped into the first I/O APIC sources.".

  I stumbled across this while working on my own custom OS, got very
  confused why the HPET wasn't triggering any interruption - and even
  more confused why the behavior only happened in KVM and not in non-
  KVM.

  EDIT: Interestingly, the HPET only supports IRQ2 when using the
  default PIIX chipset, which, combined with this bug, makes it
  completely unusable.

  [0]:
  https://github.com/qemu/qemu/blob/37560c259d7a0d6aceb96e9d6903ee002f4e5e0=
c/hw/i386/kvm/ioapic.c#L40

  [1]: https://uefi.org/sites/default/files/resources/ACPI_6_2.pdf

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1834051/+subscriptions

