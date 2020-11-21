Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2B2BBF77
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:12:28 +0100 (CET)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTcp-0007wa-I9
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTb9-0007Ja-KY
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:10:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTb7-0007nJ-Gu
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:10:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTb6-0002wb-Dy
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:10:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61FB02E813C
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:10:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:03:56 -0000
From: Thomas Huth <1905037@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: sparc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mortymacs th-huth
X-Launchpad-Bug-Reporter: Morteza NourelahiAlamdari (mortymacs)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160587983200.17610.17410311313341547679.malonedeb@gac.canonical.com>
Message-Id: <160596743627.19089.472480602817008861.malone@gac.canonical.com>
Subject: [Bug 1905037] Re: Qemu SPARC64 Panics on Sun Solaris 5.8 - BOP_ALLOC
 failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: de8a56c5357e55e30a8e8b78062c95a506836132
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
Reply-To: Bug 1905037 <1905037@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1905037

Title:
  Qemu SPARC64 Panics on Sun Solaris 5.8 -  BOP_ALLOC failed

Status in QEMU:
  New

Bug description:
  Hi,

  Running Sun Solaris 5.8 by SPARC64, will panic by "BOP_ALLOC failed":

  $ qemu-system-sparc64 \
    -drive file=3Dsparc.qcow2,if=3Dide,bus=3D0,unit=3D0 \
    -drive file=3Dsun5.8.no1.iso,format=3Draw,if=3Dide,bus=3D1,unit=3D0,med=
ia=3Dcdrom,readonly=3Don \
    -boot d
  $ qemu-system-sparc64 -M sun4u -boot d -cdrom sun5.8.no1.iso -net nic -ne=
t user -m 2048

  Both commands will raise this error:

  OpenBIOS for Sparc64
  Configuration device id QEMU version 1 machine id 0
  kernel cmdline =

  CPUs: 1 x SUNW,UltraSPARC-IIi
  UUID: 00000000-0000-0000-0000-000000000000
  Welcome to OpenBIOS v1.1 built on Oct 28 2019 17:08
    Type 'help' for detailed information
  Trying cdrom:f...
  Not a bootable ELF image
  Not a bootable a.out image

  Loading FCode image...
  Loaded 5936 bytes
  entry point is 0x4000
  Evaluating FCode...
  open isn't unique.
  Alloc of 0x2000 bytes at 0x16000 refused.

  panic[cpu0]/thread=3D10408000: BOP_ALLOC failed

  0000000010406ea0 unix:boot_alloc+44 (2000, 2000, 1000, 30000016000, 31002=
afd100, 30000014000)
    %l0-3: 000000001041b2d0 0000030ffffff138 0000000000000001 000000001044b=
dc0
    %l4-7: 000000001044af18 000000001044aef8 000000001044bd20 0000000000000=
00b
  0000000010406f50 unix:segkmem_alloc+30 (30000016000, 2000, 0, 0, 1044efe0=
, 1044b300)
    %l0-3: 0000030ffffff5c0 ffffffffffffe000 0000000000000000 000000001044b=
dc0
    %l4-7: 000000001044af18 000000001044aef8 000000001044f840 000000001004a=
438
  0000000010407010 genunix:vmem_xalloc+3e4 (1044ea18, 1044ee20, fffffffffff=
fffff, ffffffffffffffff, 0, 0)
    %l0-3: 000000001004a3b4 ffffffffffffe000 000000001044ea18 0000000000002=
000
    %l4-7: 0000000000000000 0000000000000000 0000000000002000 000000001044e=
a38
  0000000010407140 genunix:kmem_slab_create+8c (0, 0, 2000, 300000043c0, 0,=
 1044ea18)
    %l0-3: 0000000000000000 0000030ffffff220 0000000000000000 000000001044b=
dc0
    %l4-7: 000000001044af18 00000300000043c0 000000001044f840 0000000000007=
