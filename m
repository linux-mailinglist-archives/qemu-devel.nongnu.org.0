Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9573381C55
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:56:42 +0200 (CEST)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li7tQ-0005j0-Tk
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1li7sW-0004xG-FJ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:55:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1li7sT-0006fQ-OD
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:55:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1li7sR-0003fq-DD
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 03:55:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 381792E8193
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 03:55:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 May 2021 03:47:55 -0000
From: Toolybird <1922325@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth toolybird
X-Launchpad-Bug-Reporter: Toolybird (toolybird)
X-Launchpad-Bug-Modifier: Toolybird (toolybird)
References: <161734548902.18419.14050704437268299293.malonedeb@soybean.canonical.com>
Message-Id: <162113687583.1840.2786925975909600515.malone@wampee.canonical.com>
Subject: [Bug 1922325] Re: s390x-virtio-gpu-ccw module unnecessary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: d4e20a6f4a73c5a67b959670b0998fe8be8816a0
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
Reply-To: Bug 1922325 <1922325@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I only enable a few emulators and qemu-system-s390x isn't one of them.

I was thinking it couldn't be useful on an x86_64 host, even if using
the qemu-system-s390x emulator! I guess my understanding was wrong. Will
close as invalid.

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922325

Title:
  s390x-virtio-gpu-ccw module unnecessary?

Status in QEMU:
  Invalid

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

