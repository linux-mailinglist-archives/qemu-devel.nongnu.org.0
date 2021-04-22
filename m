Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD8367E36
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:59:15 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZW78-0000JZ-6g
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW3L-0006Ue-W6
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:55:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:51352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW3G-0008Hm-HM
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:55:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZW3F-00078n-HI
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:55:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 79F4B2E806D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:55:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:40:54 -0000
From: Peter Maydell <661696@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fpu windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: blauwirbel bonzini chalkerx morten+one-ubuntu-com
 pmaydell th-huth
X-Launchpad-Bug-Reporter: Chalkerx (chalkerx)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20101016120808.18780.42547.malonedeb@soybean.canonical.com>
Message-Id: <161908445432.22469.13849425031948147951.malone@gac.canonical.com>
Subject: [Bug 661696] Re: incomplete emulation of fstenv under TCG
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 01f9b422e34fb5522d46d1f463966e91a602f0d6
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
Reply-To: Bug 661696 <661696@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test case in comment #7 still fails -- still a bug.


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/661696

Title:
  incomplete emulation of fstenv under TCG

Status in QEMU:
  Confirmed

Bug description:
  Steps to reproduce:

  1) Install Windows (tried XP and 7) in qemu (tried qemu without kvm
  and qemu-kvm).

  2) Get OllyDbg ( http://ollydbg.de/odbg200.zip ).

  3) Use some Metasploit-encoded file, example included.

  It is not a virus!

  File was generated with Metasploit, command (if i remember it right):
  `msfpayload windows/exec cmd=3Dnotepad R | msfencode -e
  x86/shikata_ga_nai -t exe -o cmd_exec_notepad.shikata_ga_nai.exe`.

  4) Launch the file under Windows in qemu, make sure it opens a
  notepad.

  5) Open file under OllyDbg, run (F9) it there. It opens a notpad.
  Close OllyDbg.

  6) Open file under OllyDbg, trace over (Ctrl+F12) it there. It fails with=
 `Access violation when writing to [some address]`.
  Command: 316A 13, XOR DWORD PTR DS:[EDX+13],EBP =


  Under native Windows, the trace over command works fine.

  Under VMware the trace works fine.
  Under VirtualBox it also fails (checked in the spring).

  $ qemu-kvm --version
  QEMU PC emulator version 0.12.5 (qemu-kvm-0.12.5), Copyright (c) 2003-200=
8 Fabrice Bellard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/661696/+subscriptions

