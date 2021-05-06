Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74279374F1B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:57:19 +0200 (CEST)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leX0g-0004hB-I0
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWzL-0003Rn-1g
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:55:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leWzJ-0008HU-D3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:55:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leWzH-0006Os-PQ
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 05:55:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B74EE2E818F
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 05:55:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 05:50:09 -0000
From: Thomas Huth <1864955@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos philmd th-huth
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158278309128.18853.6534515173893863136.malonedeb@chaenomeles.canonical.com>
Message-Id: <162028020924.3821.14891307648891125642.malone@gac.canonical.com>
Subject: [Bug 1864955] Re: bundle QEMU installer with HAXM accelerator for
 Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 8b8ddea19042cdfd521933e3bf0a0bb301774520
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
Reply-To: Bug 1864955 <1864955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project itself does not provide any binaries for Windows, so
I'm closing this ticket now. There are several people who provide
binaries for Windows, so if you want to get one of these changed, please
get in touch with the corresponding person who offers that binary
instead.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864955

Title:
  bundle QEMU installer with HAXM accelerator for Windows

Status in QEMU:
  Invalid

Bug description:
  As you probably know HAXM is an accelerator for Windows.

  https://www.qemu.org/2017/11/22/haxm-usage-windows/

  Currently it is required to first install QEMU and then install HAXM.

  For a better out of the box user experience on the Windows platform it
  would be nice if QEMU and HAXM would be installed by the same
  installer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864955/+subscriptions

