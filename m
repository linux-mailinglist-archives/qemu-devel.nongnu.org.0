Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78228367D82
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:15:38 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVQv-00032M-Ga
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVOB-0001OP-1o
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVO8-0000Ez-Ek
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVO7-0007cr-6m
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 244212E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:01:36 -0000
From: Thomas Huth <1853898@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: tasleson th-huth
X-Launchpad-Bug-Reporter: Tony Asleson (tasleson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157471131796.22652.8509856251989177519.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908209609.22469.1375747605331921068.malone@gac.canonical.com>
Subject: [Bug 1853898] Re: qemu/hw/scsi/lsi53c895a.c:417: lsi_soft_reset:
 Assertion `QTAILQ_EMPTY(&s->queue)' failed.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1844baa8b254ffd912e3d0f274f768146c6fc2cd
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
Reply-To: Bug 1853898 <1853898@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1853898

Title:
  qemu/hw/scsi/lsi53c895a.c:417: lsi_soft_reset: Assertion
  `QTAILQ_EMPTY(&s->queue)' failed.

Status in QEMU:
  Incomplete

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

