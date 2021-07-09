Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2C3C1E76
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:34:02 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iDB-0000L1-KN
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5e-00068W-5Y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:60918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5a-0001G5-Ai
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5K-0005Dh-GX
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 42E552E81BE
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1898954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 0qivronovrpmqmcl janitor th-huth
X-Launchpad-Bug-Reporter: pat leese (0qivronovrpmqmcl)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160211647401.12043.14789296539766807523.malonedeb@gac.canonical.com>
Message-Id: <162580424305.19936.11467059373325406672.malone@loganberry.canonical.com>
Subject: [Bug 1898954] Re: x86 f1 opcode hangs qemu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 587b084ebc9de091bf3addb553c43a66a27194e1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898954

Title:
  x86 f1 opcode hangs qemu

Status in QEMU:
  Expired

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

