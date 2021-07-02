Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C60C3B9B7B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:28:35 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAn3-0002R3-KK
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkU-00087x-2j
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:42366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkQ-0002Lo-EV
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkL-000534-0x
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AED142E8181
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:32 -0000
From: Launchpad Bug Tracker <1861394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jurand0289 th-huth
X-Launchpad-Bug-Reporter: Wojtek Lewandowski (jurand0289)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158038104311.4545.16494729596486297372.malonedeb@soybean.canonical.com>
Message-Id: <162519945217.31921.14200229056789222688.malone@loganberry.canonical.com>
Subject: [Bug 1861394] Re: qemu-system-riscv64 hangs after poweroff linux
 command
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 73a6d08e04031f4d3d38d8cf49b6569af04f0402
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
Reply-To: Bug 1861394 <1861394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861394

Title:
  qemu-system-riscv64 hangs after poweroff linux command

Status in QEMU:
  Expired

Bug description:
  QEMU Version : v4.2.0-773-g43d1455-dirty (commit
  43d1455cf84283466e5c22a217db5ef4b8197b14)

  Command: qemu-system-riscv64 -machine virt -kernel ./bbl -nographic
  -initrd rootfs.cpio.gz -append "root=3D/dev/ram console=3DttyS0"

  Host:LSB Version:    :core-4.1-amd64:core-4.1-noarch
  Distributor ID: CentOS
  Description:    CentOS Linux release 7.7.1908 (Core)
  Release:        7.7.1908
  Codename:       Core

  Problem: after boot, when type poweroff -f it hangs (not quitting). I
  have tested this for x86_64, and aarch64 and it works fine. The
  problem appears only for risv64(of those mentioned). Last time I have
  checked, it worked  for all the mentioned architectures. It was on the
  d0f90e1423b4f412adc620eee93e8bfef8af4117 commit

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861394/+subscriptions

