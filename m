Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A152F3AFC18
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:39:41 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYCK-0003oZ-Kz
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzT-0006XU-QY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:55826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzQ-0004sn-6O
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:23 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzB-00014I-ID
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E1E702E81A8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:41 -0000
From: Launchpad Bug Tracker <1851845@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: blaster556 janitor th-huth
X-Launchpad-Bug-Reporter: Master (blaster556)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157322243198.19302.7056686325122080277.malonedeb@wampee.canonical.com>
Message-Id: <162433552183.20423.14195393703072784444.malone@loganberry.canonical.com>
Subject: [Bug 1851845] Re: Windows 10 panics with BlueIris 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 24712befd6543da0e7946fad64e5d5a0444dbfb2
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
Reply-To: Bug 1851845 <1851845@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851845

Title:
  Windows 10 panics with BlueIris

Status in QEMU:
  Expired

Bug description:
  Running Windows 10 64bit.  Starting BlueIris 64 bit causes Windows to
  panic with CPU type is set higher than Penryn or CPU type =3D host.

  I have been able to reproduce the same issue on Proxmox 4,5,6 as well
  as oVirt 3. and 4.

  Does not panic when CPU type is set to kvm64.

  =

  pve-qemu-kvm/stable 4.0.1-4 amd64

   /usr/bin/kvm -id 102 -name win7-01 -chardev
  socket,id=3Dqmp,path=3D/var/run/qemu-server/102.qmp,server,nowait -mon
  chardev=3Dqmp,mode=3Dcontrol -chardev socket,id=3Dqmp-
  event,path=3D/var/run/qmeventd.sock,reconnect=3D5 -mon chardev=3Dqmp-
  event,mode=3Dcontrol -pidfile /var/run/qemu-server/102.pid -daemonize
  -smbios type=3D1,uuid=3D3ec61114-c30c-4719-aa00-f3f05be22d48 -smp
  8,sockets=3D1,cores=3D8,maxcpus=3D8 -nodefaults -boot menu=3Don,strict=3D=
on
  ,reboot-timeout=3D1000,splash=3D/usr/share/qemu-server/bootsplash.jpg -vnc
  unix:/var/run/qemu-server/102.vnc,password -no-hpet -cpu
  penryn,+lahf_lm,+sep,+kvm_pv_unhalt,+kvm_pv_eoi,hv_spinlocks=3D0x1fff,hv_=
vapic,hv_time,hv_reset,hv_vpindex,hv_runtime,hv_relaxed,hv_synic,hv_stimer,=
hv_ipi,enforce
  -m 12000 -device pci-bridge,id=3Dpci.2,chassis_nr=3D2,bus=3Dpci.0,addr=3D=
0x1f
  -device pci-bridge,id=3Dpci.1,chassis_nr=3D1,bus=3Dpci.0,addr=3D0x1e -dev=
ice
  vmgenid,guid=3D50deb929-1974-4fd0-9ad3-71722149d568 -device piix3-usb-
  uhci,id=3Duhci,bus=3Dpci.0,addr=3D0x1.0x2 -device usb-
  tablet,id=3Dtablet,bus=3Duhci.0,port=3D1 -device
  VGA,id=3Dvga,bus=3Dpci.0,addr=3D0x2 -chardev socket,path=3D/var/run/qemu-
  server/102.qga,server,nowait,id=3Dqga0 -device virtio-
  serial,id=3Dqga0,bus=3Dpci.0,addr=3D0x8 -device
  virtserialport,chardev=3Dqga0,name=3Dorg.qemu.guest_agent.0 -device
  virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3 -iscsi initiator-
  name=3Diqn.1993-08.org.debian:01:203582cea152 -drive if=3Dnone,id=3Ddrive-
  ide2,media=3Dcdrom,aio=3Dthreads -device ide-cd,bus=3Dide.1,unit=3D0,drive
  =3Ddrive-ide2,id=3Dide2,bootindex=3D200 -drive
  file=3D/disk02/prox/images/102/vm-102-disk-0.raw,if=3Dnone,id=3Ddrive-
  virtio0,cache=3Dwriteback,format=3Draw,aio=3Dthreads,detect-zeroes=3Don
  -device virtio-blk-pci,drive=3Ddrive-
  virtio0,id=3Dvirtio0,bus=3Dpci.0,addr=3D0xa,bootindex=3D100 -drive
  file=3D/dev/disk/by-id/ata-WDC_WD80EMAZ-00WJTA0_7SGZLHYC-
  part1,if=3Dnone,id=3Ddrive-virtio1,cache=3Dwriteback,format=3Draw,aio=3Dt=
hreads
  ,detect-zeroes=3Don -device virtio-blk-pci,drive=3Ddrive-
  virtio1,id=3Dvirtio1,bus=3Dpci.0,addr=3D0xb -netdev
  type=3Dtap,id=3Dnet0,ifname=3Dtap102i0,script=3D/var/lib/qemu-server/pve-
  bridge,downscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don -device
  virtio-net-
  pci,mac=3D1e:be:cb:0b:6f:13,netdev=3Dnet0,bus=3Dpci.0,addr=3D0x12,id=3Dne=
t0,bootindex=3D300
  -netdev type=3Dtap,id=3Dnet1,ifname=3Dtap102i1,script=3D/var/lib/qemu-ser=
ver
  /pve-bridge,downscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don
  -device virtio-net-
  pci,mac=3DEA:76:56:16:2F:D7,netdev=3Dnet1,bus=3Dpci.0,addr=3D0x13,id=3Dne=
t1,bootindex=3D301
  -rtc driftfix=3Dslew,base=3Dlocaltime -machine type=3Dpc -global kvm-
  pit.lost_tick_policy=3Ddiscard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851845/+subscriptions

