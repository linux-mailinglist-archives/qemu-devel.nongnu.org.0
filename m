Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B5224C28
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jul 2020 17:00:27 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwoKA-0005Em-Ah
	for lists+qemu-devel@lfdr.de; Sat, 18 Jul 2020 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jwoJK-0004nS-4d
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 10:59:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:38070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jwoJI-00053u-AA
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 10:59:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jwoJG-0003qY-Sy
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 14:59:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C8AE32E80F0
 for <qemu-devel@nongnu.org>; Sat, 18 Jul 2020 14:59:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2020 14:47:48 -0000
From: Thomas Huth <1603970@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-mair-g th-huth
X-Launchpad-Bug-Reporter: Kilian Ries (7-mair-g)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160718121144.22648.14707.malonedeb@chaenomeles.canonical.com>
Message-Id: <159508366851.11965.9099636484095060713.malone@soybean.canonical.com>
Subject: [Bug 1603970] Re: KVM freezes after live migration (AMD 4184 -> 4234)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: daa5ff2ecfff69d3ffd14b93ec498c294b3e4587
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/18 10:41:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1603970 <1603970@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... can you still reproduce this issue
with the latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1603970

Title:
  KVM freezes after live migration (AMD 4184 -> 4234)

Status in QEMU:
  Incomplete

Bug description:
  Hi,

  i have two host systems with different CPU types:

  Host A:
  AMD Opteron(tm) Processor 4234

  Host B:
  AMD Opteron(tm) Processor 4184

  Live migration from B -> A works as expected, migration from A -> B
  always ends in a freezed KVM. If the KVM is frozen, VNC output is
  still present, however, you can't type anything. CPU usage is always
  at 100% for one core (so if i set two cores, one is at 100% the other
  one at 0% usage).

  My command to launch the KVM is the following:

  /usr/bin/kvm -id 104 -chardev socket,id=3Dqmp,path=3D/var/run/qemu-
  server/104.qmp,server,nowait -mon chardev=3Dqmp,mode=3Dcontrol -pidfile
  /var/run/qemu-server/104.pid -daemonize -smbios
  type=3D1,uuid=3D26dd83a9-b9bd-4641-8016-c55f255f1bdf -name kilian-test
  -smp 1,sockets=3D1,cores=3D1,maxcpus=3D1 -nodefaults -boot menu=3Don,stri=
ct=3Don
  ,reboot-timeout=3D1000 -vga cirrus -vnc unix:/var/run/qemu-
  server/104.vnc,x509,password -cpu
  kvm64,+lahf_lm,+sep,+kvm_pv_unhalt,+kvm_pv_eoi,enforce -m 512 -object
  memory-backend-ram,id=3Dram-node0,size=3D512M -numa
  node,nodeid=3D0,cpus=3D0,memdev=3Dram-node0 -k de -device pci-
  bridge,id=3Dpci.2,chassis_nr=3D2,bus=3Dpci.0,addr=3D0x1f -device pci-
  bridge,id=3Dpci.1,chassis_nr=3D1,bus=3Dpci.0,addr=3D0x1e -device piix3-us=
b-
  uhci,id=3Duhci,bus=3Dpci.0,addr=3D0x1.0x2 -device usb-
  tablet,id=3Dtablet,bus=3Duhci.0,port=3D1 -device virtio-balloon-
  pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x3 -iscsi initiator-
  name=3Diqn.1993-08.org.debian:01:5ca1e9d334b2 -drive
  file=3D/mnt/pve/nfs_synology/images/104/vm-104-disk-2.qcow2,if=3Dnone,id
  =3Ddrive-virtio0,format=3Dqcow2,cache=3Dnone,aio=3Dnative,detect-zeroes=
=3Don
  -device virtio-blk-pci,drive=3Ddrive-
  virtio0,id=3Dvirtio0,bus=3Dpci.0,addr=3D0xa,bootindex=3D100 -netdev
  type=3Dtap,id=3Dnet0,ifname=3Dtap104i0,script=3D/var/lib/qemu-server/pve-
  bridge,downscript=3D/var/lib/qemu-server/pve-bridgedown,vhost=3Don -device
  virtio-net-
  pci,mac=3D66:33:31:36:35:36,netdev=3Dnet0,bus=3Dpci.0,addr=3D0x12,id=3Dne=
t0,bootindex=3D300

  =

  KVM / QEMU version: QEMU emulator version 2.5.1.1

  I have tried to set different CPU types, but no one works (qemu64,
  vm64, Opteron_G1, ...).

  =

  I have found an email from 2014 where another user reports exactly the sa=
me problem:

  http://lists.gnu.org/archive/html/qemu-discuss/2014-02/msg00002.html

  Greets
  Kilian

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1603970/+subscriptions

