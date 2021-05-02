Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14361370E83
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:35:16 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGvy-0007Vn-Is
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGn6-0008FY-9w
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:26:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGmt-0008MM-3X
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:26:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGmq-0000ot-IC
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 88C672E815F
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:17:33 -0000
From: Thomas Huth <1857143@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: noctavian th-huth toolybird
X-Launchpad-Bug-Reporter: =?utf-8?q?N=C4=83stasie_Ion_Octavian_=28noctavian?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157685586097.27697.14145668174002417681.malonedeb@chaenomeles.canonical.com>
Message-Id: <161997945387.10894.12349820540112603401.malone@gac.canonical.com>
Subject: [Bug 1857143] Re: VMs won't boot from external snapshots on qemu 4.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f42954e3f6bcaca6176a06af880221509ae6dd46
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1857143 <1857143@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since everything now boots fine for you, I think we can close this
ticket now, right? If not, feel free to open again.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857143

Title:
  VMs won't boot from external snapshots on qemu 4.2

Status in QEMU:
  Invalid

Bug description:
  After upgrading from qemu 4.1.1-1 to 4.2.0-1, VMs that were set to use
  an external snapshot as their disk failed to boot.

  Depending on the guest OS and other VM settings the boot fails and you
  get either the "Boot failed: not a bootable drive" message or the grub
  rescue shell or the EFI shell. Downgrading back to qemu 4.1 allows the
  VMs to boot from the external snapshots without any problem and the
  disk images doesn't appear to be corrupted afterwards.

  From my testing this bug is easily reproducible. Create a VM, install
  a guest os, confirm that the VM boots the guest os without problems,
  shutdown the VM, create an external snapshot of the VM disk, set the
  VM to boot from the snapshot, try to boot the VM with qemu 4.2 and see
  it fail, try to boot it with qemu 4.1 and see it succeed.

  In my case, to test that this bug is reproducible, I used virt-manager
  to install Xubuntu 19.10 on a qcow2 disk image, and then used qemu-img
  create -f qcow2 -b base_image.qcow2 snapshot_image.qcow2 to create the
  external snapshot and edited the xml in virt-manager to point the VM's
  disk to snapshot_image.qcow2. It failed to boot with qemu 4.2, but it
  was working fine with 4.1.

  I booted this test VM off a live distro using the virtual CDROM and
  fdisk can't seem to find a partition table on the VM disk when qemu
  4.2 is used, with 4.1 it can see the partition table just fine.

  Internal snapshots don't seem to have this problem.

  I'm using Archlinux, virt-manager 2.2.1-2, libvirt 5.10.0-1, qemu
  4.2.0-1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857143/+subscriptions

