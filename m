Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5781F7AF4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:33:09 +0200 (CEST)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlg4-0003Wh-I6
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jjldp-0002Cm-67
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 11:30:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:60132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jjldl-0001II-HW
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 11:30:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jjldj-00038L-Md
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 15:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A9A0B2E8052
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 15:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2020 15:23:53 -0000
From: Diego Viola <1882851@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola kraxel-redhat
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Diego Viola (diego-viola)
References: <159174217343.32241.17743917589333297614.malonedeb@gac.canonical.com>
Message-Id: <159197543361.7707.16090372527322896903.malone@gac.canonical.com>
Subject: [Bug 1882851] Re: QEMU video freezes with "Guest disabled display"
 (virtio driver)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 63a2b3d2158c51803ccf5c7d22fc47679f8b3a1f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 10:45:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1882851 <1882851@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sway log after the crash.

** Attachment added: "swaylog.txt"
   https://bugs.launchpad.net/qemu/+bug/1882851/+attachment/5383276/+files/=
swaylog.txt

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882851

Title:
  QEMU video freezes with "Guest disabled display" (virtio driver)

Status in QEMU:
  New

Bug description:
  I am using Arch Linux as my Guest and Host OS, after starting qemu
  with the following command:

    $ qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga
  virtio

  and waiting for a screen blank, I get this message:

    Guest disabled display

  And nothing happens after that, I can move the mouse or hit any key,
  and the message is still there.

  I can still reboot the VM but that's not optimal.

  I can reproduce this with the latest QEMU release (5.0.0) or git master, =

  I also tried this with older releases (4.0.0, 3.0.0) and the issue is sti=
ll there.

  I can't reproduce this with other video drivers (std, qxl).

  With std/qxl the screen will blank a bit and then continue as normal.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882851/+subscriptions

