Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F260286C15
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 02:31:46 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQJqT-0002Zo-22
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 20:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQJpc-00027A-Ja
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 20:30:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:54238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kQJpa-0006Ts-Dl
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 20:30:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kQJpX-0003jE-Vt
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 00:30:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F04B72E80DE
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 00:30:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2020 00:21:13 -0000
From: pat leese <1898954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 0qivronovrpmqmcl
X-Launchpad-Bug-Reporter: pat leese (0qivronovrpmqmcl)
X-Launchpad-Bug-Modifier: pat leese (0qivronovrpmqmcl)
Message-Id: <160211647401.12043.14789296539766807523.malonedeb@gac.canonical.com>
Subject: [Bug 1898954] [NEW] x86 f1 opcode hangs qemu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d50d1e75c500726862802414f880ee3e3bb759bf"; Instance="production"
X-Launchpad-Hash: 67306497d075db64d6f4e1b2b08a6761951fcd39
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 20:30:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1898954 <1898954@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I have qemu installed and running in linux and windows
in linux i execute the following simple code in real mode of cpu in my vm
90 nop
90 nop
90 nop
f1         ;this should conjure up my interrupt handler from ivt int 1
--------- end of code ----
it works properly in vbox,qemu linux,and even in my boot loder
on a real platform
   it doeas not work fine in windows 10 (32 bit efi) based qemu
---
all of the below was retyped there may be typo
so onwards to the flawed software =

********** for qemu-system-x86_64.exe **********
info version =

4.2.0v4.2.0.11797-g2890edc853-dirty
********** for qemu-system-i386.exe **********
info version =

4.2.0v4.2.0.11797-g2890edc853-dirty
***********************************************
my startup code is
"d:\programs\qemu\qemu-system-x86_64.exe" -m 16M -boot a -fda "d:\floppy.im=
g" -cpu Nehalem -machine pc
---
also same flaw if i change above section to
"d:\programs\qemu\qemu-system-i386.exe"

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898954

Title:
  x86 f1 opcode hangs qemu

Status in QEMU:
  New

Bug description:
  I have qemu installed and running in linux and windows
  in linux i execute the following simple code in real mode of cpu in my vm
  90 nop
  90 nop
  90 nop
  f1         ;this should conjure up my interrupt handler from ivt int 1
  --------- end of code ----
  it works properly in vbox,qemu linux,and even in my boot loder
  on a real platform
     it doeas not work fine in windows 10 (32 bit efi) based qemu
  ---
  all of the below was retyped there may be typo
  so onwards to the flawed software =

  ********** for qemu-system-x86_64.exe **********
  info version =

  4.2.0v4.2.0.11797-g2890edc853-dirty
  ********** for qemu-system-i386.exe **********
  info version =

  4.2.0v4.2.0.11797-g2890edc853-dirty
  ***********************************************
  my startup code is
  "d:\programs\qemu\qemu-system-x86_64.exe" -m 16M -boot a -fda "d:\floppy.=
img" -cpu Nehalem -machine pc
  ---
  also same flaw if i change above section to
  "d:\programs\qemu\qemu-system-i386.exe"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898954/+subscriptions

