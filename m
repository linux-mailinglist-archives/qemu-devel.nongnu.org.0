Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E82ABDD6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 14:52:22 +0100 (CET)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc7an-0000tg-VG
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 08:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kc7UZ-0003Cf-D8
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:45:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:33866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kc7UT-0002qU-Gm
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:45:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kc7UQ-0000du-2K
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 13:45:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 04EEE2E8132
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 13:45:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2020 13:37:05 -0000
From: Thomas Huth <1687599@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: steeven th-huth
X-Launchpad-Bug-Reporter: steeven (steeven)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170502110747.26349.38130.malonedeb@gac.canonical.com>
Message-Id: <160492902555.18790.12210009541576222876.malone@wampee.canonical.com>
Subject: [Bug 1687599] Re: Bind 2nd VM to same OVS vhost-user port caused 1st
 vm traffic broken 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 3bc1c9bbf776c9368bc1144aa85f831d8c1aba0c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:40:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1687599 <1687599@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1687599

Title:
  Bind 2nd VM to same OVS vhost-user port caused 1st vm traffic broken

Status in QEMU:
  Incomplete

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

