Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AAE36F860
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:18:38 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQEH-0004Nc-2a
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQBi-0002jQ-PU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:15:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:49986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcQBf-0007Gp-BP
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:15:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcQBc-0003KC-79
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:15:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC9C72E8172
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:15:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 10:08:49 -0000
From: Thomas Huth <1826401@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adlu44412 th-huth
X-Launchpad-Bug-Reporter: Adrian Luca (adlu44412)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155619625636.14250.4864237510034054943.malonedeb@gac.canonical.com>
Message-Id: <161977732937.14537.487586040440900562.malone@wampee.canonical.com>
Subject: [Bug 1826401] Re: qemu-system-aarch64 has a high cpu usage on windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: b0d7a2ebaf890729bd4d9df4a3d853ae3fdf5433
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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

Looking through old bug tickets... is this still an issue with the latest v=
ersion of QEMU? Or could we close this ticket nowadays?
Also, what guest operating systems were you running ?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826401

Title:
  qemu-system-aarch64 has a high cpu usage on windows

Status in QEMU:
  Incomplete

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

