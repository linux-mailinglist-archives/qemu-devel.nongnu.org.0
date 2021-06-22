Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752173AFC72
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:08:18 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYe1-0003ji-Hc
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4V-0003Ow-Ri
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:58940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4P-0000V7-1U
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4C-0003uF-IM
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 828052E809C
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1574246@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s janitor th-huth
X-Launchpad-Bug-Reporter: felix (felix.von.s)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160424122531.17506.89924.malonedeb@soybean.canonical.com>
Message-Id: <162433545660.20423.1209792590949284976.malone@loganberry.canonical.com>
Subject: [Bug 1574246] Re: Drunken keyboard in go32v2 programs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 39d7ec2f36b4b2cc89cf0f44e44d23499ff22174
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
Reply-To: Bug 1574246 <1574246@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1574246

Title:
  Drunken keyboard in go32v2 programs

Status in QEMU:
  Expired

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

