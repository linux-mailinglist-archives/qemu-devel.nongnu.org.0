Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53813C7D8C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:29:06 +0200 (CEST)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WW9-0006AX-Jn
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUc-00048a-Qf
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:51798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUZ-0003jX-G2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUU-00070V-8O
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 25F2E2E8509
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1921444@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson janitor th-huth xudong-hao
X-Launchpad-Bug-Reporter: xudong (xudong-hao)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161672454991.709.14499115006742419165.malonedeb@soybean.canonical.com>
Message-Id: <162623624440.32682.1672491252220601183.malone@loganberry.canonical.com>
Subject: [Bug 1921444] Re: Q35 doesn't support to hot add the 2nd PCIe device
 to KVM guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: 175cd3f356a83906b831d82d581c4ac88c6f3064
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1921444 <1921444@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921444

Title:
  Q35 doesn't support to hot add the 2nd PCIe device to KVM guest

Status in QEMU:
  Expired

Bug description:
  KVM: https://git.kernel.org/pub/scm/virt/kvm/kvm.git  branch: next, commi=
t: 4a98623d
  Qemu: https://git.qemu.org/git/qemu.git  branch: master, commit: 9e2e9fe3

  Created a KVM guest with Q35 chipset, and try to hot add 2 PCIe device
  to guest with qemu internal command device_add, the 1st device can be
  added successfully, but the 2nd device failed to hot add.

  If guest chipset is legacy i440fx, the 2 device can be added
  successfully.

  1. Enable VT-d in BIOS
  2. load KVM modules in Linux OS: modprobe kvm; modprobe kvm_intel
  3. Bind 2 device to vfio-pci
      echo 0000:b1:00.0 > /sys/bus/pci/drivers/i40e/unbind
      echo "8086 1572" > /sys/bus/pci/drivers/vfio-pci/new_id=20
      echo 0000:b1:00.1 > /sys/bus/pci/drivers/i40e/unbind
      echo "8086 1572" > /sys/bus/pci/drivers/vfio-pci/new_id=20

  4. create guest with Q35 chipset:
  qemu-system-x86_64 --accel kvm -m 4096 -smp 4 -drive file=3D/home/rhel8.2=
.qcow2,if=3Dnone,id=3Dvirtio-disk0 -device virtio-blk-pci,drive=3Dvirtio-di=
sk0 -cpu host -machine q35 -device pcie-root-port,id=3Droot1 -daemonize

  5. hot add the 1st device to guest successfully
  in guest qemu monitor "device_add vfio-pci,host=3Db1:00.0,id=3Dnic0,bus=
=3Droot1"
  6. hot add the 2nd device to guest
  in guest qemu monitor "device_add vfio-pci,host=3Db1:00.1,id=3Dnic1,bus=
=3Droot1"
  The 2nd device doesn't be added in guest, and the 1st device is removed f=
rom guest.=20

  Guest partial log:
  [  110.452272] pcieport 0000:00:04.0: pciehp: Slot(0): Attention button p=
ressed
  [  110.453314] pcieport 0000:00:04.0: pciehp: Slot(0) Powering on due to =
button press
  [  110.454156] pcieport 0000:00:04.0: pciehp: Slot(0): Card present
  [  110.454792] pcieport 0000:00:04.0: pciehp: Slot(0): Link Up
  [  110.580927] pci 0000:01:00.0: [8086:1572] type 00 class 0x020000
  [  110.582560] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x007fffff 64b=
it pref]
  [  110.583453] pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x00007fff 64b=
it pref]
  [  110.584278] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pre=
f]
  [  110.585051] pci 0000:01:00.0: Max Payload Size set to 128 (was 512, ma=
x 2048)
  [  110.586621] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
  [  110.588140] pci 0000:01:00.0: BAR 0: no space for [mem size 0x00800000=
 64bit pref]
  [  110.588954] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x0080=
0000 64bit pref]
  [  110.589797] pci 0000:01:00.0: BAR 6: assigned [mem 0xfe800000-0xfe87ff=
ff pref]
  [  110.590703] pci 0000:01:00.0: BAR 3: assigned [mem 0xfe000000-0xfe007f=
ff 64bit pref]
  [  110.592085] pcieport 0000:00:04.0: PCI bridge to [bus 01]
  [  110.592755] pcieport 0000:00:04.0:   bridge window [io  0x1000-0x1fff]
  [  110.594403] pcieport 0000:00:04.0:   bridge window [mem 0xfe800000-0xf=
e9fffff]
  [  110.595847] pcieport 0000:00:04.0:   bridge window [mem 0xfe000000-0xf=
e1fffff 64bit pref]
  [  110.597867] PCI: No. 2 try to assign unassigned res
  [  110.597870] release child resource [mem 0xfe000000-0xfe007fff 64bit pr=
ef]
  [  110.597871] pcieport 0000:00:04.0: resource 15 [mem 0xfe000000-0xfe1ff=
fff 64bit pref] released
  [  110.598881] pcieport 0000:00:04.0: PCI bridge to [bus 01]
  [  110.600789] pcieport 0000:00:04.0: BAR 15: assigned [mem 0x180000000-0=
x180bfffff 64bit pref]
  [  110.601731] pci 0000:01:00.0: BAR 0: assigned [mem 0x180000000-0x1807f=
ffff 64bit pref]
  [  110.602849] pci 0000:01:00.0: BAR 3: assigned [mem 0x180800000-0x18080=
7fff 64bit pref]
  [  110.604069] pcieport 0000:00:04.0: PCI bridge to [bus 01]
  [  110.604941] pcieport 0000:00:04.0:   bridge window [io  0x1000-0x1fff]
  [  110.606237] pcieport 0000:00:04.0:   bridge window [mem 0xfe800000-0xf=
e9fffff]
  [  110.607401] pcieport 0000:00:04.0:   bridge window [mem 0x180000000-0x=
180bfffff 64bit pref]
  [  110.653661] i40e: Intel(R) Ethernet Connection XL710 Network Driver
  [  110.654443] i40e: Copyright (c) 2013 - 2019 Intel Corporation.
  [  110.655314] i40e 0000:01:00.0: enabling device (0140 -> 0142)
  [  110.672396] i40e 0000:01:00.0: fw 6.0.48442 api 1.7 nvm 6.01 0x800035b=
1 1.1747.0 [8086:1572] [8086:0008]
  [  110.750054] i40e 0000:01:00.0: MAC address: 3c:fd:fe:c0:59:98
  [  110.751792] i40e 0000:01:00.0: FW LLDP is enabled
  [  110.764644] i40e 0000:01:00.0 eth1: NIC Link is Up, 10 Gbps Full Duple=
x, Flow Control: None
  [  110.779390] i40e 0000:01:00.0: PCI-Express: Speed 8.0GT/s Width x8
  [  110.789841] i40e 0000:01:00.0: Features: PF-id[0] VFs: 64 VSIs: 66 QP:=
 4 RSS FD_ATR FD_SB NTUPLE DCB VxLAN Geneve PTP VEPA
  [  111.817553] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
  [  205.130288] pcieport 0000:00:04.0: pciehp: Slot(0): Attention button p=
ressed
  [  205.131743] pcieport 0000:00:04.0: pciehp: Slot(0): Powering off due t=
o button press
  [  205.133233] pcieport 0000:00:04.0: pciehp: Slot(0): Card not present
  [  205.135728] i40e 0000:01:00.0: i40e_ptp_stop: removed PHC on eth1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921444/+subscriptions


