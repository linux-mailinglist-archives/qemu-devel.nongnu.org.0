Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09405374F1D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:57:26 +0200 (CEST)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leX0h-0004jJ-SO
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWzL-0003Rt-DW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:55:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWzJ-0008HZ-Rf
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:55:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leWzI-0006PU-Dx
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:55:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4ED3B2E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 05:55:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:46:17 -0000
From: Thomas Huth <1863710@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chriscjsus th-huth
X-Launchpad-Bug-Reporter: Chris S. (chriscjsus)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158200914380.31311.6636278385327327157.malonedeb@wampee.canonical.com>
Message-Id: <162027997764.14052.12471380749762092951.malone@soybean.canonical.com>
Subject: [Bug 1863710] Re: qemu 4.2 does not process discard(trim) commands 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 6ec3dbd5eab09cdcedddcb53f2fa82b6f6dbe58a
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
Reply-To: Bug 1863710 <1863710@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

How did you start QEMU? Does this still happen with the latest version
of QEMU?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863710

Title:
  qemu 4.2 does not process discard(trim) commands

Status in QEMU:
  Incomplete

Bug description:
  I'm using Arch Linux with qemu 4.2 and blktrace to monitor discard
  commands as they are sent to the hardware.  Blktrace shows nothing as
  the VM is trimming the SSDs.

  I downgraded to qemu 4.1.1 and blktrace shows lots of discard commands
  as the VM is trimming.

  Kernel version is 5.5.4.

  Attached is the libvirt xml.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863710/+subscriptions

