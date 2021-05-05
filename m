Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C937393D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:22:51 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFcB-0004yb-0U
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaO-0003H3-B5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:21:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:48160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaL-0007gx-PZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:21:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFaK-00008Z-L5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:20:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E3EE2E8189
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:20:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:10:42 -0000
From: Thomas Huth <1810590@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson th-huth
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154669223236.4865.11026787151425960550.malonedeb@wampee.canonical.com>
Message-Id: <162021304306.6678.10346088420944547710.malone@wampee.canonical.com>
Subject: [Bug 1810590] Re: Record/replay example does not work
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 3add17a36cdb4c2f5502ab6c1bbd8363dee61208
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1810590 <1810590@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/160


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #160
   https://gitlab.com/qemu-project/qemu/-/issues/160

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1810590

Title:
  Record/replay example does not work

Status in QEMU:
  Expired

Bug description:
  Trying the record part of the record/replay example at
  https://github.com/qemu/qemu/blob/master/docs/replay.txt qemu
  immediately hangs with no guest output displayed.  This is with qemu
  from today's git (e59dbbac0364344a3ad84c3497a98c56003d3fb8).

  To reproduce:

    wget
  https://people.debian.org/~aurel32/qemu/i386/debian_squeeze_i386_standard=
.qcow2

    mv debian_squeeze_i386_standard.qcow2 disk.qcow2

    qemu-system-i386 \
         -icount shift=3D7,rr=3Drecord,rrfile=3Dreplay.bin \
         -drive file=3Ddisk.qcow2,if=3Dnone,id=3Dimg-direct \
         -drive driver=3Dblkreplay,if=3Dnone,image=3Dimg-direct,id=3Dimg-bl=
kreplay \
         -device ide-hd,drive=3Dimg-blkreplay \
         -netdev user,id=3Dnet1 -device rtl8139,netdev=3Dnet1 \
         -object filter-replay,id=3Dreplay,netdev=3Dnet1

  The above qemu command line is exactly the same as in the example.

  Tested on a Debian 9 x86_64 host.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1810590/+subscriptions

