Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E711325E789
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 14:32:20 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEXMh-00088n-VP
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 08:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kEXLH-00079r-Fp
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 08:30:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:50424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kEXLF-0007pb-As
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 08:30:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kEXLD-0001iV-0N
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 12:30:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BB0B72E80EA
 for <qemu-devel@nongnu.org>; Sat,  5 Sep 2020 12:30:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2020 12:20:52 -0000
From: Thomas Huth <1708617@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ke.king th-huth
X-Launchpad-Bug-Reporter: jinke (ke.king)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150183560010.4317.16234791379107519041.malonedeb@gac.canonical.com>
Message-Id: <159930845267.32525.13810683392463920949.malone@wampee.canonical.com>
Subject: [Bug 1708617] Re: qemu2.9 meet a question using reconnect about
 ovs+dpdk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: 3df3ae8f0f26c67bcfd1798d152edf4816c1ea8b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 03:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1708617 <1708617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ooking through old bug tickets... is this still an issue with the latest
version of QEMU? Or could we close this ticket nowadays? And what is a
"question ping between 2 vm error" ?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1708617

Title:
  qemu2.9 meet a question using reconnect about ovs+dpdk

Status in QEMU:
  Incomplete

Bug description:
  env:
  qemu-2.9
  dpdk-16.11
  ovs-2.6.1
  host os:Linux compute 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UT=
C 2016 x86_64 x86_64 x86_64 GNU/Linux
  guest os is same with host

  1. ovs service is normal
  2. start 2 qemu vm, using vhostuser port as server
  taskset 0x3f qemu-system-x86_64 -cpu host -smp 2,cores=3D2 -drive file=3D=
$QCOW2_IMAGE -m 4096M --enable-kvm -name $VM_NAME -nographic -object memory=
-backend-file,id=3Dmem,size=3D$GUEST_MEM,mem-path=3D/dev/hugepages,share=3D=
on -numa node,memdev=3Dmem -mem-prealloc -chardev socket,id=3Dchar1,path=3D=
$VHOST_SOCK_DIR/dpdkvhostuser0,server -netdev type=3Dvhost-user,id=3Dmynet1=
,chardev=3Dchar1,vhostforce,queues=3D2 -device virtio-net-pci,mac=3D00:00:0=
0:00:00:01,netdev=3Dmynet1,mq=3Don,vectors=3D6  -nographic -vnc :0 =

  qemu-system-x86_64: -chardev socket,id=3Dchar1,path=3D/usr/local/var/run/=
openvswitch/dpdkvhostuser0,server: QEMU waiting for connection on: disconne=
cted:unix:/usr/local/var/run/openvswitch/dpdkvhostuser0,server

  taskset 0x3f qemu-system-x86_64 -cpu host -smp 2,cores=3D2 -drive file=3D=
$QCOW2_IMAGE -m 4096M --enable-kvm -name $VM_NAME -nographic -object memory=
-backend-file,id=3Dmem,size=3D$GUEST_MEM,mem-path=3D/dev/hugepages,share=3D=
on -numa node,memdev=3Dmem -mem-prealloc -chardev socket,id=3Dchar1,path=3D=
$VHOST_SOCK_DIR/dpdkvhostuser0,server -netdev type=3Dvhost-user,id=3Dmynet1=
,chardev=3Dchar1,vhostforce,queues=3D2 -device virtio-net-pci,mac=3D00:00:0=
0:00:00:01,netdev=3Dmynet1,mq=3Don,vectors=3D6  -nographic -vnc :0 =

  qemu-system-x86_64: -chardev socket,id=3Dchar1,path=3D/usr/local/var/run/=
openvswitch/dpdkvhostuser0,server: QEMU waiting for connection on: disconne=
cted:unix:/usr/local/var/run/openvswitch/dpdkvhostuser1,server

  3. add br and vhostuser port as client
  ovs-vsctl add-br br1 -- set bridge br1 datapath_type=3Dnetdev
  ovs-vsctl add-port br1 dpdkvhostuser0 -- set Interface dpdkvhostuser0 typ=
e=3Ddpdkvhostuserclient  options:vhost-server-path=3D"/usr/local/var/run/op=
envswitch/dpdkvhostuser0"			=

  ovs-vsctl add-port br1 dpdkvhostuser1 -- set Interface dpdkvhostuser1 typ=
e=3Ddpdkvhostuserclient  options:vhost-server-path=3D"/usr/local/var/run/op=
envswitch/dpdkvhostuser1"			=

  			=

  4. ping between 2 vm is ok
  5. restart ovs process
   systemctl restart openvswitch

  6. there is a question ping between 2 vm error

  7. change qemu from 2.9 to 2.7, everything become ok

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1708617/+subscriptions

