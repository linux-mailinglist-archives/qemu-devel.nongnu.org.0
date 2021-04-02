Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC613526BC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 08:52:16 +0200 (CEST)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSDfD-0002WA-3K
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 02:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDdt-0001ro-Hl
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:50:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lSDdr-0008Ot-9T
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 02:50:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lSDdp-0007dE-4b
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 06:50:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7BA9D2E8170
 for <qemu-devel@nongnu.org>; Fri,  2 Apr 2021 06:50:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Apr 2021 06:38:08 -0000
From: Toolybird <1922325@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: toolybird
X-Launchpad-Bug-Reporter: Toolybird (toolybird)
X-Launchpad-Bug-Modifier: Toolybird (toolybird)
Message-Id: <161734548902.18419.14050704437268299293.malonedeb@soybean.canonical.com>
Subject: [Bug 1922325] [NEW] s390x-virtio-gpu-ccw module unnecessary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 203a7adefd7636ad60f7d93e10912cae942e3835
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
Reply-To: Bug 1922325 <1922325@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi

Test building latest 6.0.0 release candidate on x86_64 host. A new
module has appeared:

/usr/lib/qemu/hw-s390x-virtio-gpu-ccw.so

Unless I'm missing something obvious, it would appear to be only useful
on s390x platform.

Why would I need this? For me it doesn't seem to do much:

$ nm -D /usr/lib/qemu/hw-s390x-virtio-gpu-ccw.so
                 w __cxa_finalize
                 w __gmon_start__
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
00000000000010f0 T qemu_module_dummy
0000000000001100 T qemu_stamp_0d4aa0592256528f9885a56f182883665e60f8ec

Bug or ... ?

Thanks

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922325

Title:
  s390x-virtio-gpu-ccw module unnecessary?

Status in QEMU:
  New

Bug description:
  Hi

  Test building latest 6.0.0 release candidate on x86_64 host. A new
  module has appeared:

  /usr/lib/qemu/hw-s390x-virtio-gpu-ccw.so

  Unless I'm missing something obvious, it would appear to be only
  useful on s390x platform.

  Why would I need this? For me it doesn't seem to do much:

  $ nm -D /usr/lib/qemu/hw-s390x-virtio-gpu-ccw.so
                   w __cxa_finalize
                   w __gmon_start__
                   w _ITM_deregisterTMCloneTable
                   w _ITM_registerTMCloneTable
  00000000000010f0 T qemu_module_dummy
  0000000000001100 T qemu_stamp_0d4aa0592256528f9885a56f182883665e60f8ec

  Bug or ... ?

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922325/+subscriptions

