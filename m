Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D073F9835
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:42:26 +0200 (CEST)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZJZ-0006OZ-Nv
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mJZIK-0005i7-H1
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:41:08 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:52870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mJZIG-00064Q-Gd
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:41:08 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id DDA923F8D8
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1630060857;
 bh=zAbPDWVUTqNIRzyxlElMzPi73DUEla4ACFnTnCphiC8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=VT8VQeBZAnwwrvKjS0g/JTztgGT1m/9RCkH4jF9mxBvenllXkl0+OIhBP3G+gtPWF
 C5ByjzXkyOh5PnI9VAC+EuKxC+HuMpc+6cLrSlBmoFmtU5cB8phkM3M8JzcUL/CFop
 o5c49CE4+Z5m+yH39eK7hGpCOscNI2lB4is+1x4K8LTrgsBxc8lSYVDfdvfchLvga8
 wq6V+pLq9Bls6h4MUGJZv/S4Z1SWc/J6qCj8pt2mXRa3a+4gGJ4sP3zDrFWyPZdZ10
 2zeo7u3ru6DUlD7EmuTDF813joTfUsJt4e7pNY9gpWpKM2g0TUFXUL+HsL2KwCh62F
 2Dm5YBDmFNP8Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C55592E813C
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 10:40:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Aug 2021 10:31:13 -0000
From: Thomas Huth <1921635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: scsi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hp janitor mark-cave-ayland th-huth
X-Launchpad-Bug-Reporter: Hein-PietervanBraam (hp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161695258717.25953.1383463253951082358.malonedeb@wampee.canonical.com>
Message-Id: <163006027399.3604.16895586299167462662.malone@gac.canonical.com>
Subject: [Bug 1921635] Re: ESP SCSI adapter not working with DOS ASPI drivers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="08c9dc00d1db3281cc70ee75454731854744f1ff"; Instance="production"
X-Launchpad-Hash: 645267f5ef885d149b3eba8ad7e1ba40c92766ca
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/569


** Tags added: scsi

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #569
   https://gitlab.com/qemu-project/qemu/-/issues/569

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921635

Title:
  ESP SCSI adapter not working with DOS ASPI drivers

Status in QEMU:
  Expired

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


