Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C828E2D5736
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:32:52 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIJf-0006JM-Ot
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHz3-0003dI-IW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:33 -0500
Received: from indium.canonical.com ([91.189.90.7]:34190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHz1-00044s-5F
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHyz-0006OM-Tb
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF3042E8137
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:02:06 -0000
From: Thomas Huth <1890333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159656782458.2385.15174533675764579105.malonedeb@gac.canonical.com>
Message-Id: <160759092666.10418.3526134912019005138.malone@wampee.canonical.com>
Subject: [Bug 1890333] Re: [OSS-Fuzz] Issue 26797:
 qemu:qemu-fuzz-i386-target-generic-fuzz-virtio-blk: ASSERT: addr < cache->len
 && 2 <= cache->len - addr
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 21b6bda68e698b232e5ea91acc94b9d9a07c446e
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
Reply-To: Bug 1890333 <1890333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix in commit 2d69eba5fe52045b2c8b0d04fd3806414352afc1

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890333

Title:
  [OSS-Fuzz]  Issue 26797: qemu:qemu-fuzz-i386-target-generic-fuzz-
  virtio-blk: ASSERT: addr < cache->len && 2 <=3D cache->len - addr

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
  -device virtio-blk,drive=3Dmydrive \
  -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001001
  outl 0xcfc 0x6574c1ff
  outl 0xcf8 0x8000100e
  outl 0xcfc 0xefe5e1e
  outl 0xe86 0x3aff9090
  outl 0xe84 0x3aff9090
  outl 0xe8e 0xe
  EOF

  qemu-system-i386: /home/alxndr/Development/qemu/general-fuzz/include/exec=
/memory_ldst_cached.inc.h:88: void address_space_stw_le_cached(MemoryRegion=
Cache *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *): Assertion `addr < ca=
che->len && 2 <=3D cache->len - addr' failed.
  Aborted

  I can trigger similar assertions with other VIRTIO devices, as-well.
  I reported this at some point in Message-ID: <20200511033001.dzvtbdhl3oz5=
pgiy@mozz.bu.edu> but never created a Launchpad issue...
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890333/+subscriptions

