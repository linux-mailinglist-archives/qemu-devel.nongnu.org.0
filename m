Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616381E3B2E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 10:02:28 +0200 (CEST)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdr16-0000s0-Bk
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 04:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jdr0O-0000RG-3y
 for qemu-devel@nongnu.org; Wed, 27 May 2020 04:01:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jdr0M-0002aK-Tp
 for qemu-devel@nongnu.org; Wed, 27 May 2020 04:01:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jdr0J-0006Hc-1r
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 08:01:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1A5BA2E8110
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 08:01:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2020 07:54:59 -0000
From: Martin Liska <1874073@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mliska philmd pmaydell
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Martin Liska (mliska)
References: <158747496330.1952.6391008472811579405.malonedeb@chaenomeles.canonical.com>
Message-Id: <159056609924.1326.8510053951552332696.malone@chaenomeles.canonical.com>
Subject: [Bug 1874073] Re: openrisc_sim.c:87:42: error: 'cpu_irqs[0]' may be
 used uninitialized in this function [-Werror=maybe-uninitialized]
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1f7bc749b40714a4cc10f5e4d787118a78037035";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 14599a4aa8f62e985c1bb6064aeee5869e1f6059
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:00:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1874073 <1874073@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello. The assert approach is preferred.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874073

Title:
  openrisc_sim.c:87:42: error: 'cpu_irqs[0]' may be used uninitialized
  in this function [-Werror=3Dmaybe-uninitialized]

Status in QEMU:
  New

Bug description:
  I see the warning since gcc10:

  static void openrisc_sim_init(MachineState *machine):
  ...
      qemu_irq *cpu_irqs[2];
  ...

  =

      serial_mm_init(get_system_memory(), 0x90000000, 0, serial_irq,
                     115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);

  I would initialize cpu_irqs[2] with {}.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874073/+subscriptions

