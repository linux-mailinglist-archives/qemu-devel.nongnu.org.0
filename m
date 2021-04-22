Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E46367A7E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:03:29 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTN2-0007CA-BL
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTKd-0005a1-4m
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:00:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:33604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTKb-00038T-91
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:00:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTKa-0002ZX-7M
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:00:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 361562E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:00:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 06:54:07 -0000
From: Thomas Huth <1834051@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: roblabla th-huth
X-Launchpad-Bug-Reporter: roblabla (roblabla)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156138866047.31005.4592891012762616724.malonedeb@chaenomeles.canonical.com>
Message-Id: <161907444744.32169.3558228021986067521.malone@soybean.canonical.com>
Subject: [Bug 1834051] Re: IRQ2 ignored under KVM when using IOAPIC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1f3660dab0ae12536293051269f3e9c3813dc5fd
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
Reply-To: Bug 1834051 <1834051@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1834051

Title:
  IRQ2 ignored under KVM when using IOAPIC

Status in QEMU:
  Incomplete

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

