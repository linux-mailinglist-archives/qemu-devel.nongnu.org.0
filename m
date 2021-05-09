Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1413776FD
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:33:50 +0200 (CEST)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkVB-0007l1-8Z
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkSA-0002Wb-6L
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:30:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:52994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkS8-0004SJ-GB
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:30:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkS7-0005F8-7K
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:30:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2FFC12E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:24:32 -0000
From: Thomas Huth <1902267@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: candyman30 th-huth
X-Launchpad-Bug-Reporter: CandyMan (candyman30)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160407399412.14863.7198304237559619710.malonedeb@wampee.canonical.com>
Message-Id: <162057027284.10300.7839487939381143519.malone@chaenomeles.canonical.com>
Subject: [Bug 1902267] Re: CPU not support 32-bit stack in 32-bit unreal mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 1193ea009284dbee5efb991fff77ea44b6951fdb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1902267 <1902267@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902267

Title:
  CPU not support 32-bit stack in 32-bit unreal mode

Status in QEMU:
  Incomplete

Bug description:
  QEMU version 5.0.0 supports 32-bit and 16-bit unreal mode. Great!
  Unfortunately, QEMU does not support 32-bit stack in unreal 32-bit mode.
  After the INT instruction, the stack is switched to 16-bit, which should =
not be the case. =

  At BOCHS, my code works 100%. At QEMU not works.

  Sample code to find out:

  use32
  cli
  mov ax,cs
  shl eax,16
  mov ax,NewInt80h
  mov [IDT32+4*80h],eax
  mov edx,esp
  mov esp,0x10000
  int 80h
  NewInt80h:
  xchg esp,edx
  cmp edx,0x10000-6
  jnz IsStack16Bit

  Stack selector loaded from GDT:
  GDT:
  real32_GDT            =

  dq 0
  dw 0xFFFF,0x0000,9A00h,0xCF     ; 32-bit code descriptor
  dw 0xFFFF,0x0000,9200h,0x8F     ;   4 GB data descriptor
  dw 0xFFFF,0x0000,9A00h,0x00     ; 16-bit code descriptor
  dw 0xFFFF,0x0000,9200h,0xCF     ; 32-bit data descriptor stack

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902267/+subscriptions

