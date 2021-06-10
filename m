Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543693A2F37
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:22:46 +0200 (CEST)
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMW5-0002Ek-41
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrMUZ-0000DV-Oe
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:21:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:44332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrMUW-0000Nw-QU
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:21:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrMUU-0001NY-6P
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 15:21:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2B8EB2E8135
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 15:21:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 15:11:22 -0000
From: Thomas Huth <1909261@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160885503385.2425.14204282087842438729.malonedeb@soybean.canonical.com>
Message-Id: <162333788238.28173.2051732670661757447.malone@wampee.canonical.com>
Subject: [Bug 1909261] Re: [OSS-Fuzz] Issue 28929 xhci: ASSERT:
 xfer->packet.status != USB_RET_NAK
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 34435575403813e908502ae15d7f901e627d744b
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
Reply-To: Bug 1909261 <1909261@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still reproducible with the current qemu version from git (commit
7fe7fae8b48e3f9c647fd685)

** Tags added: usb

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909261

Title:
  [OSS-Fuzz]  Issue 28929 xhci: ASSERT: xfer->packet.status !=3D
  USB_RET_NAK

Status in QEMU:
  Confirmed

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D

  ./qemu-system-i386 -m 512M -machine q35,accel=3Dqtest \
   -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=3Ddisk0 \
  -device qemu-xhci,id=3Dxhci -device usb-tablet,bus=3Dxhci.0 \
  -device usb-bot -device usb-storage,drive=3Ddisk0 \
  -chardev null,id=3Dcd0 -chardev null,id=3Dcd1 \
  -device usb-braille,chardev=3Dcd0 -device usb-ccid \
  -device usb-ccid -device usb-kbd -device usb-mouse \
  -device usb-serial,chardev=3Dcd1 -device usb-tablet \
  -device usb-wacom-tablet -device usb-audio \
  -qtest stdio -nographic -nodefaults < attachment

  =3D=3D=3D Stack Trace =3D=3D=3D
  #0 raise
  #1 abort
  #2 libc.so.6
  #3 __assert_fail
  #4 xhci_kick_epctx /src/qemu/hw/usb/hcd-xhci.c:1865:13
  #5 xhci_ep_kick_timer /src/qemu/hw/usb/hcd-xhci.c:1034:5
  #6 timerlist_run_timers /src/qemu/util/qemu-timer.c:574:9
  #7 qemu_clock_run_timers /src/qemu/util/qemu-timer.c:588:12
  #8 qtest_clock_warp /src/qemu/softmmu/qtest.c:356:9
  #9 qtest_process_command /src/qemu/softmmu/qtest.c:752:9
  #10 qtest_process_inbuf /src/qemu/softmmu/qtest.c:797:9
  #11 qtest_server_inproc_recv /src/qemu/softmmu/qtest.c:904:9
  #12 send_wrapper /src/qemu/tests/qtest/libqtest.c:1390:5
  #13 qtest_sendf /src/qemu/tests/qtest/libqtest.c:438:5
  #14 qtest_clock_step_next /src/qemu/tests/qtest/libqtest.c:912:5
  #15 op_clock_step /src/qemu/tests/qtest/fuzz/generic_fuzz.c:574:5

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D28929

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909261/+subscriptions

