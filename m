Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674582EFDC3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:39:03 +0100 (CET)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky61m-0007OF-Gk
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q3-0000DS-0D
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:47532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q0-00072x-6a
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pn-0006q5-IB
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 24D4F2E81C0
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:43 -0000
From: Launchpad Bug Tracker <1687599@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor steeven th-huth
X-Launchpad-Bug-Reporter: steeven (steeven)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170502110747.26349.38130.malonedeb@gac.canonical.com>
Message-Id: <161016586392.8490.9253579748969635529.malone@loganberry.canonical.com>
Subject: [Bug 1687599] Re: Bind 2nd VM to same OVS vhost-user port caused 1st
 vm traffic broken 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 0c0364cd891ece50306118ee426fe971333a3a1d
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
Reply-To: Bug 1687599 <1687599@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1687599

Title:
  Bind 2nd VM to same OVS vhost-user port caused 1st vm traffic broken

Status in QEMU:
  Expired

Bug description:
  Binding 2nd VM to same OVS vhost-user port caused 1st vm traffic
  broken. If it illegal to share same vhost port, how about the first VM
  open the path exclusively?

  #OVS side to create the vhost-user port:
  ovs-vsctl add-br br0 -- set bridge br0 datapath_type=3Dnetdev
  ovs-vsctl add-port br0 phy0 -- set Interface phy0 type=3Ddpdk options:dpd=
k-devargs=3D0000:0a:00.0
  ovs-vsctl add-port br0 dpdkvhostuser0 -- set Interface dpdkvhostuser0 typ=
e=3Ddpdkvhostuser

  #QEMU VM1
  qemu-system-x86_64 -name vm1 -cpu host -enable-kvm -m 3072 -drive file=3D=
/opt/ubuntu1.qcow2 -numa node,memdev=3Dmem -mem-prealloc -smp sockets=3D1,c=
ores=3D2 -object memory-backend-file,id=3Dmem,size=3D3072m,mem-path=3D/dev/=
hugepages,share=3Don -chardev socket,id=3Dchar0,path=3D/usr/local/var/run/o=
penvswitch/dpdkvhostuser0 -netdev type=3Dvhost-user,id=3Dmynet1,chardev=3Dc=
har0,vhostforce -device virtio-net-pci,mac=3D00:00:00:00:00:01,netdev=3Dmyn=
et1,mrg_rxbuf=3Doff

  #VM2
  qemu-system-x86_64 -name vm2 -cpu host -enable-kvm -m 3072 -drive file=3D=
/opt/ubuntu2.qcow2 -numa node,memdev=3Dmem -mem-prealloc -smp sockets=3D1,c=
ores=3D2 -object memory-backend-file,id=3Dmem,size=3D3072m,mem-path=3D/dev/=
hugepages,share=3Don -chardev socket,id=3Dchar0,path=3D/usr/local/var/run/o=
penvswitch/dpdkvhostuser0 -netdev type=3Dvhost-user,id=3Dmynet1,chardev=3Dc=
har0,vhostforce -device virtio-net-pci,mac=3D00:00:00:00:00:01,netdev=3Dmyn=
et1,mrg_rxbuf=3Doff

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1687599/+subscriptions

