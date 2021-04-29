Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEB36E864
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:08:04 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3aW-0008Ok-0a
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3YF-00078p-S7
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:58490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3YA-0006Ss-WC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:05:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc3Y8-0001lp-Ka
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5173D2E8026
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 09:50:46 -0000
From: Thomas Huth <1371915@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini deepi kelvin-middleton
 manciot-jeanchristophe pmaydell
X-Launchpad-Bug-Reporter: jean-christophe manciot (manciot-jeanchristophe)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140920125958.18087.58091.malonedeb@chaenomeles.canonical.com>
Message-Id: <161968984676.3774.17966729936427184979.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1371915] Re: Make Uninstall Rule Requested
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f00ba93a68772366ad07beec7986018396a8d32f
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
Reply-To: Bug 1371915 <1371915@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: qemu ubuntu uninstall

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1371915

Title:
  Make Uninstall Rule Requested

Status in QEMU:
  In Progress

Bug description:
  Environment: Ubuntu 14.04 - Qemu 2.1.1
  ------------------
  I've configured qemu with some --prefix, compiled the sources and install=
ed the binaries; now, for some reason, I need to uninstall qemu to configur=
e it with the default prefix, recompile the sources and reinstall the binar=
ies.
  However, there's no rule to uninstall qemu.

  All other packages which I have compiled and installed on my system
  offer the possibility to uninstall it: why not Qemu?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1371915/+subscriptions

