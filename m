Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AA3AFBF5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:29:41 +0200 (CEST)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvY2e-00069H-Li
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzH-0005op-R5
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:55590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzD-0004mn-46
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXz7-00014F-7k
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5AE652E81AF
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:45 -0000
From: Launchpad Bug Tracker <1853898@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor tasleson th-huth
X-Launchpad-Bug-Reporter: Tony Asleson (tasleson)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157471131796.22652.8509856251989177519.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433552524.20423.9856045256184491711.malone@loganberry.canonical.com>
Subject: [Bug 1853898] Re: qemu/hw/scsi/lsi53c895a.c:417: lsi_soft_reset:
 Assertion `QTAILQ_EMPTY(&s->queue)' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 72c9235c20e730532e928245acbcdf0f98a3f8ee
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
Reply-To: Bug 1853898 <1853898@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1853898

Title:
  qemu/hw/scsi/lsi53c895a.c:417: lsi_soft_reset: Assertion
  `QTAILQ_EMPTY(&s->queue)' failed.

Status in QEMU:
  Expired

Bug description:
  While experimenting with blkdebug I can consistently hit this
  assertion in lsi53c895a.c.

  Using locally built from master, commit:
  2061735ff09f9d5e67c501a96227b470e7de69b1

  Steps to reproduce

  $ qemu-img create -f raw empty.raw 8G
  $ sudo losetup -f --show empty.raw
  $ sudo mkfs.ext3 /dev/loop0
  $ sudo losetup -D

  $ cat blkdebug.conf =

  [inject-error]
  event =3D "read_aio"
  errno =3D "5"

  $ qemu-system-x86_64 -enable-kvm -m 2048 -cpu host -smp 4 -nic
  user,ipv6=3Doff,model=3De1000,hostfwd=3Dtcp::2222-:22,net=3D172.16.0.0/25=
5.255.255.0
  -device lsi53c895a,id=3Dscsi -device scsi-hd,drive=3Dhd,wwn=3D12345678
  -drive
  if=3Dscsi,id=3Dhd,file=3Dblkdebug:blkdebug.conf:empty.raw,cache=3Dnone,fo=
rmat=3Draw
  -cdrom Fedora-Server-dvd-x86_64-31-1.9.iso -display gtk

  Initiate install from cdrom ISO image results in:

  qemu-system-x86_64: /builddir/build/BUILD/qemu-3.1.1/hw/scsi/lsi53c895a.c=
:381: lsi_soft_reset: Assertion `QTAILQ_EMPTY(&s->queue)' failed.
  Aborted (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1853898/+subscriptions

