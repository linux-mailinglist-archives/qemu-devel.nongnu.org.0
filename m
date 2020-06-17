Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDEB1FC5CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 07:51:56 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlQzL-0001in-CU
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 01:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlQyG-0001Hv-5T
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 01:50:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlQyE-0004L8-9U
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 01:50:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlQyC-0004cJ-G9
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 05:50:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 530232E810A
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 05:50:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2020 05:43:15 -0000
From: Thomas Huth <1810000@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: usb xhci
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balaton-4 benquike bugs-syssec th-huth
X-Launchpad-Bug-Reporter: PH (benquike)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154603590627.5548.1380267988808710453.malonedeb@wampee.canonical.com>
Message-Id: <159237259612.29075.5211517205869424114.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1810000] Re: qemu system emulator crashed when using xhci usb
 controller
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 19572bdc9f3e108cdf9eeb0559b40cd9441c1d63
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:25:49
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
Reply-To: Bug 1810000 <1810000@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Summary changed:

- qemu system emulator crashed with the attachment of usb-bt-dongle device
+ qemu system emulator crashed when using xhci usb controller

** Tags added: usb xhci

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1810000

Title:
  qemu system emulator crashed when using xhci usb controller

Status in QEMU:
  New

Bug description:
  I am testing usb-bt-dongle device on xchi host controller, and found
  that the qemu crashed directly with an assertion failer.

  Here is the information to reproduce the crash:

  Qemu git revision: 9b2e891ec5ccdb4a7d583b77988848282606fdea
  System emulator: qemu-x86_64
  VM image: https://people.debian.org/~aurel32/qemu/amd64/debian_squeeze_am=
d64_desktop.qcow2
  CommandLine: qemu-system-x86_64 -M q35 -device qemu-xhci,id=3Dxhci -enabl=
e-kvm -device usb-bt-dongle  -hda ./debian_wheezy_amd64_standard.qcow2

  Error message:

  qemu-system-x86_64: /build/qemu-
  Eap4uc/qemu-2.11+dfsg/hw/usb/core.c:592: usb_packet_copy: Assertion
  `p->actual_length + bytes <=3D iov->size' failed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1810000/+subscriptions

