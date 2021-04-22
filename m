Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A143636792C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:18:30 +0200 (CEST)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRjR-0002Wb-OD
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRgC-0007kY-WB
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:15:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:48698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRg3-0006yk-Pa
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:15:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRfz-0001sk-MZ
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:14:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A33C02E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:14:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:03:48 -0000
From: Thomas Huth <1556372@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cocoa mac osx ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth zhiayang
X-Launchpad-Bug-Reporter: Ng Zhia Yang (zhiayang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160312064016.26623.56434.malonedeb@chaenomeles.canonical.com>
Message-Id: <161906782873.10128.16580883012114897920.malone@wampee.canonical.com>
Subject: [Bug 1556372] Re: Superfluous popup on Cocoa to verify quit,
 cannot be disabled.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 1b84f1f6256c6cfc0595a5c3d62f95bdc5bca01e
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
Reply-To: Bug 1556372 <1556372@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1556372

Title:
  Superfluous popup on Cocoa to verify quit, cannot be disabled.

Status in QEMU:
  Incomplete

Bug description:
  This patch severely reduces the quality of life for developers using QEMU=
 in a rapid Edit-Compile-Test cycle.
  Any method of quitting QEMU via the UI triggers this dialogue, whose defa=
ult option is "cancel" -- necessitating the use of the mouse to click "Conf=
irm".

  This dialogue cannot be disabled by any flag, and is highly annoying.
  Recommend a flag to disable this confirmation, or in fact disable it
  by default and enable it with a flag.

  Patch in question:

  https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg05031.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1556372/+subscriptions

