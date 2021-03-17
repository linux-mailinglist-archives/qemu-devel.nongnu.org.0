Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68BB33F598
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:34:24 +0100 (CET)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZ7n-00008S-S4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMYzP-0004gf-38
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:25:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMYzM-0001oc-Bv
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:25:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lMYzK-0007hd-Dj
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6461F2E805B
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Mar 2021 16:18:00 -0000
From: Thomas Huth <1919253@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maxco th-huth
X-Launchpad-Bug-Reporter: Apteryx (maxco)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161584419612.2428.15389834064757426371.malonedeb@chaenomeles.canonical.com>
Message-Id: <161599788096.15858.17864167857847123253.malone@gac.canonical.com>
Subject: [Bug 1919253] Re: QEMU doesn't build reproducibly anymore in 5.2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 1ceb6b23b4773d352473355e7c15a169b0c63a42
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
Reply-To: Bug 1919253 <1919253@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for the update, so I'm closing this ticket now.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1919253

Title:
  QEMU doesn't build reproducibly anymore in 5.2.0

Status in QEMU:
  Fix Released

Bug description:
  It used to be that building QEMU 5.1.0 twice in a row, using Guix,
  would result in bit-for-bit identical results.

  Starting with 5.2.0, this is no longer true.  Here's a summary of
  which files have non-determinism:

  Here's a summary of the differing files:

  $ diff -r /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0{,-check}
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-aarch64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-aarch64_be and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-aarch64_be differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-alpha differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-arm differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-armeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-armeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-cris differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-edid and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-edid differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ga and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-ga differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-hppa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-i386 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-img and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-img differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-io and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-io differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-keymap and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-keymap differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-m68k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-microblaze differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-microblazeel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-mips differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-mips64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-mips64el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-mipsel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsn32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-mipsn32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsn32el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-mipsn32el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-nbd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-nbd differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-nios2 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-or1k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-ppc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-ppc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc64le and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-ppc64le differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-pr-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-pr-helper differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-riscv32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-riscv64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-s390x differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-sh4 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-sh4eb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-sparc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc32plus and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-sparc32plus differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-sparc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-storage-daemon and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-storage-daemon differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-aarch64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-alpha differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-arm differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-avr and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-avr differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-cris differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-hppa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-i386 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-m68k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-=
5.2.0-check/bin/qemu-system-microblaze differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qem=
u-5.2.0-check/bin/qemu-system-microblazeel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-mips differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-mips64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/bin/qemu-system-mips64el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-mipsel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-moxie and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-moxie differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-nios2 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-or1k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-ppc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-ppc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-riscv32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-riscv64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-rx and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-rx differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-s390x differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-sh4 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-sh4eb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-sparc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-sparc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-tricore and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-tricore differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-x86_64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-xtensa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/bin/qemu-system-xtensaeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-x86_64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-xtensa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-xtensaeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/qemu-bridge-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-=
5.2.0-check/libexec/qemu-bridge-helper differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/vhost-user-gpu and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/libexec/vhost-user-gpu differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/virtiofsd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/libexec/virtiofsd differ

  Attached is a sample log of diffoscope for the qemu-aarch64 binary.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1919253/+subscriptions

