Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699E538D7A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:08:47 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxrq-00059u-Ck
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nvxaU-0005u3-4c
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:50:50 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:56422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nvxaR-0001zD-TR
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:50:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id B2C073FC6B
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1653987044;
 bh=+ljjaxjFTIRACKOpvVK0JVvAZDLoeDa7LIZcbEzbQ/A=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=bS75QclWlYQ3QKJbrYw2kHLH+kHIIstC2MIeIq/WUb1WlMMoxpUcdQmyBWeRYVa3v
 9yDz7dc+fE5gbJ6BdlX1OtdWhv0xmGKxiszou95rY6LjhJsmZPIpRYZWD61NV9NLaj
 gOyt0g1U7uiYti7ExPhCpy2oUjez5ssxOLpAgOkSp+GIiw03QcEcDtGThI3IIg4ev+
 5AJhAEz4rg3ElNcoI8KgeWPGJiL1Tqetn91sLNjNjWNDJJo47RRlga49A9enJvMDS3
 vQiofIHp4fE5wScwbWvPJfjAaYCADb3RflS7+WMSlXruKXi6PE+YRHem5P/jO8Nx7p
 odWr0NMAORm6Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B216B2E81BB
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 08:50:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 May 2022 08:42:17 -0000
From: Michael Tokarev <1860759@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake ildar-users mjt+launchpad-tls xanclic
X-Launchpad-Bug-Reporter: Ildar (ildar-users)
X-Launchpad-Bug-Modifier: Michael Tokarev (mjt+launchpad-tls)
References: <157985376657.5102.13233182944615356318.malonedeb@wampee.canonical.com>
Message-Id: <165398653715.37427.14277617495849491832.malone@dale.canonical.com>
Subject: [Bug 1860759] Re: [REGRESSION] option `-snapshot` ignored with
 blockdev
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="51cf72494ced5c2d372e663bbaf9b6b53bc5505c"; Instance="production"
X-Launchpad-Hash: 6ea0470a3eb00f9418f3bfde319af855c9078f51
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1860759 <1860759@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Internal implementation details aside, from the user PoV it is a *very*
serious issue. If -snapshot can't be applied automatically, maybe qemu
should warn or better fail if -snapshot is used together with -blockdev.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860759

Title:
  [REGRESSION] option `-snapshot` ignored with blockdev

Status in QEMU:
  Invalid

Bug description:
  After upgrade of qemu 3.1.0 =E2=86=92 4.2.0 I found that running with lib=
virt doesn't honor `-snapshot` option anymore. I.e. disk images get modifie=
d.
  Using `-hda` option honors `-snapshot`

  So I made a test case without libvirt. Testcase using 4.2.0:

  > qemu -hda tmp-16G.img -cdrom regular-rescue-latest-x86_64.iso -m 2G

  This works fine and tmp-16G.img stays unmodified.

  But:
  > /usr/bin/qemu-system-x86_64 -name guest=3Dtest-linux,debug-threads=3Don=
 -S -machine pc-i440fx-3.1,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-co=
re=3Doff -cpu Broadwell-noTSX,vme=3Don,ss=3Don,f16c=3Don,rdrand=3Don,hyperv=
isor=3Don,arat=3Don,tsc-adjust=3Don,xsaveopt=3Don,pdpe1gb=3Don,abm=3Don -m =
2048 -overcommit mem-lock=3Doff -smp 3,sockets=3D3,cores=3D1,threads=3D1 -u=
uid d32a9191-f51d-4fae-a419-b73d85b49198 -no-user-config -nodefaults -rtc b=
ase=3Dutc,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-hpet=
 -no-shutdown -global PIIX4_PM.disable_s3=3D1 -global PIIX4_PM.disable_s4=
=3D1 -boot strict=3Don -device ich9-usb-ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0=
x5.0x7 -device ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpci.0,m=
ultifunction=3Don,addr=3D0x5 -device ich9-usb-uhci2,masterbus=3Dusb.0,first=
port=3D2,bus=3Dpci.0,addr=3D0x5.0x1 -device ich9-usb-uhci3,masterbus=3Dusb.=
0,firstport=3D4,bus=3Dpci.0,addr=3D0x5.0x2 -blockdev \{\"driver\":\"file\",=
\"filename\":\"/tmp/regular-rescue-latest-x86_64.iso\",\"node-name\":\"libv=
irt-2-storage\",\"auto-read-only\":true,\"discard\":\"unmap\"} -blockdev \{=
\"node-name\":\"libvirt-2-format\",\"read-only\":true,\"driver\":\"raw\",\"=
file\":\"libvirt-2-storage\"} -device ide-cd,bus=3Dide.0,unit=3D0,drive=3Dl=
ibvirt-2-format,id=3Dide0-0-0,bootindex=3D1 -blockdev \{\"driver\":\"file\"=
,\"filename\":\"/tmp/tmp-2G.img\",\"node-name\":\"libvirt-1-storage\",\"aut=
o-read-only\":true,\"discard\":\"unmap\"} -blockdev \{\"node-name\":\"libvi=
rt-1-format\",\"read-only\":false,\"driver\":\"qcow2\",\"file\":\"libvirt-1=
-storage\",\"backing\":null} -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,=
addr=3D0x7,drive=3Dlibvirt-1-format,id=3Dvirtio-disk0 -netdev user,id=3Dhos=
tnet0 -device e1000,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:ab:d8:29,bus=
=3Dpci.0,addr=3D0x3 -chardev pty,id=3Dcharserial0 -device isa-serial,charde=
v=3Dcharserial0,id=3Dserial0 -device qxl-vga,id=3Dvideo0,ram_size=3D6710886=
4,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bu=
s=3Dpci.0,addr=3D0x2 -device intel-hda,id=3Dsound0,bus=3Dpci.0,addr=3D0x4 -=
device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -device virtio-=
balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 -snapshot -sandbox on,obso=
lete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3Ddeny -m=
sg timestamp=3Don

  This modifies tmp-16G.img.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860759/+subscriptions


