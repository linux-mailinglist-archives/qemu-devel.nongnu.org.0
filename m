Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CBB2B4237
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:07:24 +0100 (CET)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecM0-0000lO-2r
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kecL5-0000Hc-6l
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:06:27 -0500
Received: from indium.canonical.com ([91.189.90.7]:39014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kecL2-0000M1-NJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:06:26 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kecKx-0003lb-8H
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:06:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 34BF52E8132
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:06:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 10:58:19 -0000
From: Roman Bolshakov <1759333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fbn7331 roolebo th-huth
X-Launchpad-Bug-Reporter: Fa Bi (fbn7331)
X-Launchpad-Bug-Modifier: Roman Bolshakov (roolebo)
References: <152217002978.21179.18362367542097684091.malonedeb@wampee.canonical.com>
Message-Id: <160552429932.20240.11862361120061267411.malone@soybean.canonical.com>
Subject: [Bug 1759333] Re: Illegal Instruction with HVF when encountering SSE
 instructions in the emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 0a7d30be2b61ed07c5e68ac9137fd7486e7b1546
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:16:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1759333 <1759333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas, I think the issue is there. SSE/MMX weren't yet added for HVF.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759333

Title:
  Illegal Instruction with HVF when encountering SSE instructions in the
  emulator

Status in QEMU:
  Incomplete

Bug description:
  The latest version of QEMU doesn't seem to support emulated SSE instructi=
ons with HVF acceleration on macOS.
  The decoder will treat SSE instructions as invalid, get the instruction s=
izes wrong and quickly crash the guest OS because of illegal instructions.
  After having a quick look at target/i386/hvf/x86_decode.c, it seems that =
SSE instruction emulation isn't implemented in the current version of the x=
86 emulator.

  A way to reproduce the issue is to run a macOS 10.13 guest with HVF
  acceleration enabled, this will crash in the guest once it's loading
  up the GUI (and also print a "Unimplemented handler" warning from
  target/i386/hvf/x86_emu.c).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759333/+subscriptions

