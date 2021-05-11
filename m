Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB18379F25
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:29:37 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKxc-0005DA-Uz
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKu8-00082G-Jh
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:59164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKtv-0003EP-OR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:26:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKtu-0002Id-3e
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E6B2E2E818A
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:18:39 -0000
From: Thomas Huth <1869006@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm passthrough tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson costinel dgilbert-h hrw kiler129
 pmaydell th-huth
X-Launchpad-Bug-Reporter: Marcin Juszkiewicz (hrw)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158514404728.11288.8869885318197124821.malonedeb@soybean.canonical.com>
Message-Id: <162071031975.10453.16388814794178228646.malone@chaenomeles.canonical.com>
Subject: [Bug 1869006] Re: PCIe cards passthrough to TCG guest works on 2GB of
 guest memory but fails on 4GB (vfio_dma_map invalid arg)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 8ae6840c3474cbbaffa8e1ea6d780475a06b9f59
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
Reply-To: Bug 1869006 <1869006@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869006

Title:
  PCIe cards passthrough to TCG guest works on 2GB of guest memory but
  fails on 4GB (vfio_dma_map invalid arg)

Status in QEMU:
  Incomplete

Bug description:
  During one meeting coworker asked "did someone tried to passthrough
  PCIe card to other arch guest?" and I decided to check it.

  Plugged SATA and USB3 controllers into spare slots on mainboard and
  started playing. On 1GB VM instance it worked (both cold- and hot-
  plugged). On 4GB one it did not:

  B=C5=82=C4=85d podczas uruchamiania domeny: internal error: process exite=
d while connecting to monitor: 2020-03-25T13:43:39.107524Z qemu-system-aarc=
h64: -device vfio-pci,host=3D0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D=
0x0: VFIO_MAP_DMA: -22
  2020-03-25T13:43:39.107560Z qemu-system-aarch64: -device vfio-pci,host=3D=
0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: vfio 0000:29:00.0: faile=
d to setup container for group 28: memory listener initialization failed: R=
egion mach-virt.ram: vfio_dma_map(0x563169753c80, 0x40000000, 0x100000000, =
0x7fb2a3e00000) =3D -22 (Invalid argument)

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 75, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 111, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 66, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1279,=
 in startup
      self._backend.create()
    File "/usr/lib64/python3.8/site-packages/libvirt.py", line 1234, in cre=
ate
      if ret =3D=3D -1: raise libvirtError ('virDomainCreate() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: process exited while connecting to =
monitor: 2020-03-25T13:43:39.107524Z qemu-system-aarch64: -device vfio-pci,=
host=3D0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: VFIO_MAP_DMA: -22
  2020-03-25T13:43:39.107560Z qemu-system-aarch64: -device vfio-pci,host=3D=
0000:29:00.0,id=3Dhostdev0,bus=3Dpci.3,addr=3D0x0: vfio 0000:29:00.0: faile=
d to setup container for group 28: memory listener initialization failed: R=
egion mach-virt.ram: vfio_dma_map(0x563169753c80, 0x40000000, 0x100000000, =
0x7fb2a3e00000) =3D -22 (Invalid argument)

  =

  I played with memory and 3054 MB is maximum value possible to boot VM wit=
h coldplugged host PCIe cards.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869006/+subscriptions

