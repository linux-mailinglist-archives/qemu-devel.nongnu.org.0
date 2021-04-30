Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A475536FF6B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:23:12 +0200 (CEST)
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWr9-0001Bu-Md
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWUb-0007iv-PF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:59:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:50276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWUU-0002DH-Bq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:59:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcWUR-0007LF-JL
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 16:59:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 903402E8144
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 16:59:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 16:45:52 -0000
From: Thomas Huth <1622582@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: q35 sata windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 4o-ubrgtu-59 jnsnow luoyonggang th-huth
X-Launchpad-Bug-Reporter: Dennis (4o-ubrgtu-59)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160912115104.2358.5193.malonedeb@wampee.canonical.com>
Message-Id: <161980115230.9976.5175762961576626648.malone@gac.canonical.com>
Subject: [Bug 1622582] Re: Can't install Windows 7 with q35 (SATA)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 7409097de555a0f2c7586d4e7851e590750787d3
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
Reply-To: Bug 1622582 <1622582@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/55


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #55
   https://gitlab.com/qemu-project/qemu/-/issues/55

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1622582

Title:
  Can't install Windows 7 with q35 (SATA)

Status in QEMU:
  Expired

Bug description:
  I'm trying to install Windows 7 on a q35 machine on a "SATA disk". If
  I use q35 the installation is extremely slow. With extremely slow I
  mean, that the first few minutes (10-15 minutes) on the second
  installation step (copying files to disk) nothing happens. Than there
  is some progress, maybe until 9% and than there is "silence" for
  another 10 minutes or so. Therefore I used iotop (with --only option)
  in order to see, if there are any disk operations. But as I mentioned,
  only a few times qemu writes something to disk (with about < 1M/s).
  But most of the time there is nothing from qemu. Therefore the
  installation lasts over an hour. But even worse, after installation I
  can't boot Windows. Windows-Start-Manager tells me, that windows
  couldn't be loaded because the kernel is missing or corrupt (Status
  0xc0000221, File: \Windows\system32\ntoskrnl.exe). If I use IDE on q35
  or pc-i440fx-2.6 everything works fine. There is a continuous
  installation progress and iotop shows continuous disk writes with max
  30M/s (but also 5M/s and other values...).

  I've tried qemu 2.6.0, 2.6.1 and 2.7.0 (all versions from git).

  My host machine: =

  Ubuntu 14.04.5 LTS
  3.13.0-95-generic #142-Ubuntu SMP Fri Aug 12 17:00:09 UTC 2016 x86_64 x86=
_64 x86_64 GNU/Linux
  Intel(R) Core(TM) i5-3470 CPU
  16 GB RAM

  =

  I used the following commands:

  "Standard" command
  qemu-system-x86_64 -m 2048 -machine q35,accel=3Dkvm -cpu host,kvm=3Doff -=
smp 1,sockets=3D1,cores=3D1,threads=3D1 -enable-kvm -hda win7_qemu_standard=
_q35.qcow2 -cdrom win7proX64.iso -boot order=3Dd

  I think by using -hda sata will be used?!?

  With explicit ahci:
  qemu-system-x86_64 -m 2048 -machine q35,accel=3Dkvm -cpu host,kvm=3Doff -=
smp 1,sockets=3D1,cores=3D1,threads=3D1 -enable-kvm -drive file=3Dwin7_qemu=
_standard_q35.qcow2,media=3Ddisk,if=3Dnone,id=3Dsata-disk -device ich9-ahci=
,id=3Dahci -device ide-drive,drive=3Dsata-disk,bus=3Dahci.0 -drive file=3Dw=
in7proX64.iso,media=3Dcdrom,if=3Dnone,id=3Dsata-cdrom -device ide-cd,drive=
=3Dsata-cdrom,bus=3Dahci.1 -boot order=3Dd

  I don't know if this is totally correct, because it's a little bit
  weird that I have to use ide-drive on a ich9 bus.

  Without kvm there is a continious disk write with 100 K/s - 5 M/s (works =
only with qemu 2.7.0, otherwise I get a 0x000000D1 bluescreen on the setup =
start screen):
  qemu-system-x86_64 -m 2048 -machine q35 -cpu IvyBridge -hda win7_qemu_sta=
ndard_q35.qcow2 -cdrom win7proX64.iso -boot order=3Dd

  But with all three commands the installed Windows is not working,
  because always the same error occurs: windows couldn't be loaded
  because kernel is missing or corrupt

  Interestingly both commands ("standard" command and with explicit
  ahci) works very well with a Windows 10 installation.

  In my opinion it's a "SATA problem", because if I use e.g. piix4-ide inst=
ead of ich9-ahci it works:
  qemu-system-x86_64 -m 2048 -machine q35,accel=3Dkvm -cpu host,kvm=3Doff -=
smp 1,sockets=3D1,cores=3D1,threads=3D1 -enable-kvm -drive file=3Dwin7_qemu=
_standard_q35.qcow2,media=3Ddisk,if=3Dnone,id=3Dide-disk -device piix4-ide,=
id=3Dide -device ide-drive,drive=3Dide-disk,bus=3Dide.0 -drive file=3Dwin7p=
roX64.iso,media=3Dcdrom,if=3Dnone,id=3Dide-cdrom -device ide-cd,drive=3Dide=
-cdrom,bus=3Dide.1 -boot order=3Dd

  With this command there is a continuous disk write and the
  installation is bootable.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1622582/+subscriptions

