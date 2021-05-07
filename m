Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E1375EBF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 04:12:38 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lepym-0007CV-RP
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 22:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lepxP-0006nS-1T
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:11:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:55410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lepxJ-0005Ef-S8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:11:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lepxC-0006a4-B6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 02:10:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D5B32E8186
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 02:10:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 01:59:08 -0000
From: xuan <1863200@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: mode packed ring server
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth xavier-ding
X-Launchpad-Bug-Reporter: xuan (xavier-ding)
X-Launchpad-Bug-Modifier: xuan (xavier-ding)
References: <158165197713.30147.2525334191220612578.malonedeb@wampee.canonical.com>
Message-Id: <162035274880.4215.18142072059429592088.launchpad@gac.canonical.com>
Subject: [Bug 1863200] Re: Reconnect failed with loopback virtio1.1 server
 mode test
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 071c553bcf8755c35fb35e3b94ec2b98375b34a2
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
Reply-To: Bug 1863200 <1863200@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863200

Title:
  Reconnect failed with loopback virtio1.1 server mode test

Status in QEMU:
  New

Bug description:
  Issue discription=EF=BC=9A
  Packed ring server mode is a new feature to enable the virtio-user or vir=
tio-pmd(in VM) as the server, vhost as the client, then when the vhost-user=
 is killed then re-launched, the vhost-user can connect back to virtio-user=
/virtio-pmd again. Test with dpdk 20.02 ,virtio-pmd loopback reconnect from=
 vhost-user failed.

  Test Environment:
  DPDK version: DPDK v20.02
  Other software versions: virtio1.1
  Qemu versions:4.2.0
  OS: Linux 4.15.0-20-generic
  Compiler: gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
  Hardware platform: R2208WFTZSR.

  The reproduce step is :
  Test Case: vhost-user/virtio-pmd loopback reconnect from vhost-user
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Flow: Vhost-user --> Virtio --> Vhost-user

  1. Launch vhost-user with client mode by below commands::

      ./testpmd -c 0x30 -n 4 --socket-mem 1024,1024 --legacy-mem --vdev 'et=
h_vhost0,iface=3D/tmp/vhost-net,client=3D1,queues=3D1' -- -i --nb-cores=3D1
      testpmd>set fwd mac

  2. Start VM with 1 virtio device, and set the qemu as server mode::

      ./qemu-system-x86_64 -name vm2 -enable-kvm -cpu host -smp 100 -m 8G \
      -object memory-backend-file,id=3Dmem,size=3D8192M,mem-path=3D/mnt/hug=
e,share=3Don \
      -numa node,memdev=3Dmem -mem-prealloc -drive file=3D/home/xuan/dpdk_p=
roject/shell/u18.img  \
      -chardev socket,path=3D/tmp/vm2_qga0.sock,server,nowait,id=3Dvm2_qga0=
 -device virtio-serial \
      -device virtserialport,chardev=3Dvm2_qga0,name=3Dorg.qemu.guest_agent=
.2 -daemonize \
      -monitor unix:/tmp/vm2_monitor.sock,server,nowait -net nic,macaddr=3D=
00:00:00:08:e8:aa,addr=3D1f \
      -net user,hostfwd=3Dtcp:127.0.0.1:6002-:22 \
      -chardev socket,id=3Dchar0,path=3D/tmp/vhost-net,server \
      -netdev type=3Dvhost-user,id=3Dnetdev0,chardev=3Dchar0,vhostforce \
      -device virtio-net-pci,netdev=3Dnetdev0,mac=3D52:54:00:00:00:01,mrg_r=
xbuf=3Don,rx_queue_size=3D1024,tx_queue_size=3D1024,packed=3Don \
      -vnc :10

  3. On VM, bind virtio net to igb_uio and run testpmd::

      ./testpmd -c 0x3 -n 4 -- -i --nb-cores=3D1 --txd=3D1024 --rxd=3D1024
      testpmd>set fwd mac
      testpmd>start

  4. Send packets by vhost-user, check if packets can be RX/TX with
  virtio-pmd::

      testpmd>start tx_first 32
      testpmd>show port stats all

  5. On host, quit vhost-user, then re-launch the vhost-user with below
  command::

      testpmd>quit
      ./testpmd -c 0x30 -n 4 --socket-mem 1024,1024 --legacy-mem --vdev 'et=
h_vhost0,iface=3D/tmp/vhost-net,client=3D1,queues=3D1' -- -i --nb-cores=3D1
      testpmd>set fwd mac
      testpmd>start tx_first 32

  6. Check if the reconnection can work, still send packets by vhost-
  user, check if packets can be RX/TX with virtio-pmd::

      testpmd>show port stats all

  Expected result::

  After the vhost-user is killed then re-launched, the VM can connect
  back to vhost-user again with throughput.

  Real result::

  After the vhost-user is killed then re-launched, no throughput with
  PVP.

  Analysis::

  QEMU has its own way to handle reconnect function for virtio server
  mode. However, for packed ring, when reconnecting to virtio, vhost
  cannot get the status of descriptors via the descriptor ring. This bug
  is caused since the reconnection for packed ring need additional reset
  operation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863200/+subscriptions

