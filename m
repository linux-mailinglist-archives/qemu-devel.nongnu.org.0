Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE552367DD5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:37:28 +0200 (CEST)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVm3-0003X7-Ty
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVkW-0002Xk-CI
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:35:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:46446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVkI-0004jf-TK
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:35:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVkH-00041p-R3
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:35:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA7932E815A
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:35:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:22:35 -0000
From: Thomas Huth <661696@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fpu windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: blauwirbel bonzini chalkerx morten+one-ubuntu-com
 th-huth
X-Launchpad-Bug-Reporter: Chalkerx (chalkerx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20101016120808.18780.42547.malonedeb@soybean.canonical.com>
Message-Id: <161908335570.10175.3129949560715902143.malone@wampee.canonical.com>
Subject: [Bug 661696] Re: incomplete emulation of fstenv under TCG
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 5e649d0ee2d190da912d7411ff33c23f907affd1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/661696

Title:
  incomplete emulation of fstenv under TCG

Status in QEMU:
  Incomplete

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

