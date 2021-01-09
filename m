Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FC2EFDB4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:31:30 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5uT-00053Y-B4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pk-0008Gb-DP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:46888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5ph-0006wl-U8
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pe-0006q5-GT
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 19C192E81A6
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:52 -0000
From: Launchpad Bug Tracker <1716132@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kelvin-middleton th-huth
X-Launchpad-Bug-Reporter: Kelvin Middleton (kelvin-middleton)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150496592440.23639.12760780482468469571.malonedeb@wampee.canonical.com>
Message-Id: <161016587251.8490.8380487636563985966.malone@loganberry.canonical.com>
Subject: [Bug 1716132] Re: Win 10 bitlocker won't initialise pass-through TPM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: e60af7ddc0c65a4c623be93780a04d0b7a38002c
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
Reply-To: Bug 1716132 <1716132@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1716132

Title:
  Win 10 bitlocker won't initialise pass-through TPM

Status in QEMU:
  Expired

Bug description:
  All stock Ubuntu Zesty, Win10Pro KVM guest configured with OVMF and
  Q35.  My host has an ASRock Z97 Extreme 6 board with a TPM header
  which is populated with v1.2 complaint device.

  Testing in my host the TPM device is function, I can tpm_takeownership
  and tpm_clear successfully and similar testing by passing the device
  through to a linux guest also succeeds.

  However using Bitlocker in Windows 10 Pro release 1703 Windows advises
  it cannot "Prepare" the device which I take to mean it cannot take
  ownership of it.  I believe this to be related to Windows inability to
  view the TCG Event Log which is evidenced in the below 2 screencaps,
  however I'm no expert.

  https://s26.postimg.org/vter35eh5/Screenshot_20170907_114644.png
  https://s26.postimg.org/klo854qyx/Screenshot_20170909_143841.png

  I've also tested the scenario with qemu 2.10 which provided the exact
  same results.  The only difference in the test setup is that I had to
  make the guest boot with SeaBios instead of OVMF.  (Windows wouldn't
  boot with OVMF with the boot manager giving me an error pointing to a
  BCD issue.  Researching this it seemed related to an old ACPI problem,
  I believe this unrelated to my TPM issue so will do more research and
  raise a separate bug for this if needed.)

  Happy to provide further configurations and build logs as necessary so
  please advise me what is needed.

  Lastly for background reading.  I've been trying to get TPM
  passthrough working with Windows for a long time now and have hit
  several different issues which I believe have been addressed by both
  code maturity in Qemu but also in Windows releases.  An earlier bug
  report can be found here
  (https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1615722) which
  concludes advising me to raise this new/separate issue.

  Thanks in advance,

  Kelvin

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1716132/+subscriptions

