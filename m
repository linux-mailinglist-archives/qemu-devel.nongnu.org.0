Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2E2AC407
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 19:45:04 +0100 (CET)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcCA3-0002i3-TJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 13:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcC6R-0001Qy-HM
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 13:41:19 -0500
Received: from indium.canonical.com ([91.189.90.7]:58684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcC6P-0001lY-CV
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 13:41:19 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcC6J-0006Ij-S1
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 18:41:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E69F02E815A
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 18:41:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2020 18:32:10 -0000
From: Thomas Huth <1716132@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kelvin-middleton th-huth
X-Launchpad-Bug-Reporter: Kelvin Middleton (kelvin-middleton)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150496592440.23639.12760780482468469571.malonedeb@wampee.canonical.com>
Message-Id: <160494673016.12391.2904882642096039761.malone@gac.canonical.com>
Subject: [Bug 1716132] Re: Win 10 bitlocker won't initialise pass-through TPM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: fab730838e76e87898d81c96e504e97c736a32f6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 11:16:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1716132 <1716132@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1716132

Title:
  Win 10 bitlocker won't initialise pass-through TPM

Status in QEMU:
  Incomplete

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

