Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB9365430
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:33:24 +0200 (CEST)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYloy-0004VD-0C
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlit-0004oK-Nf
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:59116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlio-0002bx-Fd
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlil-00028c-QK
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A26CC2E8189
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:02:21 -0000
From: Thomas Huth <1809684@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kb9vqf th-huth
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154569397586.26258.18132613460124027534.malonedeb@chaenomeles.canonical.com>
Message-Id: <161890574172.10441.5759869930863391216.malone@chaenomeles.canonical.com>
Subject: [Bug 1809684] Re: amdgpu passthrough on POWER9 (ppc64el) not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 5097942dd394010ce79a4c63daeaadb0e6fa3c78
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
Reply-To: Bug 1809684 <1809684@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1809684

Title:
  amdgpu passthrough on POWER9 (ppc64el) not working

Status in QEMU:
  Incomplete

Bug description:
  When attempting to pass a Vega 56 GPU to a virtualized guest using
  QEMU 3.1 on ppc64el (POWER9), the guest is unable to initialize the
  GPU.  Further digging reveals the driver attempting to allocate a
  large BAR, which then fails:

  [    6.058544] [drm] PCI I/O BAR is not found.
  <snip uninteresting bits>
  [    6.679193] amdgpu 0000:00:03.0: BAR 2: releasing [mem 0x210400000000-=
0x2104001fffff pref]
  [    6.679306] amdgpu 0000:00:03.0: BAR 0: releasing [mem 0x210200000000-=
0x2103ffffffff pref]
  [    6.679361] amdgpu 0000:00:03.0: BAR 0: no space for [mem size 0x20000=
0000 pref]
  [    6.679403] amdgpu 0000:00:03.0: BAR 0: failed to assign [mem size 0x2=
00000000 pref]
  [    6.679444] amdgpu 0000:00:03.0: BAR 2: assigned [mem 0x200080200000-0=
x2000803fffff pref]
  [    6.681420] amdgpu 0000:00:03.0: VRAM: 8176M 0x000000F400000000 - 0x00=
0000F5FEFFFFFF (8176M used)
  [    6.681507] amdgpu 0000:00:03.0: GART: 512M 0x0000000000000000 - 0x000=
000001FFFFFFF
  [    6.681594] amdgpu 0000:00:03.0: AGP: 267419648M 0x000000F800000000 - =
0x0000FFFFFFFFFFFF
  [    6.681653] [drm] Detected VRAM RAM=3D8176M, BAR=3D0M
  [    6.681688] [drm] RAM width 2048bits HBM
  [    6.681885] [TTM] Zone  kernel: Available graphics memory: 4176288 kiB
  [    6.681978] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
  [    6.682043] [TTM] Initializing pool allocator
  [    6.682159] [drm] amdgpu: 8176M of VRAM memory ready
  [    6.682249] [drm] amdgpu: 6117M of GTT memory ready.
  [    6.682387] [drm] GART: num cpu pages 8192, num gpu pages 131072
  [    6.682466] amdgpu 0000:00:03.0: (-22) kernel bo map failed
  [    6.682539] [drm:amdgpu_device_init [amdgpu]] *ERROR* amdgpu_vram_scra=
tch_init failed -22
  [    6.682592] amdgpu 0000:00:03.0: amdgpu_device_ip_init failed
  [    6.682636] amdgpu 0000:00:03.0: Fatal error during GPU init

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1809684/+subscriptions

