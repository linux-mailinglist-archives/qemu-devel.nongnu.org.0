Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093363C1EAD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:56:06 +0200 (CEST)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iYX-0005SV-0p
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i6E-0006kr-9E
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5p-0001UO-Ha
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5a-0005Di-OP
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:26:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7485A2E8289
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:30 -0000
From: Launchpad Bug Tracker <1741718@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor michal-nowak-b mike-papersolve th-huth
X-Launchpad-Bug-Reporter: Michal Nowak (michal-nowak-b)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151532104339.3110.15836914058272965717.malonedeb@soybean.canonical.com>
Message-Id: <162580425085.19936.6214962576175344208.malone@loganberry.canonical.com>
Subject: [Bug 1741718] Re: qemu-system-sparc64: "panic[cpu0]/thread=180e000:
 lgrp_traverse: No memory blocks found" with tribblix-sparc-0m16.iso
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: cd3dac2e37950d313237d34890c55611872f04f4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1741718 <1741718@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1741718

Title:
  qemu-system-sparc64: "panic[cpu0]/thread=3D180e000: lgrp_traverse: No
  memory blocks found" with tribblix-sparc-0m16.iso

Status in QEMU:
  Expired

Bug description:
  qemu-system-sparc64 Niagara VM running Tribblix crashes with
  "panic[cpu0]/thread=3D180e000: lgrp_traverse: No memory blocks found" on
  QEMU 2.11.0. Happens also with 1 GB, 4 GB, and 8 GB of RAM.

  $=C2=A0qemu-system-sparc64 -nographic -M niagara -L /home/newman/Download=
s/OpenSPARCT1_Arch.1.5/S10image/ -drive if=3Dpflash,readonly=3Don,file=3D/h=
ome/newman/Downloads/tribblix-sparc-0m16.iso -m 2048
  =11cpu Probing I/O buses

  =

  Sun Fire T2000, No Keyboard
  Copyright 2005 Sun Microsystems, Inc.  All rights reserved.
  OpenBoot 4.20.0, 256 MB memory available, Serial #1122867.
  [mo23723 obp4.20.0 #0]
  Ethernet address 0:80:3:de:ad:3, Host ID: 80112233.


  ok boot
  Boot device: vdisk  File and args: =

  hsfs-file-system =

  Loading: /platform/sun4v/boot_archive
  ramdisk-root ufs-file-system =

  Loading: /platform/sun4v/kernel/sparcv9/unix
  \
  panic[cpu0]/thread=3D180e000: lgrp_traverse: No memory blocks found

  Warning - stack not written to the dumpbuf
  000000000180b710 unix:lgrp_traverse+120 (fff32000, 10d5f30, 2000, 7efefef=
f, 81010100, ff00)
    %l0-3: 0000000001876c00 ffffffffffffffff 00000000010d6c00 0000000000000=
000
    %l4-7: 800000008f000740 800000008fc54750 00000000f0254cc4 00000000010de=
dd0
  000000000180b800 unix:plat_lgrp_init+14 (4, 180e000, 4, 0, 180b950, 1)
    %l0-3: 00000000fff32000 00000000fff340e0 00000000fff34590 00000000010d5=
f28
    %l4-7: 0000000000000016 0000000000000000 0000000000000016 0000000000000=
011
  000000000180b8b0 unix:lgrp_plat_init+74 (0, 0, 0, 180ba08, 180ba00, 91)
    %l0-3: 0000000000002000 00000000fff34000 0000000001874c00 0000000001874=
c00
    %l4-7: 0000000000000000 0000000001874c00 000000000180b950 00000000010de=
048
  000000000180b960 unix:lgrp_init+4 (0, 2000, 70002000, 0, 180c0e8, 0)
    %l0-3: 000000000180e380 000000000183c678 000000000180ba08 00000000010d4=
f90
    %l4-7: 00000000010d4fa0 00000000010d1c00 0000000000004000 0000000080001=
070
  000000000180ba10 unix:mlsetup+2f4 (180bb80, 180bec0, 0, 0, f025496c, 0)
    %l0-3: 00000000018ee000 0000000070002000 0000000070002000 000000000180b=
ad0
    %l4-7: 000000000190c4d8 00000001001f56e0 0000000000000000 0000000080001=
070

  =

  ERROR: Last Trap: Level 14 Interrupt
  [Exception handlers interrupted, please file a bug]
  [type 'resume' to attempt a normal recovery]

  =

  Without "if=3Dpflash" VM hangs:

  $ qemu-system-sparc64 -nographic -M niagara -L /home/newman/Downloads/Ope=
nSPARCT1_Arch.1.5/S10image/ -drive readonly=3Don,file=3D/home/newman/Downlo=
ads/tribblix-sparc-0m16.iso -m 4096
  =11cpu Probing I/O buses

  =

  Sun Fire T2000, No Keyboard
  Copyright 2005 Sun Microsystems, Inc.  All rights reserved.
  OpenBoot 4.20.0, 256 MB memory available, Serial #1122867.
  [mo23723 obp4.20.0 #0]
  Ethernet address 0:80:3:de:ad:3, Host ID: 80112233.


  ok boot
  Boot device: vdisk  File and args: =

  qemu: fatal: Trap 0x0032 while trap level (6) >=3D MAXTL (6), Error state
  pc: 000000000040f01c  npc: 000000000040f020
  %g0-3: 0000000000000000 0000000000000000 0000000000000000 0000009700000280
  %g4-7: 0000000000001000 0000000000000000 0000000000000000 0000000000000000
  %o0-3: 0000000000000000 000000008ffd6000 0000000000008000 000000000000000=
0 =

  %o4-7: 0000000000000000 00000000000000f0 00000000fff55701 00000000f020d78=
c =

  %l0-3: 000000000002fd10 7ffffffffffffffe 8000000000000000 000000000000000=
0 =

  %l4-7: 000000000000000b 800000008fffa750 00000000f026fbf0 00000000f022a0d=
8 =

  %i0-3: 0000000080000000 0000000010000000 0000000000000000 000000000000000=
0 =

  %i4-7: 0000000000000000 0000000000000000 0000000000000000 000000000000000=
0 =

  %f00:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f08:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f16:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f24:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f32:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f40:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f48:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  %f56:  0000000000000000 0000000000000000 0000000000000000 0000000000000000
  pstate: 00000014 ccr: 11 (icc: ---C xcc: ---C) asi: 20 tl: 6 pil: d gl: 6
  tbr: 00000000f0200000 hpstate: 0000000000000004 htba: 0000000000400000
  cansave: 6 canrestore: 0 otherwin: 0 wstate: 0 cleanwin: 7 cwp: 0
  fsr: 0000000000000000 y: 0000000000000000 fprs: 0000000000000004

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1741718/+subscriptions

