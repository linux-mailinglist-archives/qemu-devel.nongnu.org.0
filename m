Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768093ACF67
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:47:04 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGhz-0006xn-Ii
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGgd-0006GX-SG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luGgX-0002dF-5l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:45:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luGgT-0006ot-AQ
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:45:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4BA642E8047
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:45:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Jun 2021 15:38:52 -0000
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
Message-Id: <162403073270.13969.14452683143336714169.launchpad@wampee.canonical.com>
Subject: [Bug 1802465] Re: typing string via VNC is unreliable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: d1b1ba8afdef21e96cc7d87339c739e8fb6a8d6d
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
Reply-To: Bug 1802465 <1802465@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: Debian Bug tracker #758881
   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D758881

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

