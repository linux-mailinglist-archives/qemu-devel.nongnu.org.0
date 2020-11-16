Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407972B4FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:42:00 +0100 (CET)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejRv-0003TV-Ay
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7k-0007w9-82
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:09 -0500
Received: from indium.canonical.com ([91.189.90.7]:42000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7h-0002tD-6v
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kej7f-0001E8-2n
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:21:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6950F2E81AC
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:21:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:06:26 -0000
From: Thomas Huth <1699867@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anatol th-huth
X-Launchpad-Bug-Reporter: Anatol Pomozov (anatol)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149815632727.3205.9408286229805240743.malonedeb@chaenomeles.canonical.com>
Message-Id: <160554998685.14520.14413259433614215909.malone@soybean.canonical.com>
Subject: [Bug 1699867] Re: x86_64 qemu crashes at far call into long-mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 475eef2e58ec672d888fe0895e0ae373b56062cb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
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
Reply-To: Bug 1699867 <1699867@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1699867

Title:
  x86_64 qemu crashes at far call into long-mode

Status in QEMU:
  Incomplete

Bug description:
  I am experimenting with this OS https://github.com/phil-opp/blog_os
  and spotted a weird behavior with qemu.

  I am looking at code that does transition from 32bit mode to 64bit
  mode. Right now it does 'jmp $SELECTOR,64bitfunction'.
  https://github.com/phil-
  opp/blog_os/blob/557c6a58ea11e31685b9d014d307002d64df5c22/src/arch/x86_64=
/boot.asm#L32

  This code works fine with qemu/kvm/vmware.

  To transition from 32 to 64 bit code it is possible to use 'call'
  operation. So I am trying to replace that code with 'call
  $SELECTOR,64bitfunction'. It works fine with kvm and wmware. But it
  fails with Qemu emulation. See the interrup debug log attached. qemu
  crashes at 10302c (far call mnemonic).

  =

    103016:       e8 18 00 00 00          callq  103033 <set_up_page_tables>
    10301b:       e8 5c 00 00 00          callq  10307c <enable_paging>
    103020:       e8 ec 00 00 00          callq  103111 <set_up_SSE>
    103025:       0f 01 15 28 00 10 00    lgdt   0x100028(%rip)        # 20=
3054 <GCC_except_table2+0xdb5f8>
    10302c:       9a                      (bad)  =

    10302d:       40 31 10                rex xor %edx,(%rax)
    103030:       00 08                   add    %cl,(%rax)

  =

  As the code works at hardware I expect it to work with qemu. Thus current=
 qemu behavior looks like a bug.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1699867/+subscriptions

