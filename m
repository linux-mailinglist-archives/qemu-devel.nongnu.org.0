Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A42100FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 02:32:42 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqQg4-0001HM-Io
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 20:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqQeQ-0000EK-9W
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 20:30:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:45498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqQeM-0005nE-TX
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 20:30:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jqQeI-0003QS-35
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 00:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 164B92E810D
 for <qemu-devel@nongnu.org>; Wed,  1 Jul 2020 00:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2020 00:22:44 -0000
From: costinel <1869006@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm passthrough tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alex-l-williamson costinel dgilbert-h hrw pmaydell
X-Launchpad-Bug-Reporter: Marcin Juszkiewicz (hrw)
X-Launchpad-Bug-Modifier: costinel (costinel)
References: <158514404728.11288.8869885318197124821.malonedeb@soybean.canonical.com>
Message-Id: <159356296459.2919.1158163796925681602.malone@wampee.canonical.com>
Subject: [Bug 1869006] Re: PCIe cards passthrough to TCG guest works on 2GB of
 guest memory but fails on 4GB (vfio_dma_map invalid arg)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7a2365460a2a50b72555dae0bfa3015503ba8775
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 20:30:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

except that in my case the vm does not boot at all no matter how less
memory I allocate to it.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869006

Title:
  PCIe cards passthrough to TCG guest works on 2GB of guest memory but
  fails on 4GB (vfio_dma_map invalid arg)

Status in QEMU:
  New

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

