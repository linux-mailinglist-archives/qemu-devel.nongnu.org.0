Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C933E379F59
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:52:24 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLJf-0006BH-RL
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8e-0002lQ-Vo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:41:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:60812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgL8b-00042S-Px
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:41:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgL8a-0003sr-FL
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 65B552E8139
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:40:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:34:42 -0000
From: Thomas Huth <1681439@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr bugs-syssec janitor jnsnow kempniu stefanha
 th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhCAoa2VtcG5pdSk=?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170410132346.31250.84835.malonedeb@wampee.canonical.com>
Message-Id: <162071128240.3040.6057298804607470733.malone@wampee.canonical.com>
Subject: [Bug 1681439] Re: dma_blk_cb leaks memory map handles on misaligned IO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 88ff0159bfdc7c97021e82a81f601389e7ec9d33
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1681439 <1681439@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/259


** Tags added: fuzzer

** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #259
   https://gitlab.com/qemu-project/qemu/-/issues/259

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681439

Title:
  dma_blk_cb leaks memory map handles on misaligned IO

Status in QEMU:
  Expired

Bug description:
  Maintainer Edit:

  The functions in dma-helpers mismanage misaligned IO, badly enough to
  cause an infinite loop where no progress can be made. This allows the
  IDE state machine to get wedged such that cancelling DMA can fail;
  because the DMA helpers have bodged the state of the DMA transfer. See
  Comment #15 for the in-depth analysis.

  I've updated the name of this bug to reflect the current status as I
  understand it.

  --js

  =

  Original report:

  Since upgrading to QEMU 2.8.0, my Windows 7 64-bit virtual machines
  started crashing due to the assertion quoted in the summary failing.
  The assertion in question was added by commit 9972354856 ("block: add
  BDS field to count in-flight requests").  My tests show that setting
  discard=3Dunmap is needed to reproduce the issue.  Speaking of
  reproduction, it is a bit flaky, because I have been unable to come up
  with specific instructions that would allow the issue to be triggered
  outside of my environment, but I do have a semi-sane way of testing that
  appears to depend on a specific initial state of data on the underlying
  storage volume, actions taken within the VM and waiting for about 20
  minutes.

  Here is the shortest QEMU command line that I managed to reproduce the
  bug with:

  =C2=A0=C2=A0=C2=A0=C2=A0qemu-system-x86_64 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-machine pc-i440fx-2.7,ac=
cel=3Dkvm \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m 3072 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3D/dev/lvm/qe=
mu,format=3Draw,if=3Dide,discard=3Dunmap \
  =C2=A0-netdev tap,id=3Dhostnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno=
,vhost=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,ne=
tdev=3Dhostnet0 \
  =C2=A0-vnc :0

  The underlying storage (/dev/lvm/qemu) is a thin LVM snapshot.

  QEMU was compiled using:

  =C2=A0=C2=A0=C2=A0=C2=A0./configure --python=3D/usr/bin/python2.7 --targe=
t-list=3Dx86_64-softmmu
  =C2=A0=C2=A0=C2=A0=C2=A0make -j3

  My virtualization environment is not really a critical one and
  reproduction is not that much of a hassle, so if you need me to gather
  further diagnostic information or test patches, I will be happy to help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681439/+subscriptions

