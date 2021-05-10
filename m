Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C7377B49
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:37:18 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxfR-0002YF-88
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxdn-0000Se-IS
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:50498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxdk-0001kB-NJ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxdj-0007m5-8v
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:35:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 179F72E8187
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:35:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:25:52 -0000
From: Thomas Huth <1904317@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: whpx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chapuni philmd th-huth
X-Launchpad-Bug-Reporter: Takumi Nakamura (chapuni)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160543118215.29327.13808899207251644228.malonedeb@wampee.canonical.com>
Message-Id: <162062075272.16458.3632369085342415736.malone@soybean.canonical.com>
Subject: [Bug 1904317] Re: cpu feature selection is not affected to guest 's
 cpuid with whpx
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 1701965ea64559f363d6360240d959dfadb6f424
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1904317 <1904317@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Tags added: whpx

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904317

Title:
  cpu feature selection is not affected to guest 's cpuid with whpx

Status in QEMU:
  Incomplete

Bug description:
  On windows with -accel whpx, "-cpu" is ignored without any messages.
  Guest recognizes features as same as host's.

  Confirmed on v5.2.0-rc1.

  I suggest qemu may do,

  - Warn with incompatible -cpu options were given.
  - Enhance cpuid handling.

  Background:
  I was investigated mmio and block copy issue in Linux kernel.
  I met a problem that Linux went ill for touching mmio with whpx. (not wit=
h tcg)
  I suspect erms(enhanced rep movs) might trigger.
  I tried to mask erms on qemu with -feature,erms, but it was ineffective.

  At last, I disabled erms manually, to tweak whpx-all.c to mask erms in
  cpuid.

  FYI, qemu with whpx from/to mmio, "rep movsb" does byte access regardless=
 of erms.
  Linux kernel tends to choose not "rep movsq" but "rep movsb" with erms.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904317/+subscriptions

