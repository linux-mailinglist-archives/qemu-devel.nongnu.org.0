Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A049837533E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 13:53:21 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lecZE-0005VJ-ND
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lecWp-00041O-Gy
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:50:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:51620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lecWn-00032X-JK
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:50:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lecWl-0000vL-Ex
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 11:50:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 682852E8060
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 11:50:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 11:38:51 -0000
From: Thomas Huth <1865160@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: npm qemu-system-s390x s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alfarre th-huth
X-Launchpad-Bug-Reporter: A. Farrell (alfarre)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158290082970.7536.17698296699397322599.malonedeb@chaenomeles.canonical.com>
Message-Id: <162030113150.14117.2632610362490869920.malone@soybean.canonical.com>
Subject: [Bug 1865160] Re: Unpredictable behaviour resulting in User process
 faults
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: d776c861812a4c090e5970faea236de051c517c4
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
Reply-To: Bug 1865160 <1865160@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/197


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #197
   https://gitlab.com/qemu-project/qemu/-/issues/197

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865160

Title:
  Unpredictable behaviour resulting in User process faults

Status in QEMU:
  Expired

Bug description:
  An example of the behaviour can be reproduced when using NPM, whereby
  running the command multiple times will result in a variety of error
  conditions causing the command to fail:

  Example of failure:

  Segmentation fault.] / rollbackFailedOptional: verb npm-session
  1a805a5e0ff7b8f5

  [ 3144.216869] User process fault: interruption code 0038 ilc:3 =

  [ 3144.216981] Failing address: 66616c7365000000 TEID: 66616c7365000800
  [ 3144.217009] Fault in primary space mode while using user ASCE.
  [ 3144.217055] AS:00000000ed28c1c7 R3:0000000000000024 =


  Feb 28 14:32:08 qemus390x kernel: [ 3144.216869] User process fault: inte=
rruption code 0038 ilc:3 =

  Feb 28 14:32:08 qemus390x kernel: [ 3144.216981] Failing address: 66616c7=
365000000 TEID: 66616c7365000800
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217009] Fault in primary space m=
ode while using user ASCE.
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217055] AS:00000000ed28c1c7 R3:0=
000000000000024 =

  Feb 28 14:32:08 qemus390x kernel: [ 3144.217217] CPU: 2 PID: 1018 Comm: n=
pm Not tainted 4.15.0-88-generic #88-Ubuntu
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217234] Hardware name: QEMU 2964=
 QEMU (KVM/Linux)
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217257] User PSW : 00000000185db=
982 00000000c1d5a1a1
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217290]            R:0 T:1 IO:1 =
EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:2 PM:0 RI:0 EA:3
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217322] User GPRS: 000002aa03705=
200 0000006a16d73ac1 0000003da4b829f1 0000000000000000
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217343]            0000003da4b82=
a08 0000003da4b82a08 000002aa036a92ec 0000000000000000
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217364]            0000003da4b82=
9f1 000003ffdb8f7e50 0000003da4b82a08 000003ffdb8f7d88
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217385]            66616c7365000=
000 000002aa036a05b0 000002aa015bcfb2 000003ffdb8f7d88
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512] User Code:#0000006a16d73=
b00: c0f4000000df	brcl	15,0000006a16d73cbe
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]           >0000006a16d73=
b06: a7290000		lghi	%r2,0
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]            0000006a16d73=
b0a: 07fe		bcr	15,%r14
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]            0000006a16d73=
b0c: c02f000001f3	llilf	%r2,499
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]            0000006a16d73=
b12: e3d0dff8ff71	lay	%r13,-8(%r13)
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]            0000006a16d73=
b18: e320d0000024	stg	%r2,0(%r13)
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217512]            0000006a16d73=
b1e: c028000002aa	iihf	%r2,682
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217724] Last Breaking-Event-Addr=
ess:
  Feb 28 14:32:08 qemus390x kernel: [ 3144.217759]  [<000002aa015bcfae>] 0x=
2aa015bcfae


  =

  QEMU emulator version 4.2.0
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  QEMU Command:

  sudo qemu-system-s390x -smp cpus=3D5 -machine s390-ccw-virtio -cpu
  max,zpci=3Don -serial telnet::4441,server -display none -m 4096 -net nic
  -net tap  -drive file=3Dubuntu.root,if=3Dnone,id=3Ddrive-virtio-
  disk0,format=3Draw,cache=3Dnone -device virtio-blk-
  ccw,devno=3Dfe.0.0003,drive=3Ddrive-virtio-disk0,id=3Dvirtio-
  disk0,bootindex=3D100,scsi=3Doff -drive file=3Dubuntu.home,if=3Dnone,id=
=3Ddrive-
  virtio-disk1,format=3Draw,cache=3Dnone -device virtio-blk-
  ccw,devno=3Dfe.0.0002,drive=3Ddrive-virtio-disk1,id=3Dvirtio-
  disk1,bootindex=3D1,scsi=3Doff -drive file=3Dubuntu.swap,if=3Dnone,id=3Dd=
rive-
  virtio-disk4,format=3Draw,cache=3Dnone -device virtio-blk-
  ccw,devno=3Dfe.0.0005,drive=3Ddrive-virtio-disk4,id=3Dvirtio-
  disk4,bootindex=3D101,scsi=3Doff

  =

  Ubuntu 18.04.4 LTS qemus390x ttysclp0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865160/+subscriptions

