Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B907C3AFBEB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:28:06 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY17-0000Sc-Na
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzH-0005o9-I6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:55698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzE-0004op-Av
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXz9-00015g-9b
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DD2FF2E81DD
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:43 -0000
From: Launchpad Bug Tracker <1853123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffasm janitor th-huth
X-Launchpad-Bug-Reporter: Leonid Myravjev (ffasm)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157415859481.31407.14877522937916803487.malonedeb@wampee.canonical.com>
Message-Id: <162433552355.20423.13772404594710150847.malone@loganberry.canonical.com>
Subject: [Bug 1853123] Re: Memory synchronization error between kvm and target, 
 e1000(dpdk)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: da532e2aa5d2ca0a8038ca965bf25de1b9539441
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
Reply-To: Bug 1853123 <1853123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1853123

Title:
  Memory synchronization error between kvm and target, e1000(dpdk)

Status in QEMU:
  Expired

Bug description:
  Hi folks.

  I use linux with dpdk drivers on the target system, and e1000 emulation d=
evice with tap interface for host. I use kvm for accelerate.
  Version qemu 4.0.94 and master (Nov 12 10:14:33 2019)
  Version dpdk stable-17.11.4
  Version linux host 4.15.0-66-generic (ubuntu 18.04)

  I type command "ping <target ip> -f" and wait about 1-2 minutes.
  Network subsystem freezes.

  For receive the eth pack from host system (tap interface) to host
  system the e1000 using ring buffer.

  The e1000 write body of eth pack, set E1000_RXD_STAT_DD flag and move RDH=
 (Ring Device Head).
  (file hw/net/e1000.c function e1000_receive_iov() )

  The dpdk driver is reading from E1000_RXD_STAT_DD flags (ignoring RDH), i=
f flag is set: read buffer, unset flag E1000_RXD_STAT_DD and move RDT (Ring=
 Device Tail).
  (source drivers/net/e1000/em_rxtx.c function eth_em_recv_scattered_pkts()=
 )

  I see what the driver unet E1000_RXD_STAT_DD (rxdp->status =3D 0; ), but
  sometimes rxdp->status remains equal to 7. On the next cycle, this
  this buffer is read, RDT moved to far. RDH becomes equal RDT and
  network is freezes.

  If I insert some delay after unset E1000_RXD_STAT_DD, and repeatedly unse=
t E1000_RXD_STAT_DD (if rxdp->status =3D=3D 7 ), then all work fine.
  If check E1000_RXD_STAT_DD without delay, status rxdp->status always vali=
d.

  This only appears on kvm. If I use tcg all works fine.

  I trying set watchpoint for memory on the qemu (for tcg), and see,
  that for one package cycle of set/unse STAT_DD repeated once.

  I trying set watchpoint for memory on the qemu (for kvm), and see,
  that rxdp->status changed to 0(unset) only once, but is changes
  immediately before set flag.

  =

  Please help me with advice on how to catch and fix this error. =

  Theoretically, it would help me to trace the memory access when writing t=
o E1000_RXD_STAT_DD, RHD and RDT, both from the target and the host system.=
 But I have no idea how this can be done.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1853123/+subscriptions

