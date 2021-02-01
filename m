Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE130A5C9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:52:09 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WoQ-00008d-8F
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6WnE-00085W-Uz
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:50:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:34002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6WnC-0007gL-Sn
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:50:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6WnA-0006UX-Ef
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 10:50:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2C9A82E813B
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 10:50:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Feb 2021 10:42:48 -0000
From: Dong JianQiang <1914021@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: johndong pmaydell
X-Launchpad-Bug-Reporter: Dong JianQiang (johndong)
X-Launchpad-Bug-Modifier: Dong JianQiang (johndong)
References: <161217038744.31620.11534855593258118024.malonedeb@chaenomeles.canonical.com>
Message-Id: <161217616848.6922.17205232907557088889.malone@gac.canonical.com>
Subject: [Bug 1914021] Re: qemu: uncaught target signal 4 (Illegal
 instruction) but gdb remote-debug exited normally
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 2966b59314bf5234889a142f7be60ec7a75d7f26
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1914021 <1914021@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

yes, it reproduced on QEMU 5.0.0.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914021

Title:
  qemu: uncaught target signal 4 (Illegal instruction) but gdb remote-
  debug exited normally

Status in QEMU:
  New

Bug description:
  I'm getting Illegal instruction (core dumped) when running the
  attached a.out_err binary in qemu, but when using Gdb to remote-debug
  the program, it exited normally. will appreciate if you can help look
  into this qemu issue.

  readelf -h a.out_err
  ELF Header:
    Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
    Class:                             ELF32
    Data:                              2's complement, little endian
    Version:                           1 (current)
    OS/ABI:                            UNIX - System V
    ABI Version:                       0
    Type:                              EXEC (Executable file)
    Machine:                           ARM
    Version:                           0x1
    Entry point address:               0x8220
    Start of program headers:          52 (bytes into file)
    Start of section headers:          54228 (bytes into file)
    Flags:                             0x5000200, Version5 EABI, soft-float=
 ABI
    Size of this header:               52 (bytes)
    Size of program headers:           32 (bytes)
    Number of program headers:         3
    Size of section headers:           40 (bytes)
    Number of section headers:         16
    Section header string table index: 15

  qemu-arm version 4.0.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914021/+subscriptions

