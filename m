Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942112A0B74
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 17:42:39 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYXU6-0004mg-0y
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 12:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kYXSO-00041w-QK
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 12:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kYXSM-0002s2-Fz
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 12:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kYXSK-00085b-Iw
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 16:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E5502E811E
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 16:40:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2020 16:28:31 -0000
From: CandyMan <1902267@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: candyman30
X-Launchpad-Bug-Reporter: CandyMan (candyman30)
X-Launchpad-Bug-Modifier: CandyMan (candyman30)
References: <160407399412.14863.7198304237559619710.malonedeb@wampee.canonical.com>
Message-Id: <160407531156.8791.4474734823419288731.malone@soybean.canonical.com>
Subject: [Bug 1902267] Re: CPU not support 32-bit stack in 32-bit unreal mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="96ff31b88b65a0d0ea73b89333fe7c4a2669d8fb"; Instance="production"
X-Launchpad-Hash: 2c4a0e5f0cb29275f9d7a3c852102ae5629c836b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 11:55:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1902267 <1902267@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Attachment removed: "my operating system"
   https://bugs.launchpad.net/qemu/+bug/1902267/+attachment/5429520/+files/=
FLATDOS.IMG

** Attachment added: "my operating system"
   https://bugs.launchpad.net/qemu/+bug/1902267/+attachment/5429530/+files/=
FLATDOS.IMG

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902267

Title:
  CPU not support 32-bit stack in 32-bit unreal mode

Status in QEMU:
  New

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

