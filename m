Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98451FCCF9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 14:04:08 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlWnX-0005Ua-PE
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 08:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlWlA-0003VH-3i
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 08:01:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlWl7-0006MA-Og
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 08:01:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlWl5-0002RS-0v
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 12:01:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E60AE2E810C
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 12:01:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2020 11:53:46 -0000
From: "Michael R. Crusoe" <1883784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc64le tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier misterc nemequ
X-Launchpad-Bug-Reporter: Evan Nemerson (nemequ)
X-Launchpad-Bug-Modifier: Michael R. Crusoe (misterc)
References: <159233926606.29237.7012634601262116409.malonedeb@chaenomeles.canonical.com>
Message-Id: <159239482633.14583.18250980937636776635.malone@wampee.canonical.com>
Subject: [Bug 1883784] Re: [ppc64le] qemu behavior differs from ppc64le
 hardware
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8761e5168b307296f626d2cb8ece26b2463c1ed4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 06:40:58
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
Reply-To: Bug 1883784 <1883784@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just ran the provided binaries on a qemu-system-ppc64 version 5.0-5
from Debian Bullseye and they also aborted there

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883784

Title:
  [ppc64le] qemu behavior differs from ppc64le hardware

Status in QEMU:
  New

Bug description:
  I have some code which passes my test suite on PPC64LE hardware when
  compiled with GCC 10, but the saem binary fails with both qemu-ppc64le
  4.2 (on Fedora 32) and qemu-ppc64le-static 5.0.0 (Debian testing).

  I'm not getting any errors about illegal instructions or anything,
  like that; the results are just silently different on qemu.

  I've generated a reduced test case, which is attached along with the
  binaries (both are the same code, one is just statically linked).
  They should execute successufully on PPC64LE hardware, but on qemu
  they hit a __builtin_abort (because the computed value doesn't match
  the expected value).

  Without being familiar with PPC assembly I'm not sure what else I can
  do, but if there is anything please let me know.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883784/+subscriptions

