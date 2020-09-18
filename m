Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A92701BF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJJ1h-00074I-U4
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJIyR-0002ol-9X
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 12:10:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:34004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJIyP-0003p8-DY
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 12:10:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kJIyO-0004ct-63
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 16:10:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 247722E80EC
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 16:10:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2020 16:02:28 -0000
From: Peter Maydell <1895703@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: buildsys tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn bonzini philmd pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160018860889.17103.9156462398304890013.malonedeb@soybean.canonical.com>
Message-Id: <160044494925.22223.18205009623215820455.malone@wampee.canonical.com>
Subject: [Bug 1895703] Re: performance degradation in tcg since Meson switch
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: d53685bbae6cf8efe295ae5444885a0827fb5253
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 05:01:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895703 <1895703@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo: what are the permissions on matmult_double-m68k on your local fs?
(needs to be readable/executable by you)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895703

Title:
  performance degradation in tcg since Meson switch

Status in QEMU:
  New

Bug description:
  The buildsys conversion to Meson (1d806cef0e3..7fd51e68c34)
  introduced a degradation in performance in some TCG targets:

  --------------------------------------------------------
  Test Program: matmult_double
  --------------------------------------------------------
  Target              Instructions     Previous    Latest
                                       1d806cef   7fd51e68
  ----------  --------------------  ----------  ----------
  alpha              3 233 957 639       -----     +7.472%
  m68k               3 919 110 506       -----    +18.433%
  --------------------------------------------------------

  Original report from Ahmed Karaman with further testing done
  by Aleksandar Markovic:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg740279.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895703/+subscriptions

