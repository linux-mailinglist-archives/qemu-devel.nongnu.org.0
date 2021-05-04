Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623D372600
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:55:18 +0200 (CEST)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoxh-0002cD-5V
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo5m-0002wZ-Ti
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:59:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:49594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldo5i-0007xc-PA
 for qemu-devel@nongnu.org; Tue, 04 May 2021 01:59:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldo5h-0002s8-Kr
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:59:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 909302E8188
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 05:59:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 05:45:35 -0000
From: Thomas Huth <1471904@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 th-huth uwe-lienig
X-Launchpad-Bug-Reporter: Uwe Lienig (uwe-lienig)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150706172738.3886.69660.malonedeb@wampee.canonical.com>
Message-Id: <162010713578.9706.9858675175027912564.malone@gac.canonical.com>
Subject: [Bug 1471904] Re: qemu fails under NeXTStep 3.3 when accessing ROM in
 SCSI-Adapter am53c974
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d4bdfe16f857820d2a73dc5db5759b6c670d74aa
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
Reply-To: Bug 1471904 <1471904@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/116


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #116
   https://gitlab.com/qemu-project/qemu/-/issues/116

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1471904

Title:
  qemu fails under NeXTStep 3.3 when accessing ROM in SCSI-Adapter
  am53c974

Status in QEMU:
  Expired

Bug description:
  I try to do a fresh install of NeXTStep 3.3 on qemu. After all install
  floppies are successfully read in, the installation shall start, but
  aborts right away. During installation process the SCSI host adapter
  is correctly detected. I don't know, if these adapter where equipped
  with some special ROM. I thought of installing NeXTStep on a SCSI
  system due to the IDE problems already known under #1276879. If
  necessary I would use gdb to track more into this.

  System info:
  Linux prerow 3.11.10-29-desktop #1 SMP PREEMPT Thu Mar 5 16:24:00 UTC 201=
5 (338c513) x86_64 x86_64 x86_64 GNU/Linux
  NAME=3DopenSUSE
  VERSION=3D"13.1 (Bottle)"
  VERSION_ID=3D"13.1"
  PRETTY_NAME=3D"openSUSE 13.1 (Bottle) (x86_64)"

  qemu commandline parameter:
  /usr/bin/qemu-system-i386 \
      -cpu pentium \
      -monitor stdio \
      -k de \
      -vga cirrus \
      -m 128 \
      -localtime \
      -drive \
           file=3D.qemu/floppy/3.3_Boot_Disk.floppyimage,format=3Draw,if=3D=
floppy,index=3D0 \
       -drive \
           file=3D.qemu/disk/scsihd-2G.qcow2,format=3Dqcow2,id=3Dscsihd0,if=
=3Dnone \
       -drive \
           file=3D.qemu/cdrom/3.3_InstallCD-NeXTIntel.cdromimage,format=3Dr=
aw,id=3Dscsicd0,if=3Dnone \
       -net \
           none \
       -device \
           am53c974,id=3DAMD0 \
       -device \
           scsi-cd,drive=3Dscsicd0,bus=3DAMD0.0,lun=3D0,scsi-id=3D1,physica=
l_block_size=3D512,logical_block_size=3D512 \
       -device \
           scsi-hd,drive=3Dscsihd0,bus=3DAMD0.0,lun=3D0,scsi-id=3D0,removab=
le=3Doff,secs=3D125,heads=3D8,cyls=3D4176,product=3D"ST32151N        ",vend=
or=3D"Seagate ",serial=3D"89683587",ver=3D"2356",physical_block_size=3D512,=
logical_block_size=3D512,dpofua=3Doff

  qemu error message:
  qemu: fatal: Trying to execute code outside RAM or ROM at 0xc01754a8

  EAX=3D000000ff EBX=3D0000fffb ECX=3D000000ff EDX=3D000000a1
  ESI=3D00000009 EDI=3D00011010 EBP=3D0000ff84 ESP=3D0000ff6c
  EIP=3D001754a8 EFL=3D00000007 [-----PC] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HL=
T=3D0
  ES =3D0050 00000000 bfffffff 00cb9300 DPL=3D0 DS   [-WA]
  CS =3D0008 c0000000 3fffffff 00c39a00 DPL=3D0 CS32 [-R-]
  SS =3D0050 00000000 bfffffff 00cb9300 DPL=3D0 DS   [-WA]
  DS =3D0050 00000000 bfffffff 00cb9300 DPL=3D0 DS   [-WA]
  FS =3D0050 00000000 bfffffff 00cb9300 DPL=3D0 DS   [-WA]
  GS =3D0050 00000000 bfffffff 00cb9300 DPL=3D0 DS   [-WA]
  LDT=3D0000 00000000 0000ffff 00008200 DPL=3D0 LDT
  TR =3D0000 00000000 0000ffff 00008b00 DPL=3D0 TSS32-busy
  GDT=3D     001c9a58 000000ff
  IDT=3D     001c9bac 000007ff
  CR0=3D00000033 CR2=3D00000000 CR3=3D00000000 CR4=3D00000000              =
                                                                       =

  DR0=3D00000000 DR1=3D00000000 DR2=3D00000000 DR3=3D00000000              =
                                                                       =

  DR6=3Dffff0ff0 DR7=3D00000400                                            =
                                                                   =

  CCS=3D00000001 CCD=3D0000000c CCO=3DINCL    =

  EFER=3D0000000000000000
  FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
  FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
  FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
  FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
  FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
  XMM00=3D00000000000000000000000000000000 XMM01=3D000000000000000000000000=
00000000
  XMM02=3D00000000000000000000000000000000 XMM03=3D000000000000000000000000=
00000000
  XMM04=3D00000000000000000000000000000000 XMM05=3D000000000000000000000000=
00000000
  XMM06=3D00000000000000000000000000000000 XMM07=3D000000000000000000000000=
00000000

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1471904/+subscriptions

