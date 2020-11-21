Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F62BC28D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:02:11 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgbtS-00067r-O5
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgbs9-0005fg-Bh
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:00:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:54490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgbs7-00075u-Jt
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:00:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgbs5-0006ab-B9
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F5072E813A
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 22:51:07 -0000
From: Peter Maydell <1820686@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fintelia palmerdabbelt pmaydell
X-Launchpad-Bug-Reporter: Jonathan Behrens (fintelia)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <155292983840.14647.1929214506952702572.malonedeb@soybean.canonical.com>
Message-Id: <160599906758.12179.5421459848098758677.malone@soybean.canonical.com>
Subject: [Bug 1820686] Re: risc-v: 'c.unimp' instruction decoded as
 'c.addi4spn fp, 0'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 4331e86d1ddcdff051ea8e8ac15845e0626ba52d
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
Reply-To: Bug 1820686 <1820686@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this bug isn't present in the decodetree version of the riscv
decoder, we might as well just close this as fix-released; we won't be
doing more point-releases of QEMU versions as old as 3.1.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1820686

Title:
  risc-v: 'c.unimp' instruction decoded as 'c.addi4spn fp, 0'

Status in QEMU:
  Fix Released

Bug description:
  QEMU 3.1 incorrectly decodes the "c.unimp" instruction (opcode 0x0000)
  as an "addi4spn fp, 0" when either of the two following bytes are non-
  zero. This is because the ctx->opcode value used when decoding the
  instruction is actually filled with a 32-bit load (to handle normal
  uncompressed instructions) but when a compressed instruction is found
  only the low 16 bits are valid. Other reserved/illegal bit patterns
  with the addi4spn opcode are also incorrectly decoded.

  I believe that the switch to decodetree on master happened to fix this
  issue, but hopefully it is helpful to have this recorded somewhere.
  I've included a simple one line patch if anyone wants to backport
  this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1820686/+subscriptions