fa3
  0000000010407230 genunix:kmem_cache_alloc+180 (0, 0, 0, 300000043c0, 0, 0)
    %l0-3: 0000030000004740 ffffffffffffe000 000000001044ea18 0000000000002=
000
    %l4-7: 0000030ffffff220 0000000000000000 0000000000002000 000000001044e=
a38
  00000000104072e0 genunix:kmem_slab_create+130 (200, 30000014000, 2000, 30=
00000da40, 0, 200)
    %l0-3: 0000000000000000 ffffffffffffe000 000000001044ea18 0000000000002=
000
    %l4-7: 0000030fffffef68 000003000000da40 0000000000002000 000000001044e=
a38
  00000000104073d0 genunix:kmem_cache_alloc+180 (0, 0, 0, 3000000da40, 0, 0)
    %l0-3: 000003000000ddc0 0000000000000000 0000000000010000 fffffffffffff=
fff
    %l4-7: 0000030000013fc8 00000300000052c0 0000030000013fc8 0000030000013=
fc0
  0000000010407480 genunix:kmem_alloc+2c (2000, 0, 2000, 3000000da40, 0, 30=
000013fb8)
    %l0-3: 0000030000005640 0000000010147bfa 0000000000000000 0000000000000=
020
    %l4-7: 0000000010446678 0000000010452543 0000000000000000 0000000000000=
000
  0000000010407530 krtld:kobj_zalloc+c (2000, 1000, 2000, 300000052c0, f0, =
0)
    %l0-3: 000003000000e740 ffffffffffffffc0 000000001044f8e0 0000000000000=
3c0
    %l4-7: 000000001044aa70 0000000000000000 0000000000000000 0000000000000=
00b
  00000000104075e0 krtld:kobj_open_file+38 (2000, 30000011f88, 104397f0, 0,=
 0, 1)
    %l0-3: 0000000000000008 0000000000000000 0000000000000000 0000000000000=
000
    %l4-7: 0000000000000008 000000001004a3b4 0000000010452538 000000001004a=
438
  0000000010407690 genunix:mod_read_system_file+70 (10437c00, 2000, 1, 0, 2=
6, 1043a0d8)
    %l0-3: 0000000000004000 0000000000000008 0000000000004008 0000000000000=
000
    %l4-7: 0000000000002000 000000001004a3b4 0000000010451670 000000001004a=
438
  00000000104077b0 genunix:kmem_init+1b8 (10471b50, 0, 0, 91, 1, 291)
    %l0-3: 000000001041dc00 0000000000002000 000000001004a3b4 000000001004a=
438
    %l4-7: 0000000010418590 0000000000001fff 000000001040d970 0000000000007=
fa3
  0000000010407880 unix:startup_memlist+b14 (10418400, 30000016080, 3000000=
0000, 10418668, 2000, 30000016000)
    %l0-3: 0000000000000103 0000000010423c00 0000000000000020 0000031002c00=
000
    %l4-7: 0000000010418400 000000001041d000 000000001041c000 000000001041b=
000
  0000000010407970 unix:startup+c (10428c00, 0, 0, 1, 0, ffffffffffffffff)
    %l0-3: 0000000010026090 000000000000d925 0000000000000afd 0000000000000=
000
    %l4-7: 0000000010472880 00000000002e8c43 00000000000beafd 0000000000000=
afd
  0000000010407a20 genunix:main+4 (1040d400, 2000, 10407ec0, 10408030, fff2=
, 10052a0c)
    %l0-3: 0000000010408000 0000000000000001 0000000000000015 0000000000000=
f36
    %l4-7: 0000000010429618 0000000010472880 00000000000d7438 0000000000000=
540

  skipping system dump - no dump device configured
  rebooting...
  BOOTpanic - kernel: prom_reboot: reboot call returned!
  EXIT

  I'm not sure, but I think changes in this issue
  https://bugs.launchpad.net/qemu/+bug/1892540 might fix this one as
  well.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905037/+subscriptions

