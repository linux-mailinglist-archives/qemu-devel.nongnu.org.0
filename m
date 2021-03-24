Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436D347E4E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:56:47 +0100 (CET)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6oH-0001Fu-PY
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP6nM-0000mG-3x
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:55:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP6nE-0000Sj-0j
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:55:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lP6nA-000052-IT
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 16:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8A8412E8163
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 16:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 16:50:01 -0000
From: Richard Henderson <1921138@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qubasa rth
X-Launchpad-Bug-Reporter: Luis (qubasa)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <161659961768.20702.9928871804946559153.malonedeb@wampee.canonical.com>
Message-Id: <161660460175.28421.6101003248928254720.malone@gac.canonical.com>
Subject: [Bug 1921138] Re: tcg.c:3329: tcg fatal error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 83e45a7a7da20ae1d2e334e3a440f0737fca939e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_OTHER_BAD_TLD=1.999,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1921138 <1921138@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://patchew.org/QEMU/20210324164650.128608-1-richard.henderson@linaro.o=
rg/

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921138

Title:
  tcg.c:3329: tcg fatal error

Status in QEMU:
  In Progress

Bug description:
  I am currently building my own kernel with bootloader and qemu crashed
  after I have set an IDT in protected mode and then create a invalid
  opcode exception with the opcode 0xff.

  My code is here: https://github.com/Luis-
  Hebendanz/svm_kernel/blob/qemu_crash/svm_kernel/external/bootloader/src/m=
ain.rs#L80

  Build instructions are here: https://github.com/Luis-
  Hebendanz/svm_kernel/tree/qemu_crash

  A precompiled binary is here: https://cloud.gchq.icu/s/LcjoDWRW2CbxJ5i

  I executed the following command: qemu-system-x86_64 -smp cores=3D4
  -cdrom target/x86_64-os/debug/bootimage-svm_kernel.iso -serial stdio
  -display none -m 4G

  I am running QEMU emulator version 5.1.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921138/+subscriptions

