Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECE377C3A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 08:23:05 +0200 (CEST)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfzJo-0008Lq-AK
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 02:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfzHc-0007e6-4L
 for qemu-devel@nongnu.org; Mon, 10 May 2021 02:20:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:35874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfzHX-00011J-Mq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 02:20:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfzHV-000596-AB
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 24AD82E8194
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 06:07:35 -0000
From: Thomas Huth <1904464@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffontaine th-huth
X-Launchpad-Bug-Reporter: Fabrice Fontaine (ffontaine)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160555959985.17306.1370815502265671907.malonedeb@wampee.canonical.com>
Message-Id: <162062685587.3111.5720450728247974776.malone@wampee.canonical.com>
Subject: [Bug 1904464] Re: Build fails with 64 bits time_t
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: fe20657b8599de841f803e93c9c680ed2ff537f1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1904464 <1904464@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabrice, thanks for moving the ticket here:
https://gitlab.com/qemu-project/qemu/-/issues/246
... so I'm closing this one on Launchpad now.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #246
   https://gitlab.com/qemu-project/qemu/-/issues/246

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904464

Title:
  Build fails with 64 bits time_t

Status in QEMU:
  Invalid

Bug description:
  time element is deprecated on new input_event structure in kernel's
  input.h [1]

  This will avoid the following build failure:

  hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_statu=
s':
  hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no m=
ember named 'time'
    198 |     if (gettimeofday(&evdev.time, NULL)) {
        |                            ^

  Fixes:
   - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df8=
6d3d599d5
   - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429=
c51e43bbb

  [1]
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
?id=3D152194fe9c3f

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904464/+subscriptions

