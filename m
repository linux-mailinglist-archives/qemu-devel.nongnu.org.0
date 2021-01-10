Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EEB2F051A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:31:50 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySOL-0007QT-LK
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIn-0007p0-Lx
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIl-0000iG-GV
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:05 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIj-0000E8-MD
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5BBF12E8145
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:40 -0000
From: Launchpad Bug Tracker <1735082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nitin981 th-huth
X-Launchpad-Bug-Reporter: Nitin (nitin981)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151193824666.10852.4284580382497408043.malonedeb@wampee.canonical.com>
Message-Id: <161025226164.18863.8581655885216202774.malone@loganberry.canonical.com>
Subject: [Bug 1735082] Re: NVME pass through in th eguest VM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 91410e37a25a82dceb4cbe174e664b9ba80de52e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1735082 <1735082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1735082

Title:
  NVME pass through in th eguest VM

Status in QEMU:
  Expired

Bug description:
  Hi Qemu Team

  i am new in qemu and trying for nvme pass through ..
  for that i used  below git repo for nvme =


  https://github.com/famz/qemu/tree/nvme

  and trying to launch the VM by below qemu command ..

  /usr/local/bin/qemu-system-x86_64 -name sl7.0=E2=80=82=E2=80=82-m 1024 -o=
bject memory-
  backend-file,id=3Dmem,size=3D1G,mem-path=3D/dev/hugepages,share=3Don
  -nographic -no-user-config -nodefaults -serial
  mon:telnet:localhost:7704,server,nowait -monitor
  mon:telnet:localhost:8804,server,nowait -numa node,memdev=3Dmem -drive
  file=3D/home/qemu/qcows,format=3Dqcow2,if=3Dnone,id=3Ddisk -device ide-
  hd,drive=3Ddisk,bootindex=3D0 -drive
  file=3Dnvme://0000:d8:00.0,if=3Dnone,id=3Ddrive0 -device virtio-
  blk,drive=3Ddrive0,id=3Dvirtio0 --enable-kvm

  i am getting kernel panic and not proceed further..please help

  PS:-  our guest VM version is

  Scientific Linux 7.0 (Nitrogen)
  Kernel 3.10.0-123.el7.x86_64 on an x86_64

  Regards
  Nitin

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1735082/+subscriptions

