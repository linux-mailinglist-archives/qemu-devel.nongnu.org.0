Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F6365414
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:28:49 +0200 (CEST)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlkW-0006GZ-9U
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlio-0004jZ-UZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:58920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlim-0002Zf-O9
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlik-000281-2c
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F1F62E8196
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:17:19 -0000
From: Thomas Huth <1814343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fintelia th-huth
X-Launchpad-Bug-Reporter: Jonathan Behrens (fintelia)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154905879413.25667.2843143192142684785.malonedeb@chaenomeles.canonical.com>
Message-Id: <161890663913.10316.11233402937462725259.malone@chaenomeles.canonical.com>
Subject: [Bug 1814343] Re: Initrd not loaded on riscv32
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 2802bae1ee68f03242722edbe872acb2ba6f7d64
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
Reply-To: Bug 1814343 <1814343@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

** Tags added: riscv

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1814343

Title:
  Initrd not loaded on riscv32

Status in QEMU:
  Incomplete

Bug description:
  I attempted to run qemu with a ram disk. However, when reading the
  contents of the disk from within the VM I only get back zeros.

  I was able to trace the issue to a mismatch of expectations on line 93
  of hw/riscv/virt.c. Specifically, when running in 32-bit mode the
  value of kernel_entry is sign extended to 64-bits, but
  load_image_targphys expects the start address to not be sign extended.

  Straw man patch (works for 32-bit but would probably break 64-bit
  VMs?):

  diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
  index e7f0716fb6..32216f993c 100644
  --- a/hw/riscv/virt.c
  +++ b/hw/riscv/virt.c
  @@ -90,7 +90,7 @@ static hwaddr load_initrd(const char *filename, uint64_=
t mem_size,
        * halfway into RAM, and for boards with 256MB of RAM or more we put
        * the initrd at 128MB.
        */
  -    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
  +    *start =3D (kernel_entry & 0xffffffff) + MIN(mem_size / 2, 128 * MiB=
);
   =

       size =3D load_ramdisk(filename, *start, mem_size - *start);
       if (size =3D=3D -1) {

  =

  Run command:

  $ qemu/build/riscv32-softmmu/qemu-system-riscv32 -machine virt -kernel
  mykernel.elf -nographic -initrd payload

  Commit hash:

  3a183e330dbd7dbcac3841737ac874979552cca2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1814343/+subscriptions

