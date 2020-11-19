Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103332B9C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:49:48 +0100 (CET)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqsF-000576-5F
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfqa7-0000fv-KO
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:31:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfqa2-0007o3-Ad
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:31:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfqa0-0008Q1-3T
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 20:30:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 09BA02E8148
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 20:30:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 20:24:54 -0000
From: Alistair Francis <1815721@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 bmeng-cn rtos.pharos teodori-serge
X-Launchpad-Bug-Reporter: RTOS Pharos (rtos.pharos)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <155004342499.19242.14077661245921319117.malonedeb@soybean.canonical.com>
Message-Id: <160581749483.25138.3819879305567030848.malone@wampee.canonical.com>
Subject: [Bug 1815721] Re: RISC-V PLIC enable interrupt for multicore
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 013fc13822340332527cf1746b97e85733e016a3
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
Reply-To: Bug 1815721 <1815721@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm going to close this bug as it seems like the issue that RTOS Pharos
raised is not an issue.

@Teodori Serge please open a new issue if you have a bug. Make sure to
include as much detail as possible and steps to reproduce it.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815721

Title:
  RISC-V PLIC enable interrupt for multicore

Status in QEMU:
  Invalid

Bug description:
  Hello all,

  There is a bug in Qemu related to the enabling of external interrupts
  for multicores (Virt machine).

  After correcting Qemu as described in #1815078
  (https://bugs.launchpad.net/qemu/+bug/1815078), when we try to enable
  interrupts for core 1 at address 0x0C00_2080 we don't seem to be able
  to trigger an external interrupt  (e.g. UART0).

  This works perfectly for core 0, but fore core 1 it does not work at
  all. I assume that given bug #1815078 does not enable any external
  interrupt then this feature has not been tested. I tried to look at
  the qemu source code but with no luck so far.

  I guess the problem is related to function parse_hart_config (in
  sfive_plic.c) that initializes incorrectly the
  plic->addr_config[addrid].hartid, which is later on read in
  sifive_plic_update. But this is a guess.

  Best regards,
  Pharos team

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815721/+subscriptions

