Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D02DD021
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:12:51 +0100 (CET)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprDG-0001Xq-RB
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kprBx-0000dI-9u
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:11:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:39350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kprBt-0006LL-H6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:11:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kprBr-0004Ud-Is
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:11:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 710432E813B
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:11:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Dec 2020 10:56:50 -0000
From: "Cheol-Woo,Myung" <1901532@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Cheol-Woo,Myung (cwmyung)
References: <160371197903.29636.2526014342409272320.malonedeb@chaenomeles.canonical.com>
Message-Id: <160820261082.3756.6089855991533015865.launchpad@gac.canonical.com>
Subject: [Bug 1901532] Re: Assertion failure `mr != NULL' failed through
 usb-ehci
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: eaf6c0205d44c3b7572ca42e042bbfd3e9703613
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
Reply-To: Bug 1901532 <1901532@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Confirmed

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2020-25723

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1901532

Title:
  Assertion failure `mr !=3D NULL' failed through usb-ehci

Status in QEMU:
  Confirmed

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  usb-ehci.

  This was found in version 5.0.1 (stable-5.0).

  --------

  qemu-system-i386: src/qemu-repro/exec.c:3581: address_space_unmap: Assert=
ion `mr !=3D NULL' failed.
  [1]    14721 abort      src/qemu-repro/build/i386-softmmu/qemu-system-i386

  =

  To reproduce the assertion failure, please run the QEMU with following co=
mmand line.

  ```
  $ qemu-system-i386 -drive file=3D./hyfuzz.img,index=3D0,media=3Ddisk,form=
at=3Draw -m 512 -drive if=3Dnone,id=3Dstick,file=3D./usbdisk.img -device us=
b-ehci,id=3Dehci -device usb-storage,bus=3Dehci.0,drive=3Dstick
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901532/+subscriptions

