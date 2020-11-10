Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6E2ACB9E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 04:22:53 +0100 (CET)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcKFA-0003sV-QV
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 22:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcKDB-00026t-19
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:20:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:51328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcKD8-0004OX-M7
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:20:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcKD5-0004qS-KO
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 993932E8055
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 03:14:00 -0000
From: Thomas Huth <1731347@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822 jfalke th-huth
X-Launchpad-Bug-Reporter: Johannes Falke (jfalke)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151026612898.3153.4753501294134415779.malonedeb@gac.canonical.com>
Message-Id: <160497804103.28488.4335894559623931484.malone@chaenomeles.canonical.com>
Subject: [Bug 1731347] Re: VFIO Passthrough of SAS2008-based HBA card fails on
 E3-1225v3 due to failed DMA mapping (-14)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 8a713b37e6c70a90b0faa4e310b2bafbff2f07c3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:35:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1731347 <1731347@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1731347

Title:
  VFIO Passthrough of SAS2008-based HBA card fails on E3-1225v3 due to
  failed DMA mapping (-14)

Status in QEMU:
  Incomplete

Bug description:
  There is a bug preventing multiple people with my combination of
  hardware from using PCI passthrough. I am not actually sure whether
  the bug is in kernel/kvm, vfio or qemu, however, as qemu is the
  highest-level of these, I am reporting the bug here as you will likely
  know better where the origin of the bug may be found.

  When attempting to pass through this device to a KVM using VFIO, this
  results in error -14 (Bad Address):

  # qemu-system-x86_64 -enable-kvm -m 10G -net none -monitor stdio -serial
  # none -parallel none -vnc :1 -device vfio-pci,host=3D1:00.0 -S
  QEMU 2.9.1 monitor - type 'help' for more information
  (qemu) c
  (qemu) qemu-system-x86_64: VFIO_MAP_DMA: -14
  qemu-system-x86_64: vfio_dma_map(0x7f548f0a1fc0, 0xfebd0000, 0x2000, 0x7f=
54a909d000) =3D -14 (Bad address)
  qemu: hardware error: vfio: DMA mapping failed, unable to continue

  See also:
  https://bugzilla.proxmox.com/show_bug.cgi?id=3D1556
  https://www.redhat.com/archives/vfio-users/2016-May/msg00088.html

  This has occurred on Proxmox (Proxmox and Debian packages, Ubuntu kernel)=
, Ubuntu,
  and pure Debian packages and kernel on Proxmox. However, this error
  reportedly does NOT occur for:

  - different distributions(!) (Fedora 24, 25)
  - different HBA cards (SAS2308, SAS3008)
  - different CPU (E3-1220v5)

  I would be thankful for any input and I'll be happy to provide any
  further info necessary. This is my first time delving this deep into
  anything close to the kernel.

  Thanks and best regards,
  Johannes Falke

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1731347/+subscriptions

