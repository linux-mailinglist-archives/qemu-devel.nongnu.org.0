Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2269381051
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:12:44 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdEp-0000MT-N0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdDB-0006pJ-1E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:39858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdD8-00027x-4w
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:11:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdD5-0007el-Tg
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DF6892E8187
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:10:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:03:35 -0000
From: Thomas Huth <1921635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hp mark-cave-ayland th-huth
X-Launchpad-Bug-Reporter: Hein-PietervanBraam (hp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161695258717.25953.1383463253951082358.malonedeb@wampee.canonical.com>
Message-Id: <162101901599.8727.15444338275343038178.malone@gac.canonical.com>
Subject: [Bug 1921635] Re: ESP SCSI adapter not working with DOS ASPI drivers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 6a8f0c04fb83522fca353618cee4982e1ede92cc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1921635 <1921635@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921635

Title:
  ESP SCSI adapter not working with DOS ASPI drivers

Status in QEMU:
  Incomplete

Bug description:
  I have been trying to install the DOS ASPI drivers for the ESP scsi
  card. Both in am53c974 and dc390 modes. Neither works but they don't
  work in different ways.

  The following things appear to be problematic:

  * The am53c974 should work with the PcSCSI drivers (AMSIDA.SYS) but the A=
SPI driver never manages to get past initializing the card. The VM never co=
ntinues.
  * The dc390 ASPI driver fares a little better. The ASPI driver loads and =
is semi-functional but the drivers for the peripherals don't work.
   - ASPI.SYS (creative name) loads
   - TRMDISK.SYS fails to load when a cd-drive is attached and will crashs =
scanning the scsi-id where the cd drive is attached
   - TRMDISK.SYS loads without a CD drive attached but fails to read any sc=
si-hd devices attached. The TFDISK.EXE formatter crashes.
   - TRMCD.SYS loads, but can not detect any CD drives.

  The various permutations:
  am53c974 hang on ASPI driver load: (CD only attached)

  ~/src/qemu/build/qemu-system-i386 -m 64 -device am53c974,id=3Dscsi0
  -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=
=3D0
  -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddrive0 -=
vga
  cirrus -fda am53c974_aspi.img -bios /home/hp/src/seabios/out/bios.bin
  -boot a  -trace 'scsi*' -trace 'esp*' -D log

  dc390 crash because of CDROM attachment and loading TRMDISK.SYS (Only CD =
attached)
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0,rombar=
=3D0 -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,l=
un=3D0 -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddri=
ve0 -vga cirrus -fda dc390_all.img  -bios /home/hp/src/seabios/out/bios.bin=
 -boot a  -trace 'scsi*' -trace 'esp*' -D log

  dc390 successful boot, but TRMDISK.SYS not working (TFDISK.EXE will crash)
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0 -device =
scsi-hd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,logica=
l_block_size=3D512 -drive file=3Dsmall.qcow2,if=3Dnone,id=3Ddrive0 -vga cir=
rus -fda dc390_all.img -bios /home/hp/src/seabios/out/bios.bin -boot a  -tr=
ace 'scsi*' -trace 'esp*' -D log

  dc390 successful boot, TRMDISK.SYS not loaded, only TRMCD.SYS. CDROM not =
detected
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0,rombar=
=3D0 -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,l=
un=3D0 -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddri=
ve0 -vga cirrus -fda dc390_cd.img  -bios /home/hp/src/seabios/out/bios.bin =
-boot a  -trace 'scsi*' -trace 'esp*' -D log

  All of these tests were done on
  7b9a3c9f94bcac23c534bc9f42a9e914b433b299 as well as the 'esp-next'
  branch found here: https://github.com/mcayland/qemu/tree/esp-next

  The bios file is a seabios master with all int13 support disabled.
  With it enabled even less works but I figured this would be a seabios
  bug and not a qemu one.

  The actual iso and qcow2 files used don't appear the matter. the
  'small.qcow2' is an empty drive of 100MB. I have also tried other ISOs
  in the CD drives, or even not put any cd in the drives with the same
  results.

  I will attach all of the above images.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921635/+subscriptions

