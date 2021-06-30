Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B604B3B7CC2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 06:29:41 +0200 (CEST)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyRr2-0003wT-R9
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 00:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lyRnO-0007J3-Cn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:36408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lyRnL-0002M1-61
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 00:25:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lyRnG-000380-GL
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 81B5C2E81DE
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Jun 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1826401@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adlu44412 janitor th-huth
X-Launchpad-Bug-Reporter: Adrian Luca (adlu44412)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155619625636.14250.4864237510034054943.malonedeb@gac.canonical.com>
Message-Id: <162502663796.20936.15779201302462759293.malone@loganberry.canonical.com>
Subject: [Bug 1826401] Re: qemu-system-aarch64 has a high cpu usage on windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c11083652ba158ce73cebdfd79e69cf6f7d05a73"; Instance="production"
X-Launchpad-Hash: 7e1b3ac6f4a6fef2678476842156ccdf9c316c98
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
Reply-To: Bug 1826401 <1826401@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826401

Title:
  qemu-system-aarch64 has a high cpu usage on windows

Status in QEMU:
  Expired

Bug description:
  Running qemu-system-aarch64 leads to a high CPU consumption on windows
  10.

  Tested with qemu: 4.0.0-rc4 & 3.1.0 & 2.11.0

  Command: qemu_start_command =3D [
          qemu-system-aarch64,
          "-pidfile",
          target_path + "/qemu" + str(instance) + ".pid",
          "-machine",
          "virt",
          "-cpu",
          "cortex-a57",
          "-nographic",
          "-smp",
          "2",
          "-m",
          "2048",
          "-kernel",
          kernel_path,
          "--append",
          "console=3DttyAMA0 root=3D/dev/vda2 rw ipx=3D" + qemu_instance_ip=
 + "/64 net.ifnames=3D0 biosdevname=3D0",
          "-drive",
          "file=3D" + qemu_instance_img_path + ",if=3Dnone,id=3Dblk",
          "-device",
          "virtio-blk-device,drive=3Dblk",
          "-netdev",
          "socket,id=3Dmynet0,udp=3D127.0.0.1:2000,localaddr=3D127.0.0.1:" =
+ qemu_instance_port,
          "-device",
          "virtio-net-device,netdev=3Dmynet0",
          "-serial",
          "file:" + target_path + "/qemu" + str(instance) + ".log"
      ]

  *The cpu consumption is ~70%.
  *No acceleration used.
  *This CPU consumption is obtained only by running the above command. No w=
orkload on the guest OS.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826401/+subscriptions

