Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF68371889
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:57:09 +0200 (CEST)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldawW-0007tx-I2
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldav8-00073D-Li
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:52852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldav6-0001hs-B2
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:55:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldav4-0006Lp-AC
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C1B02E8157
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 15:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 15:48:30 -0000
From: Adam Williamson <1762558@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awilliamson dgilbert-h th-huth
X-Launchpad-Bug-Reporter: Adam Williamson (awilliamson)
X-Launchpad-Bug-Modifier: Adam Williamson (awilliamson)
References: <152330957721.2718.12035311068510492278.malonedeb@wampee.canonical.com>
Message-Id: <162005691093.14329.3926996859574679609.malone@wampee.canonical.com>
Subject: [Bug 1762558] Re: Many crashes with "memslot_get_virt: slot_id 170
 too big"-type errors in 2.12.0 rc2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 635146642b66bf9af83c7443807c06523257bfab
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
Reply-To: Bug 1762558 <1762558@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This got resolved along the way and wasn't really a qemu bug anyway.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1762558

Title:
  Many crashes with "memslot_get_virt: slot_id 170 too big"-type errors
  in 2.12.0 rc2

Status in QEMU:
  Fix Released

Bug description:
  Since qemu 2.12.0 rc2 - qemu-2.12.0-0.6.rc2.fc29 - landed in Fedora
  Rawhide, just about all of our openQA-automated tests of Rawhide
  guests which run with qxl / SPICE graphics in the guest have died
  partway in, always shortly after the test switches from the installer
  (an X environment) to a console on a tty. qemu is, I think, hanging.
  There are always some errors like this right around the time of the
  hang:

  [2018-04-09T20:13:42.0736 UTC] [debug] QEMU: id 0, group 0, virt start 0,=
 virt end ffffffffffffffff, generation 0, delta 0
  [2018-04-09T20:13:42.0736 UTC] [debug] QEMU: id 1, group 1, virt start 7f=
42dbc00000, virt end 7f42dfbfe000, generation 0, delta 7f42dbc00000
  [2018-04-09T20:13:42.0736 UTC] [debug] QEMU: id 2, group 1, virt start 7f=
42d7a00000, virt end 7f42dba00000, generation 0, delta 7f42d7a00000
  [2018-04-09T20:13:42.0736 UTC] [debug] QEMU: =

  [2018-04-09T20:13:42.0736 UTC] [debug] QEMU: (process:45812): Spice-CRITI=
CAL **: memslot.c:111:memslot_get_virt: slot_id 218 too big, addr=3Dda8e21f=
bda8e21fb

  or occasionally like this:

  [2018-04-09T20:13:58.0717 UTC] [debug] QEMU: id 0, group 0, virt start 0,=
 virt end ffffffffffffffff, generation 0, delta 0
  [2018-04-09T20:13:58.0720 UTC] [debug] QEMU: id 1, group 1, virt start 7f=
f093c00000, virt end 7ff097bfe000, generation 0, delta 7ff093c00000
  [2018-04-09T20:13:58.0720 UTC] [debug] QEMU: id 2, group 1, virt start 7f=
f08fa00000, virt end 7ff093a00000, generation 0, delta 7ff08fa00000
  [2018-04-09T20:13:58.0720 UTC] [debug] QEMU: =

  [2018-04-09T20:13:58.0720 UTC] [debug] QEMU: (process:25622): Spice-WARNI=
NG **: memslot.c:68:memslot_validate_virt: virtual address out of range
  [2018-04-09T20:13:58.0720 UTC] [debug] QEMU:     virt=3D0x0+0x18 slot_id=
=3D0 group_id=3D1
  [2018-04-09T20:13:58.0721 UTC] [debug] QEMU:     slot=3D0x0-0x0 delta=3D0=
x0
  [2018-04-09T20:13:58.0721 UTC] [debug] QEMU: =

  [2018-04-09T20:13:58.0721 UTC] [debug] QEMU: (process:25622): Spice-WARNI=
NG **: display-channel.c:2426:display_channel_validate_surface: invalid sur=
face_id 1048576
  [2018-04-09T20:14:14.0728 UTC] [debug] QEMU: id 0, group 0, virt start 0,=
 virt end ffffffffffffffff, generation 0, delta 0
  [2018-04-09T20:14:14.0728 UTC] [debug] QEMU: id 1, group 1, virt start 7f=
f093c00000, virt end 7ff097bfe000, generation 0, delta 7ff093c00000
  [2018-04-09T20:14:14.0728 UTC] [debug] QEMU: id 2, group 1, virt start 7f=
f08fa00000, virt end 7ff093a00000, generation 0, delta 7ff08fa00000
  [2018-04-09T20:14:14.0728 UTC] [debug] QEMU: =

  [2018-04-09T20:14:14.0728 UTC] [debug] QEMU: (process:25622): Spice-CRITI=
CAL **: memslot.c:122:memslot_get_virt: address generation is not valid, gr=
oup_id 1, slot_id 0, gen 110, slot_gen 0

  The same tests running on Fedora 28 guests on the same hosts are not
  hanging, and the same tests were not hanging right before the qemu
  package got updated, so this seems very strongly tied to the new qemu.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1762558/+subscriptions

