Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBA43755DD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:46:49 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefH5-0002LL-Mw
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefEM-0000as-O9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:43:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:36350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lefEJ-0005eH-FJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:43:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lefEG-0001A6-3N
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 14:43:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A38D2E834B
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 14:43:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 14:33:14 -0000
From: Thomas Huth <1874904@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jbytibidi th-huth
X-Launchpad-Bug-Reporter: Jean-Yves BAUDY (jbytibidi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158776006238.17831.1947739599630021875.malonedeb@wampee.canonical.com>
Message-Id: <162031159487.5872.5981848078029328914.malone@wampee.canonical.com>
Subject: [Bug 1874904] Re: qemu windows with gtk and french keypad not working
 as expected
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7175cb85fd0ac79f8b5a4afdffd6f8d10535fc31
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1874904 <1874904@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

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
https://bugs.launchpad.net/bugs/1874904

Title:
  qemu windows with gtk and french keypad not working as expected

Status in QEMU:
  Incomplete

Bug description:
  When I use qemu on Windows 10 with a French AZERTY keypad with the
  correct options the emulated system keypad still QWERTY. If I use sdl
  it works fine the emulated keypad is AZERTY.

  Example of command with ubuntu live cd:
  -> qemu-system-x86_64.exe  -m 4G ubuntu-18.04.4-desktop-amd64.iso -displa=
y gtk -k fr

  NOTES:
  =C2=A0- Using the same command on Linux works fine. The emulated keypad i=
s AZERTY.

  Qemu version : 4.2.0 on Windows 10

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1874904/+subscriptions

