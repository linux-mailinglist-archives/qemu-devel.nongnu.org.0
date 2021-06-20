Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A13ADCD4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:33:38 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup9N-0001HH-Ln
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2I-0000Zt-Ga
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:18 -0400
Received: from indium.canonical.com ([91.189.90.7]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup2G-0002qo-HU
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup23-0003YF-3x
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9AC842E8251
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1809684@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kb9vqf th-huth
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154569397586.26258.18132613460124027534.malonedeb@chaenomeles.canonical.com>
Message-Id: <162416264213.7948.4674388448308095141.malone@loganberry.canonical.com>
Subject: [Bug 1809684] Re: amdgpu passthrough on POWER9 (ppc64el) not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: aecbdef72b03570ff6e676d22e64a1d06ebd323f
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1809684

Title:
  amdgpu passthrough on POWER9 (ppc64el) not working

Status in QEMU:
  Expired

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

