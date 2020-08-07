Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948B23EB89
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 12:27:12 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3zah-0006nu-4K
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 06:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3zYY-00052r-47
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 06:24:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3zYV-0000as-9d
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 06:24:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3zYT-0002ha-I3
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 10:24:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 868392E808D
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 10:24:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 10:14:12 -0000
From: Thomas Huth <1349722@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maria-k-o stefanha th-huth
X-Launchpad-Bug-Reporter: Maria Kustova (maria-k-o)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140729080745.19685.60860.malonedeb@wampee.canonical.com>
Message-Id: <159679525294.26771.15195639927142519814.malone@gac.canonical.com>
Subject: [Bug 1349722] Re: qemu-io: Exit code is always zero
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2812e3ff9de9cb10227f694b6c0f14db17283ab7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1349722 <1349722@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1349722

Title:
  qemu-io: Exit code is always zero

Status in QEMU:
  Incomplete

Bug description:
  The qemu-io always returns zero on exit independently on errors
  occurred during the command execution.

  Example,

  $ qemu-io -c 'write 128 234' /tmp/run1/test-1/test.img

  offset 128 is not sector aligned

  $ echo $?
  0

  =

  qemu.git HEAD: 41a1a9c42c4e

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1349722/+subscriptions

