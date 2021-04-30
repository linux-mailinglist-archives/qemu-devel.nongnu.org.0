Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C137007E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:29:59 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXtm-0001Hq-Uc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcXVl-0000xR-LM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:05:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:57636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcXVg-0002sh-74
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:05:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcXVf-0004dJ-6f
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 18:05:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DB0882E815C
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 18:05:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 17:50:37 -0000
From: Michael Slade <740895@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: guillaume-robin janitor mslade th-huth
X-Launchpad-Bug-Reporter: Guillaume Robin (guillaume-robin)
X-Launchpad-Bug-Modifier: Michael Slade (mslade)
References: <20110323111128.18758.37780.malonedeb@wampee.canonical.com>
Message-Id: <161980503749.13717.12143505986122651667.malone@wampee.canonical.com>
Subject: [Bug 740895] Re: qemu freeze when loading msdos with EMM386.EXE NOEMS
 HIGHSCAN
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 6309ec619749ec24e6f4ca3c1a2a11b2b36bc2c6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 740895 <740895@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI I experienced hangs with emm386.exe (with NOEMS but not HIGHSCAN)
using qemu 3.1.0 (from debian buster), but not with qemu 5.0.1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/740895

Title:
  qemu freeze when loading msdos with EMM386.EXE NOEMS HIGHSCAN

Status in QEMU:
  Expired

Bug description:
  Qemu version used : 0.11.2 and 0.14.0
  Guest : Ms-Dos 6.2
  Host : Ubuntu 10.04 with 2.6.32-29-generic SMP i686
  Starting Qemu with command : qemu -hda dos.img -cpu 486 -m 16

  When I start msDos under Qemu with the option (in CONFIG.SYS) =

  DEVICE=3DC:\DOS\EMM386.EXE NOEMS HIGHSCAN
  the guest freeze.
  If I remove "HIGHSCAN" system is booting (but my software is not working).

  The whole thing is working on a real computer with a 486 with 16Mb ram
  or a PII.

  "HIGHSCAN switch allows EMM386.EXE to map expanded memory pages or
  upper memory blocks (UMBs) over portions of the upper memory area
  (UMA) used by system read-only memory " from
  http://support.microsoft.com/kb/96522/en-us

  I add some traces inside "default_ioport_read" in ioport.c, but I
  don't see any access to F000h-F7FFh like said in ms help.

  Before the system hung, there is access to dma1, dma page register and
  dma2 :

  inb : 0087 00
  outb: 000c 00
  inb : 0000 00
  inb : 0000 00
  inb : 0001 00
  inb : 0001 00
  inb : 0083 00
  outb: 000c 00
  inb : 0002 00
  inb : 0002 00
  inb : 0003 00
  inb : 0003 00
  inb : 0081 00
  outb: 000c 00
  inb : 0004 00
  inb : 0004 00
  inb : 0005 00
  inb : 0005 00
  inb : 0082 00
  outb: 000c 00
  inb : 0006 00
  inb : 0006 00
  inb : 0007 00
  inb : 0007 00
  inb : 008b 00
  outb: 00d8 00
  inb : 00c4 00
  inb : 00c4 00
  inb : 00c6 00
  inb : 00c6 00
  inb : 0089 00
  outb: 00d8 00
  inb : 00c8 00
  inb : 00c8 00
  inb : 00ca 00
  inb : 00ca 00
  inb : 008a 00
  outb: 00d8 00
  inb : 00cc 00
  inb : 00cc 00
  inb : 00ce 00
  inb : 00ce 00
  outb: 000c 00
  outb: 00d8 00

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/740895/+subscriptions

