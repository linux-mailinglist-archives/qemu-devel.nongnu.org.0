Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C83C1E74
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:33:01 +0200 (CEST)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iCC-0005hM-R3
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5K-0005Pu-10
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:60474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5I-0001BQ-6Q
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5E-0005Dh-2r
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0BB8D2E817B
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1901892@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rq23a th-huth
X-Launchpad-Bug-Reporter: Pablo Schandin (rq23a)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160389245558.14992.8062184889310483170.malonedeb@wampee.canonical.com>
Message-Id: <162580424983.19936.10312240150732828934.malone@loganberry.canonical.com>
Subject: [Bug 1901892] Re: qemu-img create corrupts the qcow2 if the file
 already exists
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: c2187d47de2ad435954d62312e18eb7a0443f87c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1901892 <1901892@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1901892

Title:
  qemu-img create corrupts the qcow2 if the file already exists

Status in QEMU:
  Expired

Bug description:
  When creating a disk using qemu-img create command, if the destination
  path of the qcow2 file already exists, it will show the error saying
  that it cannot get a lock so it exits with exit status 1 but it will
  corrupt the qcow2 file anyway.

  Steps to reproduce:
  1. Have a guest running with a root (vda) and a second device (vdc).
  In my case is a clean Ubuntu 16.04 image with kernel 4.4.0-190-generic x8=
6_64
  vdc disk is called testadddisk-3.qcow2
  2. vdc is an xfs over lvm.
  pvcreacte /dev/vdc
  vgcreate myVg /dev/vdc
  lvcreate -l+100%FREE -n myLv myVg
  mkfs.xfs /dev/mapper/myVg-myLv
  mount /dev/mapper/myVg-myLv /mnt
  3. Create disk IO on that device in the guest.
  while true ; do dd if=3D/dev/zero of=3D/mnt/testfile bs=3D1024 count=3D10=
00 ; sleep 1; done
  4. Execute the command to create a new device but use the same name of th=
e device attached:
  sudo qemu-img create -f qcow2 testadddisk-3.qcow2 20G
  The output of the command is this:
  Formatting 'testadddisk-3.qcow2', fmt=3Dqcow2 size=3D21474836480 cluster_=
size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
  qemu-img: testadddisk-3.qcow2: Failed to get "write" lock
  Is another process using the image?

  The write continues in the guest but when it is shutdown, when it is powe=
red on again you get this:
  error: Failed to start domain testadddisk
  error: internal error: process exited while connecting to monitor: 2020-1=
0-27T22:00:51.628374Z qemu-system-x86_64: -drive file=3D/var/lib/vmImages/t=
estadddisk-3.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk2: Image =
is not in qcow2 format

  I run the qemu-img create command with an strace and I believe that
  first it tries to open the file in write mode, then does a truncate on
  it and after that says it cannot get a lock. The output is in the file
  attached. As well as the guest xml just in case.

  The host: =

  Ubuntu 18.04.5 LTS
  4.15.0-112-generic x86_64
  qemu packages installed:
  ii  qemu-block-extra:amd64                 1:2.11+dfsg-1ubuntu7.32       =
                  amd64        extra block backend modules for qemu-system =
and qemu-utils
  ii  qemu-kvm                               1:2.11+dfsg-1ubuntu7.31       =
                  amd64        QEMU Full virtualization on x86 hardware
  ii  qemu-system-common                     1:2.11+dfsg-1ubuntu7.32       =
                  amd64        QEMU full system emulation binaries (common =
files)
  ii  qemu-system-x86                        1:2.11+dfsg-1ubuntu7.31       =
                  amd64        QEMU full system emulation binaries (x86)
  ii  qemu-utils                             1:2.11+dfsg-1ubuntu7.32       =
                  amd64        QEMU utilities

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901892/+subscriptions

