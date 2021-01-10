Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE062F0523
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:36:43 +0100 (CET)
Received: from localhost ([::1]:49362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyST4-0006PJ-De
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySMu-0005jZ-Jr
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:41056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySMr-0002Xb-Hl
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:20 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySMq-0000xc-Cu
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D29A2E8135
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:27 -0000
From: Launchpad Bug Tracker <1615823@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kelvin-middleton markus-tisoft
 nelson-bigmouth th-huth
X-Launchpad-Bug-Reporter: Kelvin Middleton (kelvin-middleton)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160822203622.9253.10775.malonedeb@wampee.canonical.com>
Message-Id: <161025224775.18863.11156627323413175917.malone@loganberry.canonical.com>
Subject: [Bug 1615823] Re: Windows 10 reports no compatible TPM found yet
 device manager shows it?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 60d526256baf4c1ff63951d0965d30bc9126f72c
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
Reply-To: Bug 1615823 <1615823@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1615823

Title:
  Windows 10 reports no compatible TPM found yet device manager shows
  it?

Status in QEMU:
  Expired

Bug description:
  Ubuntu 16.04 with stock kvm, libvirt, ovmf
  Qemu 2.5 installed from stock ubuntu ppa
  Qemu 2.6.1 built from tarball.
  Qemu 2.7.0-rc4 built from tarball.

  Windows 10 guest reports a TPM device is installed and the driver
  functional under Device Manager-->Security Devices.  TPM Administrator
  however advises no compatible TPM chip can be found.

  Qemu 2.5 is buggy and prevents the guest loading the TPM driver, this
  was addressed by
  http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2b1c2e8e5f1990f0a201a8cb=
f9d366fca60f4aa8

  Have tested the below cmd out on both qemu-2.6.1 and qemu-2.7.0-rc4,
  both suffer the same problem.  My TPM is most certainly compatible as
  installing Win10Pro onto the same host as bare metal provides me the
  desired and expected functionality aka Bitlocker and TPM Administrator
  work.

  sudo ./qemu-system-x86_64 \
  -enable-kvm \
  -machine q35 \
  -cpu host \
  -m 4096 \
  -smp 4,sockets=3D1,cores=3D2,threads=3D2 \
  -device i82801b11-bridge,id=3Dpci.1,bus=3Dpcie.0,addr=3D0x1e \
  -device pci-bridge,chassis_nr=3D2,id=3Dpci.2,bus=3Dpci.1,addr=3D0x1 \
  -device qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vgam=
em_mb=3D16,bus=3Dpcie.0,addr=3D0x2 \
  -drive file=3D/usr/share/qemu/OVMF.fd,if=3Dpflash,format=3Draw,unit=3D0,r=
eadonly=3Don \
  -drive file=3D/mnt/120GB_SSD/wintpm_VARS.fd,if=3Dpflash,format=3Draw,unit=
=3D1 \
  -drive file=3D/mnt/120GB_SSD/wintpm.qcow2,format=3Dqcow2,if=3Dnone,id=3Dd=
rive-virtio-disk0 \
  -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.2,addr=3D0x3,drive=3Ddrive-vi=
rtio-disk0,id=3Dvirtio-disk0,bootindex=3D2 \
  -drive file=3D"/mnt/share/Filestorage/Images/Microsoft Windows 10 Pro x64=
.iso",format=3Draw,if=3Dnone,media=3Dcdrom,id=3Ddrive-sata0-0-0,readonly=3D=
on \
  -device ide-cd,bus=3Dide.0,drive=3Ddrive-sata0-0-0,id=3Dsata0-0-0 \
  -drive file=3D/mnt/share/Filestorage/Images/virtio-win-0.1.117.iso,format=
=3Draw,if=3Dnone,media=3Dcdrom,id=3Ddrive-sata0-0-1,readonly=3Don \
  -device ide-cd,bus=3Dide.1,drive=3Ddrive-sata0-0-1,id=3Dsata0-0-1 \
  -tpmdev passthrough,id=3Dtpm-tpm0,path=3D/dev/tpm0,cancel-path=3D/sys/cla=
ss/tpm/tpm0/device/cancel \
  -device tpm-tis,tpmdev=3Dtpm-tpm0,id=3Dtpm0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1615823/+subscriptions

