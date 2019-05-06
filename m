Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D349A150E1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 18:07:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNg8t-0003k8-AJ
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 12:07:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNg2r-0008BG-Un
	for qemu-devel@nongnu.org; Mon, 06 May 2019 12:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNg2q-0006h5-PP
	for qemu-devel@nongnu.org; Mon, 06 May 2019 12:00:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:38628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hNg2q-0006gU-KF
	for qemu-devel@nongnu.org; Mon, 06 May 2019 12:00:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hNg2p-00028I-Ae
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 16:00:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 4B4EA2E8041
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 16:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 May 2019 15:50:46 -0000
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: axelheider kbastian
X-Launchpad-Bug-Reporter: Floyd42 (axelheider)
X-Launchpad-Bug-Modifier: Bastian Koppelmann (kbastian)
References: <155629222212.6615.9281610848583512798.malonedeb@chaenomeles.canonical.com>
Message-Id: <155715784650.20157.16672269130496430811.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18953";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 85b4d74750c6c0bc40827ad00f67f9c890365e46
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1826568] Re: RISC-V Disassembler/translator
 instruction decoding disagreement
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1826568 <1826568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Axel,

can you link us to your test code, such that we can try to reproduce it.

Cheers,
Bastian

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826568

Title:
  RISC-V Disassembler/translator instruction decoding disagreement

Status in QEMU:
  New

Bug description:
  =

  When running QEMU V3.1.0 for platform  RISC-V, 64bit, Spike V1.10 with "-=
d in_asm -singlestep -D qemu_log.txt", my (faulty) test code brought up thi=
s message in the logs:

    0x000000008002cade:  051300009517e2bf  illegal         =

    Disassembler disagrees with translator over instruction decoding
    Please report this to qemu-devel@nongnu.org

  =

  You may want to resolve the disagreement.

  Axel

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826568/+subscriptions

