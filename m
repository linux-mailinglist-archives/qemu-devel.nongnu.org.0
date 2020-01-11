Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23713825E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 17:26:10 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqJaS-0005dI-QA
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 11:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iqJ6w-0004vr-Dc
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iqJ6u-0002ag-Q5
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:55:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:44522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iqJ6u-0002U2-JX
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:55:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iqJ6t-0003SE-2d
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 15:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0EC9C2E8075
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 15:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jan 2020 15:45:59 -0000
From: Teodori Serge <teodori.serge@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: risc-v
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: teodori-serge
X-Launchpad-Bug-Reporter: Teodori Serge (teodori-serge)
X-Launchpad-Bug-Modifier: Teodori Serge (teodori-serge)
Message-Id: <157875755996.2711.225801499083245592.malonedeb@soybean.canonical.com>
Subject: [Bug 1859291] [NEW] RISC-V incorrect exception generated
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 328626a7451669870bb9e5c87020b5bec2888d34
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Sat, 11 Jan 2020 11:25:14 -0500
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

Public bug reported:

When using 'ecall' from supervisor mode, user exception is raised
instead of supervisor exception. The problem is located under
'target/riscv/insn_trans/trans_priviledged.inc.c' in function 'static
bool trans_ecall(DisasContext *ctx, arg_ecall *a)'. Best regards, Serge
Teodori

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: risc-v

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

