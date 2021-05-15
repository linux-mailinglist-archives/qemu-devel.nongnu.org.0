Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FB3817C6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:52:23 +0200 (CEST)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhru9-0003hq-80
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrsV-0002Kh-D9
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:53928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhrsT-0001wK-JO
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhrsR-00064i-Am
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 503CE2E805D
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 10:41:31 -0000
From: Thomas Huth <1922325@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth toolybird
X-Launchpad-Bug-Reporter: Toolybird (toolybird)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161734548902.18419.14050704437268299293.malonedeb@soybean.canonical.com>
Message-Id: <162107529120.2004.12264306708393467822.malone@wampee.canonical.com>
Subject: [Bug 1922325] Re: s390x-virtio-gpu-ccw module unnecessary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: c6d4bca929736e65be1b2940a2277b418cd276fe
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
Reply-To: Bug 1922325 <1922325@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

How did you run the configure script? The virtio-gpu-ccw device is part
of the qemu-system-s390x emulator, so unless you disabled that build,
the module will of course be there.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922325

Title:
  s390x-virtio-gpu-ccw module unnecessary?

Status in QEMU:
  Incomplete

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

