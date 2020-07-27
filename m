Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A422FBED
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 00:12:17 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0BM0-0000IT-QW
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 18:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k0BKt-0008JB-G1
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 18:11:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:60392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k0BKo-0005yu-Vv
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 18:11:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k0BKl-0007AS-DJ
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 22:10:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 233802E8106
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 22:10:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2020 22:05:26 -0000
From: John Snow <1878255@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr jnsnow philmd stefanha
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <158930780033.13046.17639068194138488918.malonedeb@wampee.canonical.com>
Message-Id: <159588752660.5002.15274556483917366166.malone@soybean.canonical.com>
Subject: [Bug 1878255] Re: Assertion failure in bdrv_aio_cancel, through ide
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f5292789686767e13ba9d1313ea4f1b9529a5c84
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 16:15:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1878255 <1878255@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you, Stefan!

Fix: https://gitlab.com/qemu-
project/qemu/-/commit/1d719ddc35e9827b6e5df771555874df34301a0d


** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878255

Title:
  Assertion failure in bdrv_aio_cancel, through ide

Status in QEMU:
  Fix Committed

Bug description:
  Hello,
  While fuzzing, I found an input that triggers an assertion failure in bdr=
v_aio_cancel, through ide:

  #1  0x00007ffff685755b in __GI_abort () at abort.c:79
  #2  0x0000555556a8d396 in bdrv_aio_cancel (acb=3D0x607000061290) at /home=
/alxndr/Development/qemu/block/io.c:2746
  #3  0x0000555556a58525 in blk_aio_cancel (acb=3D0x2) at /home/alxndr/Deve=
lopment/qemu/block/block-backend.c:1540
  #4  0x0000555556552f5b in ide_reset (s=3D<optimized out>) at /home/alxndr=
/Development/qemu/hw/ide/core.c:1318
  #5  0x0000555556552aeb in ide_bus_reset (bus=3D0x62d000017398) at /home/a=
lxndr/Development/qemu/hw/ide/core.c:2422
  #6  0x0000555556579ba5 in ahci_reset_port (s=3D<optimized out>, port=3D<o=
ptimized out>) at /home/alxndr/Development/qemu/hw/ide/ahci.c:650
  #7  0x000055555657bd8d in ahci_port_write (s=3D0x61e000014d70, port=3D0x2=
, offset=3D<optimized out>, val=3D0x10) at /home/alxndr/Development/qemu/hw=
/ide/ahci.c:360
  #8  0x000055555657bd8d in ahci_mem_write (opaque=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at /home=
/alxndr/Development/qemu/hw/ide/ahci.c:513
  #9  0x00005555560028d7 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at /home/a=
lxndr/Development/qemu/memory.c:483
  #10 0x0000555556002280 in access_with_adjusted_size (addr=3D<optimized ou=
t>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opt=
imized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>=
, mr=3D0x61e000014da0, attrs=3D...) at /home/alxndr/Development/qemu/memory=
.c:544
  #11 0x0000555556002280 in memory_region_dispatch_write (mr=3D<optimized o=
ut>, addr=3D<optimized out>, data=3D0x10, op=3D<optimized out>, attrs=3D...=
) at /home/alxndr/Development/qemu/memory.c:1476
  #12 0x0000555555f171d4 in flatview_write_continue (fv=3D<optimized out>, =
addr=3D0xe106c22c, attrs=3D..., ptr=3D<optimized out>, len=3D0x1, addr1=3D0=
x7fffffffb8d0, l=3D<optimized out>, mr=3D0x61e000014da0) at /home/alxndr/De=
velopment/qemu/exec.c:3137
  #13 0x0000555555f0fb98 in flatview_write (fv=3D0x60600003b180, addr=3D<op=
timized out>, attrs=3D..., buf=3D<optimized out>, len=3D<optimized out>) at=
 /home/alxndr/Development/qemu/exec.c:3177

  I can reproduce it in qemu 5.0 using:

  cat << EOF | ~/Development/qemu/build/i386-softmmu/qemu-system-i386 -qtes=
t stdio -monitor none -serial none -M pc-q35-5.0  -nographic
  outl 0xcf8 0x8000fa24
  outl 0xcfc 0xe106c000
  outl 0xcf8 0x8000fa04
  outw 0xcfc 0x7
  outl 0xcf8 0x8000fb20
  write 0x0 0x3 0x2780e7
  write 0xe106c22c 0xd 0x1130c218021130c218021130c2
  write 0xe106c218 0x15 0x110010110010110010110010110010110010110010
  EOF

  I also attached the commands to this launchpad report, in case the
  formatting is broken:

  qemu-system-i386 -qtest stdio -monitor none -serial none -M pc-q35-5.0
  -nographic < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878255/+subscriptions

