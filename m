Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEC47313
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 06:32:21 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcMq4-0001yx-6w
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 00:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50892)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hcMni-0000p9-Nz
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 00:29:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hcMng-0003pu-RE
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 00:29:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hcMng-0003lz-LW
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 00:29:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hcMnb-0008GX-9U
 for <qemu-devel@nongnu.org>; Sun, 16 Jun 2019 04:29:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 341742E80D3
 for <qemu-devel@nongnu.org>; Sun, 16 Jun 2019 04:29:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Jun 2019 04:17:22 -0000
From: Launchpad Bug Tracker <1574572@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth ztehypervisor
X-Launchpad-Bug-Reporter: Michael liu (ztehypervisor)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160425105439.5722.90720.malonedeb@chaenomeles.canonical.com>
Message-Id: <156065864220.14650.14827537819853825912.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 79b720b35c49cf1967f2e58ef3b9f6242c543c9f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] =?utf-8?q?=5BBug_1574572=5D_Re=3A_config_20_sriov_di?=
 =?utf-8?q?rect_bond_ports=EF=BC=8Cvm_create_failed=2E?=
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
Reply-To: Bug 1574572 <1574572@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1574572

Title:
  config 20 sriov direct bond ports=EF=BC=8Cvm create failed.

Status in QEMU:
  Expired

Bug description:
  nova log=EF=BC=9A

   2016-04-08 09:57:48.640 5057 INFO nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -] report
  alarm_instance_shutoff success

  2016-04-08 09:57:48.712 5057 INFO nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -] [instance: d860169c-
  0dac-448f-a644-01a9b200cebe] During _sync_instance_power_state the DB
  power_state (1) does not match the vm_power_state from the hypervisor
  (4). Updating power_state in the DB to match the hypervisor.

  2016-04-08 09:57:48.791 5057 WARNING nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -] [instance: d860169c-
  0dac-448f-a644-01a9b200cebe] Instance shutdown by itself. Calling the
  heal_instance_state. Current vm_state: active, current task_state:
  None, original DB power_state: 1, current VM power_state: 4

  2016-04-08 09:57:48.892 5057 INFO nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -]
  alarm_notice_heal_event result:1,host_name:tfg120,instance_id
  :d860169c-0dac-
  448f-a644-01a9b200cebe,instance_name:vfnicdirect,vm_state:active,power_st=
ate:shutdown,action:start

  2016-04-08 09:57:48.997 5057 INFO nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -]
  Refresh_instance_block_device_info:False

  2016-04-08 09:57:48.998 5057 INFO nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -] [instance: d860169c-
  0dac-448f-a644-01a9b200cebe] Rebooting instance

  2016-04-08 09:57:49.373 5057 WARNING nova.compute.manager [req-
  4e1b4d70-62b6-4158-8413-3c9f226fd13b - - - - -] [instance: d860169c-
  0dac-448f-a644-01a9b200cebe] trying to reboot a non-running instance:
  (state: 4 expected: 1)

  2016-04-08 09:57:49.479 5057 INFO nova.virt.libvirt.driver [-]
  [instance: d860169c-0dac-448f-a644-01a9b200cebe] Instance destroyed
  successfully.

  =

  libvirtd  log=EF=BC=9A

  2016-04-08 02:05:05.785+0000: 4778: info : qemuDomainDestroyFlags:2227
  : Log: VM: name=3D instance-000000b8

  2016-04-08 02:05:16.156+0000: 4771: info :
  qemuDomainDefineXMLFlags:7576 : Creating domain 'instance-000000b8'

  2016-04-08 02:05:16.158+0000: 4773: info :
  qemuDomainCreateWithFlags:7448 : Log: VM: name=3D instance-000000b8

  2016-04-08 02:05:16.158+0000: 4773: info : qemuProcessStart:4412 :
  vm=3D0x7f19482fdb30 name=3Dinstance-000000b8 id=3D-1 asyncJob=3D0
  migrateFrom=3D<null> stdin_fd=3D-1 stdin_path=3D<null> snapshot=3D(nil) v=
mop=3D0
  flags=3D0x1

  2016-04-08 02:05:16.169+0000: 4773: info :
  virNetDevReplaceNetConfig:2541 : Replace Net Config of linkdev
  enp132s0f0, vf 28, macaddress 00:d1:d4:00:05:03, vlanid 1250, stateDir
  /var/run/libvirt/hostdevmgr

  2016-04-08 02:05:16.169+0000: 4773: info :
  virNetDevReplaceNetConfig:2566 : Replace  Vf Config of enp132s0f0, vf
  28, vlanid 1250, stateDir /var/run/libvirt/hostdevmgr

  2016-04-08 02:05:16.169+0000: 4773: info :
  virNetDevReplaceVfConfig:2390 : pflinkdev enp132s0f0, vf 28,vlanid
  1250

  2016-04-08 02:05:16.178+0000: 4773: info :
  virNetDevReplaceVfConfig:2428 : save oldmac 00:d1:d4:00:05:03,
  oldvlanid 1250

  2016-04-08 02:05:16.178+0000: 4773: info : virNetDevSetVfConfig:2196 :
  ifname enp132s0f0,ifindex -1,vf 28,macaddress 00:d1:d4:00:05:03,
  vlanid 1250

  =

  qemu log=EF=BC=9A

  kvm_alloc_slot: no free slot available

  2016-04-08 06:21:04.793+0000: shutting down

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1574572/+subscriptions

