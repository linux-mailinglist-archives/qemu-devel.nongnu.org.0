Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8229D48
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 19:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUE9b-0005qq-Q2
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 13:38:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUE5h-0002rC-KB
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUE5g-0008S8-Hw
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:34:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:57594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hUE5g-0008R4-CS
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:34:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hUE5f-0004Wj-BR
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 17:34:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 55A5D2E8055
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 17:34:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 May 2019 17:24:54 -0000
From: Thomas Huth <1585971@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: antonios-dimtsoudis th-huth
X-Launchpad-Bug-Reporter: TuniTunes (antonios-dimtsoudis)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160526095955.26642.69942.malonedeb@chaenomeles.canonical.com>
Message-Id: <155871869463.12691.11196929021173801308.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 676f67e5f6c7961416df184e2e67b9a7e11c617f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1585971] Re: Host system crashes on qemu with DMA
 remapping
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1585971 <1585971@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Triaging old bug tickets ... Can you still reproduce the issue with the
latest version of QEMU and the kernel, or could we close this bug
nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1585971

Title:
  Host system crashes on qemu with DMA remapping

Status in QEMU:
  Incomplete

Bug description:
  Hy,

  the host system crashes completely, when i try to pass an physical
  device without boot option intel_iommu=3Don set. In older kernel
  versions you didn't have to pass that option.

  I wonder if this can be easily checked by asking iommu state, avoiding
  a crash of the complete system.

  My data:
  cpu model: Intel(R) Core(TM) i7 CPU
  qemu version: 2.4.1-r2
  kernel version: 4.1.2 x86_64
  command line: =

  qemu-system-x86_64 -enable-kvm -drive file=3D/vms/prod/fw/fw.iso,if=3Dvir=
tio,format=3Draw -drive file=3D/vms/prod/fw/swap,if=3Dvirtio,format=3Draw -=
drive file=3D/vms/prod/fw/fwdata.iso,if=3Dvirtio,format=3Draw -m 512 -nogra=
phic -kernel /data/kernels/vmlinuz-2.6.36-gentoo-r8 -append "root=3D/dev/vd=
a console=3DttyS0 earlyprintk=3Dserial" -net nic,model=3Dvirtio,macaddr=3DD=
E:AD:BE:EF:2D:AD -net tap,ifname=3Dtapfw0,script=3D/etc/qemu/qemu-ifup -dev=
ice pci-assign,host=3D03:00.0

  There are also more detailed informations (if needed) here:
  https://forums.gentoo.org/viewtopic-p-7923976.html

  Thanks,
  Antonios.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1585971/+subscriptions

