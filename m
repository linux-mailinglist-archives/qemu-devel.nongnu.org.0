Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441082921F5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 06:31:21 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUMpL-00066W-SR
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 00:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kUMoU-0005aP-Ch
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 00:30:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kUMoQ-00054y-Jc
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 00:30:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kUMoN-0002A2-Nc
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 04:30:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9C25E2E811E
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 04:30:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2020 04:17:16 -0000
From: Launchpad Bug Tracker <1253563@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amoskong janitor th-huth
X-Launchpad-Bug-Reporter: Amos Jianjun Kong (amoskong)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20131121092412.27241.16050.malonedeb@gac.canonical.com>
Message-Id: <160308103683.341.5128243273870697645.malone@loganberry.canonical.com>
Subject: [Bug 1253563] Re: bad performance with rng-egd backend
X-Launchpad-Message-Rationale: Subscriber @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="58bb2f3096f16f0e0acc917602669aecb4ffaf54"; Instance="production"
X-Launchpad-Hash: e9c563cae39e40c2e0f467780eb64057ffe8aead
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 00:30:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1253563 <1253563@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1253563

Title:
  bad performance with rng-egd backend

Status in QEMU:
  Expired

Bug description:
  =

  1. create listen socket
  # cat /dev/random | nc -l localhost 1024

  2. start vm with rng-egd backend

  ./x86_64-softmmu/qemu-system-x86_64 --enable-kvm -mon chardev=3Dqmp,mode=
=3Dcontrol,pretty=3Don -chardev socket,id=3Dqmp,host=3Dlocalhost,port=3D123=
4,server,nowait -m 2000 -device virtio-net-pci,netdev=3Dh1,id=3Dvnet0 -netd=
ev tap,id=3Dh1 -vnc :0 -drive file=3D/images/RHEL-64-virtio.qcow2 \
  -chardev socket,host=3Dlocalhost,port=3D1024,id=3Dchr0 \
  -object rng-egd,chardev=3Dchr0,id=3Drng0 \
  -device virtio-rng-pci,rng=3Drng0,max-bytes=3D1024000,period=3D1000

  (guest) # dd if=3D/dev/hwrng of=3D/dev/null

  note: cancelling dd process by Ctrl+c, it will return the read speed.

  Problem:   the speed is around 1k/s

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  If I use rng-random backend (filename=3D/dev/random), the speed is about
  350k/s).

  It seems that when the request entry is added to the list, we don't read =
the data from queue list immediately.
  The chr_read() is delayed, the virtio_notify() is delayed.  the next requ=
est will also be delayed. It effects the speed.

  I tried to change rng_egd_chr_can_read() always returns 1,  the speed
  is improved to (about 400k/s)

  Problem: we can't poll the content in time currently

  =

  Any thoughts?

  Thanks, Amos

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1253563/+subscriptions

