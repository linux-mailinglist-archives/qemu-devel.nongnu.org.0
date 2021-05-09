Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21633377878
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 22:26:59 +0200 (CEST)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfq0v-0000ie-NN
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 16:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfpzc-0007fT-0P
 for qemu-devel@nongnu.org; Sun, 09 May 2021 16:25:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfpza-0003nS-0y
 for qemu-devel@nongnu.org; Sun, 09 May 2021 16:25:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfpzX-000899-LQ
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 20:25:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 89F172E8058
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 20:25:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 20:17:53 -0000
From: Aaro Koskinen <1920602@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aaro-koskinen
X-Launchpad-Bug-Reporter: Aaro Koskinen (aaro-koskinen)
X-Launchpad-Bug-Modifier: Aaro Koskinen (aaro-koskinen)
References: <161624570188.19824.1091833072893020317.malonedeb@wampee.canonical.com>
Message-Id: <162059147325.2033.1473778380779684896.malone@wampee.canonical.com>
Subject: [Bug 1920602] Re: QEMU crash after a QuickBASIC program integer
 overflow
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 88372b6f6b06fe1649d7d184f782a57068e51325
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
Reply-To: Bug 1920602 <1920602@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attached is a minimal FreeDOS floppy disk to reproduce the TCG crash.
Still reproducible with QEMU v6.0.0:

WARNING: Image format was not specified for 'test-floppy.img' and probing g=
uessed raw.
         Automatically detecting the format is dangerous for raw images, wr=
ite operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
SeaBIOS (version rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org)
Booting from Floppy...
................................................123
FreeDOS kernel 2042 (build 2042 OEM:0xfd) [compiled May 11 2016]
Kernel compatibility 7.10 - WATCOMC - FAT32 support

(C) Copyright 1995-2012 Pasquale J. Villani and The FreeDOS Project.
All Rights Reserved. This is free software and comes with ABSOLUTELY NO
WARRANTY; you can redistribute it and/or modify it under the terms of the
GNU General Public License as published by the Free Software Foundation;
either version 2, or (at your option) any later version.
 - InitDiskno hard disks detected

FreeCom version 0.84-pre2 XMS_Swap [Aug 28 2006 00:29:00]
A:\>KILLER.EXE
**
ERROR:../accel/tcg/tcg-accel-ops.c:80:tcg_handle_interrupt: assertion faile=
d: (qemu_mutex_iothread_locked())
Bail out! ERROR:../accel/tcg/tcg-accel-ops.c:80:tcg_handle_interrupt: asser=
tion failed: (qemu_mutex_iothread_locked())
Aborted


** Attachment added: "test-floppy.img.gz"
   https://bugs.launchpad.net/qemu/+bug/1920602/+attachment/5495920/+files/=
test-floppy.img.gz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920602

Title:
  QEMU crash after a QuickBASIC program integer overflow

Status in QEMU:
  New

Bug description:
  A trivial program compiled with QuickBASIC 4.5 with integer overflow
  will crash QEMU when ran under MS-DOS 5.0 or FreeDOS 1.2:

  C:\KILLER>type killer.bas
  A% =3D VAL("99999"):PRINT A%

  C:\KILLER>killer.exe
  **
  =C2=A0=C2=A0ERROR:../qemu-5.2.0/accel/tcg/tcg-cpus.c:541:tcg_handle_inter=
rupt: assertion failed: (qemu_mutex_iothread_locked())
  Aborted

  QEMU version v5.2, compiler for ARM, and started with command line:

  qemu-system-i386 -curses -cpu 486 -m 1 -drive dos.img

  The same test under Ubuntu QEMU and KVM/x86_64 (QEMU emulator version
  4.2.1 (Debian 1:4.2-3ubuntu6.14)) will just silently hang the QEMU. On
  DOSBOX, the machine does not die and program outputs the value -31073.

  The EXE to reproduce the issue is attached.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920602/+subscriptions

