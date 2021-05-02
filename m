Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D1370A69
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 08:03:00 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld5Bz-00085L-8z
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 02:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld5AA-00072h-HQ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:01:08 -0400
Received: from indium.canonical.com ([91.189.90.7]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld5A6-0008Ex-Nx
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:01:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld5A3-0004k6-2j
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 06:00:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 11A7F2E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 06:00:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:51:34 -0000
From: Thomas Huth <1802465@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alapha23 th-huth zcjia
X-Launchpad-Bug-Reporter: Zhaocong (zcjia)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154174980807.2749.13752196954108515323.malonedeb@gac.canonical.com>
Message-Id: <161993469452.14597.17884078168418555701.malone@wampee.canonical.com>
Subject: [Bug 1802465] Re: typing string via VNC is unreliable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a4f477fd1c9bffee04da3f5f7d594ad6cfa1e406
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
Reply-To: Bug 1802465 <1802465@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1802465

Title:
  typing string via VNC is unreliable

Status in QEMU:
  Incomplete

Bug description:
  QEMU version is 3.0.0

  # Description

  The problem is that, when typing string through VNC, it can be
  unreliable -- sometimes some key strokes get skipped, sometimes get
  swapped, sometimes get repeated.  There's no problem when typing
  through VNC on physical hardware.

  # Steps to reproduce

  1. Launch virtual machine by:

      qemu-kvm -display vnc=3D:1 -m 2048 opensuse-leap-15.qcow2

  2. Connect to VNC by:

      vncviewer -Shared :5901

  3. Simulate a series of key strokes by "vncdotool" [1]:

      vncdotool -s 127.0.0.1::5901 typefile strings_to_be_typed.txt

  4. Usually after a few hundred keys are typed, something goes wrong.

  I attached a screenshot that it mistypes " hello" to "h ello".

  [1] https://github.com/sibson/vncdotool

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1802465/+subscriptions

