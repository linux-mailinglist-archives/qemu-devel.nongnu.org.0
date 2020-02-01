Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B214F5C2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 02:41:53 +0100 (CET)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixhnE-00051v-2K
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 20:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ixhmQ-0004dG-I2
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ixhmP-0004jl-FZ
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:41:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:59554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ixhmP-0004fu-9C
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:41:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ixhmN-0007R1-MR
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 01:40:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A8CE82E80C0
 for <qemu-devel@nongnu.org>; Sat,  1 Feb 2020 01:40:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Feb 2020 01:31:59 -0000
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: risc-v
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 teodori-serge
X-Launchpad-Bug-Reporter: Teodori Serge (teodori-serge)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <157875755996.2711.225801499083245592.malonedeb@soybean.canonical.com>
Message-Id: <158052071983.19479.13367315334382830650.malone@gac.canonical.com>
Subject: [Bug 1859291] Re: RISC-V incorrect exception generated
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7251435907deddd32a9aded0e0496961baa50b19
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
Reply-To: Bug 1859291 <1859291@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do you have steps to reproduce this?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859291

Title:
  RISC-V incorrect exception generated

Status in QEMU:
  New

Bug description:
  When using 'ecall' from supervisor mode, user exception is raised
  instead of supervisor exception. The problem is located under
  'target/riscv/insn_trans/trans_priviledged.inc.c' in function 'static
  bool trans_ecall(DisasContext *ctx, arg_ecall *a)'. Best regards,
  Serge Teodori

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859291/+subscriptions

