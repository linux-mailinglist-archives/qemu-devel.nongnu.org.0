Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5936342C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 08:48:29 +0200 (CEST)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY1EK-00080O-2M
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 02:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY1Bi-0007Ln-VB
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 02:45:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:58830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lY1Bf-0003Hl-Pv
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 02:45:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lY1Bc-00041V-OG
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 06:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A9152E8010
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 06:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Apr 2021 06:37:26 -0000
From: Teodori Serge <1923197@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: riscv64
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 teodori-serge
X-Launchpad-Bug-Reporter: Teodori Serge (teodori-serge)
X-Launchpad-Bug-Modifier: Teodori Serge (teodori-serge)
References: <161797335493.30650.12922009005165891710.malonedeb@gac.canonical.com>
 <161871776377.26098.9701102541297124152.malone@chaenomeles.canonical.com>
Message-Id: <CANUt7sqtqUCMttUBXL=90Eb6ANjx-4HbLYWAPxCH=+RhJwWSgQ@mail.gmail.com>
Subject: Re: [Bug 1923197] Re: RISC-V priviledged instruction error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: dfd97bb022f00fadd9899f44968f16951d176c3e
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
Reply-To: Bug 1923197 <1923197@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Francis,

Yes thank you. I added code to setup a basic PMP and it works now. Thank
you and best regards,

Teodori Serge

On Sun, 18 Apr 2021, 05:55 Alistair Francis, <1923197@bugs.launchpad.net>
wrote:

> We fixed a bug to make QEMU act more like hardware, which now means that
> PMP must be configured in M-mode.
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1923197
>
> Title:
>   RISC-V priviledged instruction error
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1923197/+subscriptions
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923197

Title:
  RISC-V priviledged instruction error

Status in QEMU:
  Invalid

Bug description:
  Hello when performing an MRET with MPP set to something else than 0b11
  in MSTATUS, 'Invalid Instruction' exception will be triggered. The
  problem appeared in code after version 5.2.0. Use following code to
  test.

  =C2=A0=C2=A0# setup interrupt handling for monitor mode
  =C2=A0=C2=A0la t0, entry_loop
  =C2=A0=C2=A0la t1, entry_trap
  =C2=A0=C2=A0li t2, 0x888
  =C2=A0=C2=A0li t3, 0x1880
  =C2=A0=C2=A0csrw mepc, t0
  =C2=A0=C2=A0csrw mtvec, t1
  =C2=A0=C2=A0csrs mie, t2
  =C2=A0=C2=A0csrs mstatus, t3

  =C2=A0=C2=A0# if supervisor mode not supported, then loop forever
  =C2=A0=C2=A0csrr t0, misa
  =C2=A0=C2=A0li t1, 0x40000
  =C2=A0=C2=A0and t2, t1, t0
  =C2=A0=C2=A0beqz t2, 1f

  =C2=A0=C2=A0# setup interrupt i& exception delegation for supervisor mode
  =C2=A0=C2=A0li t0, 0xc0000000 # 3 GiB (entry address of supervisor)
  =C2=A0=C2=A0li t1, 0x1000
  =C2=A0=C2=A0li t2, 0x300
  =C2=A0=C2=A0li t3, 0x222
  =C2=A0=C2=A0csrw mepc, t0
  =C2=A0=C2=A0csrc mstatus, t1
  =C2=A0=C2=A0csrs medeleg, t2
  =C2=A0=C2=A0csrs mideleg, t3

  =C2=A0=C2=A0# pass mhartid as first parameter to supervisor
  =C2=A0=C2=A0csrr a0, mhartid

  1:
  =C2=A0=C2=A0mret

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923197/+subscriptions

