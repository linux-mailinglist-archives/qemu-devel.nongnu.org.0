Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCF367931
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:21:20 +0200 (CEST)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRmB-0005Ld-E7
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRkb-0003we-1W
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:19:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:49130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRkY-0000i3-24
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:19:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRkW-0002CR-3t
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:19:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1ABA52E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:19:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:05:57 -0000
From: Thomas Huth <1574246@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s th-huth
X-Launchpad-Bug-Reporter: felix (felix.von.s)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160424122531.17506.89924.malonedeb@soybean.canonical.com>
Message-Id: <161906795769.22276.10549892820133651294.malone@gac.canonical.com>
Subject: [Bug 1574246] Re: Drunken keyboard in go32v2 programs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: c93f17e21614b170cb10b2c70b083ee5a2e70151
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
Reply-To: Bug 1574246 <1574246@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1574246

Title:
  Drunken keyboard in go32v2 programs

Status in QEMU:
  Incomplete

Bug description:
  QEMU 2.5.0, SeaBIOS 1.9.1; I've been noticing this bug for quite a
  while, though.

  Steps to reproduce:

  # Create a VM image, install DOS in it (doesn't matter which) and launch =
it.
  # Launch a "bare DOS" DPMI host (not an operating system) in it; I tested=
 with CWSDPMI and HDPMI32.
  # Run a go32v2 program which reads keyboard input (say, the Lua interpret=
er: <http://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/=
1.1/repos/devel/lua.zip>; the Free Pascal IDE will also do; on the other ha=
nd, DOS/4GW programs seem unaffected).
  # Quickly type in something random (e.g. alternate between hitting "p" an=
d "q"), then optionally move the cursor left and right.
  # Observe how some keystrokes are missed, and some are caught twice.

  The issue does NOT arise:
  * on bare metal DOS,
  * in VirtualBox,
  * in Bochs with stock Plex86 BIOS,
  * in Bochs with SeaBIOS,
  * in DOSEMU,
  * in DOSBox,
  * in QEMU when the DPMI host is Windows 3.11/9x
  so at this point I'm reasonably sure that it's the fault of either QEMU o=
r SeaBIOS, and probably the former. The issue arises regardless of whether =
KVM is enabled.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1574246/+subscriptions

