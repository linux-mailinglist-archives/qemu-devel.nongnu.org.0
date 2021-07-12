Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C43C430D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:30:54 +0200 (CEST)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nan-0007c5-Au
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWQ-0007XF-Gi
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWN-0006Jx-Oo
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWJ-0005KS-5h
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ABC4F2E8211
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:58 -0000
From: Launchpad Bug Tracker <1913926@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth thebrokenrail
X-Launchpad-Bug-Reporter: Connor Nolan (thebrokenrail)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161206914438.15196.14441299741082258468.malonedeb@wampee.canonical.com>
Message-Id: <162606347850.2726.6101825494058251553.malone@loganberry.canonical.com>
Subject: [Bug 1913926] Re: [QEMU User-Mode] Mesa Fails To Load RadeonSI Driver
 When In Docker Image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 14c579f5641f12d50e9d7377cc5ae7c22e9a3937
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1913926 <1913926@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913926

Title:
  [QEMU User-Mode] Mesa Fails To Load RadeonSI Driver When In Docker
  Image

Status in QEMU:
  Expired

Bug description:
  # System Details
  AMD Ryzen 7 3700U
  Ubuntu 20.04 Focal Focus

  # Dockerfile

  FROM arm32v7/debian:bullseye

  RUN apt-get update && apt-get install -y mesa-utils

  ENTRYPOINT glxgears

  # Instructions For Reproduction
  1. Install Docker
  2. Build Docker Image: docker build --tag mesa-arm-test .
  3. Run: docker run -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri:/de=
v/dri -e "DISPLAY=3D${DISPLAY}" mesa-arm-test

  The Output Is:

  amdgpu_device_initialize: amdgpu_query_info(ACCEL_WORKING) failed (-38)
  amdgpu: amdgpu_device_initialize failed.
  libGL error: failed to create dri screen
  libGL error: failed to load driver: radeonsi
  libGL error: failed to get magic
  libGL error: failed to load driver: radeonsi

  It then appears to run using software rendering.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913926/+subscriptions

