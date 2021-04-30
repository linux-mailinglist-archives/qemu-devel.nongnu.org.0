Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291336F662
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:27:46 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNYv-0007MI-Ba
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcNX3-0005nB-9X
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:25:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:58648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcNX0-00082x-Vj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:25:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcNWz-0008JR-Dk
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 660522E8144
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 07:18:20 -0000
From: Thomas Huth <1813201@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aortega halfdog pmaydell th-huth
X-Launchpad-Bug-Reporter: Alberto Ortega (aortega)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154835963658.2045.2300981728946163161.malonedeb@wampee.canonical.com>
Message-Id: <161976710179.10390.3956641288661289270.launchpad@gac.canonical.com>
Subject: [Bug 1813201] Re: QEMU TCG i386 / x86_64 system emulation crash when
 executing int instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 18deb603b39064d484664b2b5b426ac670c77807
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
Reply-To: Bug 1813201 <1813201@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813201

Title:
  QEMU TCG i386 / x86_64 system emulation crash when executing int
  instruction

Status in QEMU:
  Fix Released

Bug description:
  QEMU version:
  -------------

  qemu from git, master branch commit
  d058a37a6e8daa8d71a6f2b613eb415b69363755

  Release versions are also affected.

  Summary:
  --------

  QEMU i386 and x86_64 system emulation crash when executing the
  following "int" instruction:

  cd08  int 8

  This generates a kernel NULL pointer dereference error in Linux, and a
  BSOD error in Windows.

  No special permissions are required to execute the instruction, any
  unprivileged user can execute it.

  This issue has been reproduced in QEMU running in TCG mode. KVM is not
  affected.

  Kernel panic log:

  [  111.091138] BUG: unable to handle kernel NULL pointer dereference at 0=
0000014
  [  111.092145] IP: [<ce0513ad>] doublefault_fn+0xd/0x130
  [  111.092145] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 [  11=
1.092145] =

  [  111.092145] Oops: 0000 [#1] SMP
  [  111.092145] Modules linked in: kvm_amd bochs_drm ppdev ttm drm_kms_hel=
per drm kvm irqbypass evdev pcspkr serio_raw sg parport_pc parport button i=
p_tables x_tables autofs4 ext4 crc16 jbd2 crc32c_generic fscrypto ecb xts l=
rw gf128mul ablk_helper cryptd aes_i586 mbcache sr_mod sd_mod cdrom ata_gen=
eric ata_piix libata psmouse e1000 scsi_mod i2c_piix4 floppy
  [  111.092145] CPU: 0 PID: 409 Comm: int8.elf Not tainted 4.9.0-8-686-pae=
 #1 Debian 4.9.130-2
  [  111.092145] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.12.0-0-ga698c8995f-prebuilt.qemu.org 04/01/2014
  [  111.092145] task: f6c88a80 task.stack: f6e52000
  [  111.092145] EIP: 0060:[<ce0513ad>] EFLAGS: 00004086 CPU: 0
  [  111.092145] EIP is at doublefault_fn+0xd/0x130
  [  111.092145] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
  [  111.092145] ESI: 00000000 EDI: 00000000 EBP: ce8f13fc ESP: ce8f13d4
  [  111.092145]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
  [  111.092145] CR0: 8005003b CR2: 00000014 CR3: 0e8e1000 CR4: 000006f0
  [  111.092145] Stack:
  [  111.092145]  00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000
  [  111.092145]  00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000
  [  111.092145]  00000000 00000000 00000000 00000000 fed00000 ce474ad0 000=
00000 00017d78
  [  111.092145] Call Trace:
  [  111.092145] Code: 86 fd ff eb a3 89 f6 8d bc 27 00 00 00 00 55 89 e5 3=
e 8d 74 26 00 5d e9 e2 79 fd ff 66 90 55 89 e5 56 53 83 ec 20 3e 8d 74 26 0=
0 <65> a1 14 00 00 00 89 45 f4 31 c0 31 c0 c7 45 f0 00 00 00 00 66
  [  111.092145] EIP: [<ce0513ad>] [  111.092145] doublefault_fn+0xd/0x130
  [  111.092145]  SS:ESP 0068:ce8f13d4
  [  111.092145] CR2: 0000000000000014
  [  111.092145] ---[ end trace 8afa7884b76cafc1 ]---

  Testcase:
  ---------

  void main() {
          asm("int $0x8");
  }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813201/+subscriptions

