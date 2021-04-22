Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81C3679E4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:28:25 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSp1-0001m2-3M
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSmk-0000T6-Tc
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:57178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZSmh-0007Ah-So
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:25:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZSmg-0007oh-3a
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 19F682E80F9
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:25:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 06:15:35 -0000
From: Thomas Huth <1828867@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg testcase x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sonicadvance1 th-huth
X-Launchpad-Bug-Reporter: Sonicadvance1@gmail.com (sonicadvance1)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155776862725.26593.3375928624162381326.malonedeb@soybean.canonical.com>
Message-Id: <161907213522.23029.9636527453615642617.malone@gac.canonical.com>
Subject: [Bug 1828867] Re: QEmu translation is incorrect when using REX in
 combination with LAHF/SAHF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 60bdac90fbe2227e8814004e1e362312af4e8c6e
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
Reply-To: Bug 1828867 <1828867@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1828867

Title:
  QEmu translation is incorrect when using REX in combination with
  LAHF/SAHF

Status in QEMU:
  Incomplete

Bug description:
  When translating code that is using LAHF and SAHF in combination with the=
 REX prefix then qemu translates incorrectly.
  These two instructions only ever use the AH register. Contrary to other i=
nstructions where if you use REX + high bit offsets then it'll pull in rsp =
and a few other registers.
  On hardware the REX prefix doesn't effect behaviour of these instructions=
 at all.
  QEMU incorrectly selects RSP as the register of choice here due to this c=
ombination of REX + AH register usage.

  I've attached a patch that is super terrible just so I can work around
  the issue locally and to sort of show off how it is to be "fixed"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828867/+subscriptions

