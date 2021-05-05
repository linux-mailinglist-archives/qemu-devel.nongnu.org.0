Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680437364A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:31:09 +0200 (CEST)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCw0-0004kL-LO
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrF-00086o-BR
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:40340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrB-0006Er-HB
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leCrA-00042i-4B
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E1E92E813A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 08:26:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:19:25 -0000
From: Thomas Huth <1759333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fbn7331 roolebo th-huth
X-Launchpad-Bug-Reporter: Fa Bi (fbn7331)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152217002978.21179.18362367542097684091.malonedeb@wampee.canonical.com>
Message-Id: <162020276556.14396.15455586660274639203.malone@soybean.canonical.com>
Subject: [Bug 1759333] Re: Illegal Instruction with HVF when encountering SSE
 instructions in the emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: cc4db097e7786d7cd1011fd179a71122e4fb16ea
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1759333 <1759333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/150


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #150
   https://gitlab.com/qemu-project/qemu/-/issues/150

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759333

Title:
  Illegal Instruction with HVF when encountering SSE instructions in the
  emulator

Status in QEMU:
  Expired

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

