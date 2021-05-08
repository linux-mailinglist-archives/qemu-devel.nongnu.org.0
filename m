Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD20376FC1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:37:19 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFeR-0008Ip-1z
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFcf-0006tc-8y
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:35:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:51412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfFcd-0006g4-Bk
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:35:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfFcb-00035d-Dd
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 05:35:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CEE22E802E
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 05:35:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:26:54 -0000
From: xuan <1888818@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth xavier-ding
X-Launchpad-Bug-Reporter: xuan (xavier-ding)
X-Launchpad-Bug-Modifier: xuan (xavier-ding)
References: <159558183424.11837.7512442025195132206.malonedeb@wampee.canonical.com>
Message-Id: <162045161521.9721.11517419123272382349.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1888818] Re: Multi-queue vhost-user fails to reconnect with qemu
 version >=4.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: e66274e8996dd5b266424c234dce08a2067098d5
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
Reply-To: Bug 1888818 <1888818@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888818

Title:
  Multi-queue vhost-user fails to reconnect with qemu version >=3D4.2

Status in QEMU:
  New

Bug description:
  Test Environment:
  DPDK version: DPDK v20.08
  Other software versions: qemu4.2.0, qemu5.0.0.
  OS: Linux 4.15.0-20-generic
  Compiler: gcc (Ubuntu 7.3.0-16ubuntu3) 8.4.0
  Hardware platform: Purley.
  Test Setup
  Steps to reproduce
  List the steps to reproduce the issue.

  Test flow
  =3D=3D=3D=3D=3D=3D=3D=3D=3D
  1. Launch vhost-user testpmd as port0 with 2 queues:

  ./x86_64-native-linuxapp-gcc/app/testpmd -l 2-4 -n 4 \
  =C2=A0=C2=A0=C2=A0=C2=A0--file-prefix=3Dvhost --vdev 'net_vhost0,iface=3D=
vhost-net,queues=3D2,client=3D1' -- -i --txd=3D1024 --rxd=3D1024 --txq=3D2 =
--rxq=3D2
  testpmd>start

  3. Launch qemu with virtio-net:

  =C2=A0taskset -c 13 \
  =C2=A0=C2=A0=C2=A0=C2=A0qemu-system-x86_64 -name us-vhost-vm1 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cpu host -enable-kvm -m 2048 -=
object memory-backend-file,id=3Dmem,size=3D2048M,mem-path=3D/mnt/huge,share=
=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-numa node,memdev=3Dmem \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-mem-prealloc -monitor unix:/tm=
p/vm2_monitor.sock,server,nowait -netdev user,id=3Dyinan,hostfwd=3Dtcp:127.=
0.0.1:6005-:22 -device e1000,netdev=3Dyinan \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-smp cores=3D1,sockets=3D1 -dri=
ve file=3D/home/osimg/ubuntu16.img  \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-chardev socket,id=3Dchar0,path=
=3D./vhost-net,server \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-netdev type=3Dvhost-user,id=3D=
mynet1,chardev=3Dchar0,vhostforce,queues=3D2 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,mac=3D52=
:54:00:00:00:01,netdev=3Dmynet1,mrg_rxbuf=3Don,csum=3Don,gso=3Don,host_tso4=
=3Don,guest_tso4=3Don,mq=3Don,vectors=3D15 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-vnc :10 -daemonize

  6. Quit testpmd and restart vhost-user :

  testpmd>quit
  ./x86_64-native-linuxapp-gcc/app/testpmd -l 2-4 -n 4 \
  =C2=A0=C2=A0=C2=A0=C2=A0--file-prefix=3Dvhost --vdev 'net_vhost0,iface=3D=
vhost-net,queues=3D2,client=3D1' -- -i --txd=3D1024 --rxd=3D1024 --txq=3D2 =
--rxq=3D2

  Expected Result:
  After the vhost-user is killed then re-launched, the virtio-net can conne=
ct back to vhost-user again.

  Actual Result:
  Vhost-user relaunch failed with continous log printed"VHOST_CONFIG: Proce=
ssing VHOST_USER_SET_FEATURES failed.

  Analysis:
  This is a regression bug, bad commit: c6beefd674f
  When vhost-user quits, QEMU doesnot save acked features for each virtio-n=
et after vhost-user quits. When vhost-user reconnects to QEMU, QEMU sends t=
wo different features(one is the true acked feature while the another is 0x=
40000000) to vhost-user successively which causing vhost-user exits abnorma=
lly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888818/+subscriptions

