Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC736F7C1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:23:21 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPMm-0005mI-Ua
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPKe-0004M3-3x
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:21:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:37614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPKb-0000AJ-Kc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:21:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPKZ-0003IZ-7f
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:21:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4DA882E8160
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:14:22 -0000
From: Thomas Huth <1715203@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kallisti5 pmaydell th-huth
X-Launchpad-Bug-Reporter: kallisti5 (kallisti5)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150463414707.19543.9931062189110648888.malonedeb@chaenomeles.canonical.com>
Message-Id: <161977406339.10711.7061181283114798772.launchpad@gac.canonical.com>
Subject: [Bug 1715203] Re: Maintain Haiku support
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 87194fbcdb8effba60308fbee9241a3c5880df47
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
Reply-To: Bug 1715203 <1715203@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1715203

Title:
  Maintain Haiku support

Status in QEMU:
  Fix Released

Bug description:
  It was pointed out that the 2.10 release notes are pushing to drop
  Haiku support.  The qemu port is currently working as-is under Haiku.

  Was there a reason this was recommended? Is there anything Haiku can
  do to keep it from being dropped?

  We're working on a docker container to cross-compile rust-lang for
  Haiku, could this be of some use to qemu when complete?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1715203/+subscriptions

