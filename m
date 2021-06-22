Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189373AFBF0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:29:27 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY2Q-0005tD-2c
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzU-0006ZL-8e
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:55948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzS-0004vl-8z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzE-00014v-M0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F8982E81E3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:38 -0000
From: Launchpad Bug Tracker <1850378@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor palmerdabbelt th-huth tm42
X-Launchpad-Bug-Reporter: tm (tm42)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157235518365.28116.9958641157871998206.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433551901.20423.11256606073448271554.malone@loganberry.canonical.com>
Subject: [Bug 1850378] Re: RISC-V unreliable IPIs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: b3ff6076a5748ed786ed5c41a221eb276f179638
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
Reply-To: Bug 1850378 <1850378@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1850378

Title:
  RISC-V unreliable IPIs

Status in QEMU:
  Expired

Bug description:
  I am working on a project with custom inter processor interrupts (IPIs) o=
n the RISC-V virt machine.
  After upgrading from version 3.1.0 to 4.1.0 which fixes a related issue (=
https://github.com/riscv/riscv-qemu/issues/132) I am able to use the CPU ho=
tplug feature.

  However, if I try to use IPIs for communication between two cores, the
  wfi instruction behaves strangely. Either it does not return, or it
  returns on timer interrupts, even though they are disabled. The code,
  I use on one core to wait for an interrupt is the following.

  =C2=A0csr_clear(sie, SIE_SEIE | SIE_STIE);
  =C2=A0do {
  =C2=A0=C2=A0wait_for_interrupt();
  =C2=A0=C2=A0sipval =3D csr_read(sip);
  =C2=A0=C2=A0sieval =3D csr_read(sie);
  =C2=A0=C2=A0scauseval =3D csr_read(scause) & 0xFF;
  =C2=A0/* only break if wfi returns for an software interrupt */
  =C2=A0} while ((sipval & sieval) =3D=3D 0 && scauseval !=3D 1);
  =C2=A0csr_set(sie, SIE_SEIE | SIE_STIE);

  Since the resulting sequence does not seem to be deterministic, my
  guess is, that it has something to do with the communication of qemu's
  threads for the different cores.

  Update:
  The exact same setup works fine in spike (the actual sim, not the qemu bo=
ard), which might give a hint, that it is related to the interrupt controll=
er implementation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1850378/+subscriptions

