Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27D30DC29
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:06:54 +0100 (CET)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Io1-0005QU-4v
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7Ij8-0001oS-02
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:01:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7Ij4-0006hL-4M
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:01:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7Ij0-0005NN-U7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:01:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B350E2E814F
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 14:01:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 13:54:26 -0000
From: Thomas Huth <1813940@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini darsto dgilbert-h marcandre-lureau philmd
 th-huth
X-Launchpad-Bug-Reporter: Darek Stojaczyk (darsto)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154885462996.30915.15408927273139016803.malonedeb@gac.canonical.com>
Message-Id: <161236046632.13072.16576612481390338464.malone@soybean.canonical.com>
Subject: [Bug 1813940] Re: kvm_mem_ioeventfd_add: error adding ioeventfd: No
 space left on device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: fda8c14f55908f353878f9a9bbd1cafe3bde3b41
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
Reply-To: Bug 1813940 <1813940@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That patch has been included here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D4f8260248c68e4599a5
Thus closing this ticket now.

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813940

Title:
  kvm_mem_ioeventfd_add: error adding ioeventfd: No space left on device

Status in QEMU:
  Fix Released

Bug description:
  Latest QEMU master fails to run with too many MMIO devices specified.

  After patch 3ac7d43a6fb [1] QEMU just prints an error message and exits.
  > kvm_mem_ioeventfd_add: error adding ioeventfd: No space left on device

  This is reproducible e.g. with the following setup:

  qemu-3.1.50-dirty \
      -machine pc-i440fx-2.7,accel=3Dkvm \
      -cpu host -m 4096 \
      -smp 2,sockets=3D2,cores=3D1,threads=3D1 \
      -drive file=3Dfreebsd_vm_1.qcow2,format=3Dqcow2,if=3Dnone,id=3Dbootdr=
 \
      -device ide-hd,drive=3Dbootdr,bootindex=3D0 \
      -device virtio-scsi-pci,id=3Dvc0 \
      -device virtio-scsi-pci,id=3Dvc1 \
      -device virtio-scsi-pci,id=3Dvc2 \
      -device virtio-scsi-pci,id=3Dvc3 \

  Running with just 3 Virtio-SCSI controllers seems to work fine, adding
  more than that causes the error above. Note that this is not Virtio-
  SCSI specific. I've also reproduced this without any Virtio devices
  whatsoever.

  strace shows the following ioctl chain over and over:

  145787 ioctl(11, KVM_UNREGISTER_COALESCED_MMIO, 0x7f60a4985410) =3D 0
  145787 ioctl(11, KVM_UNREGISTER_COALESCED_MMIO, 0x7f60a4985410) =3D 0
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D 0
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)
  145787 ioctl(11, KVM_REGISTER_COALESCED_MMIO, 0x7f60a49853b0) =3D -1 ENOS=
PC (No space left on device)

  Which suggests there's some kind of MMIO region leak.

  [1]
  commit 3ac7d43a6fbb5d4a3d01fc9a055c218030af3727
  Author:     Paolo Bonzini <pbonzini@redhat.com>
  AuthorDate: Wed Nov 28 17:28:45 2018 +0100
  Commit:     Paolo Bonzini <pbonzini@redhat.com>
  CommitDate: Fri Jan 11 13:57:24 2019 +0100

      memory: update coalesced_range on transaction_commit

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813940/+subscriptions

