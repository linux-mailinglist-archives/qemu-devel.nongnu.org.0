Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B752C0E53
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:02:52 +0100 (CET)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDMg-0001kk-MO
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khDKr-00014R-48
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:00:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:46164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khDKl-0007sy-8f
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:00:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khDKi-0004TL-0L
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 15:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 016582E813D
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 15:00:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 14:51:30 -0000
From: Alex <1775011@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hello71 th-huth
X-Launchpad-Bug-Reporter: Alex (hello71)
X-Launchpad-Bug-Modifier: Alex (hello71)
References: <152812124309.24357.17398369138889360746.malonedeb@gac.canonical.com>
Message-Id: <160614309109.17086.2343839955559489166.launchpad@wampee.canonical.com>
Subject: [Bug 1775011] Re: -display gtk,gl=on crashes on Wayland
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: bd30302f16850c0946a560a0379f6dddeba014b4
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
Reply-To: Bug 1775011 <1775011@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1775011

Title:
  -display gtk,gl=3Don crashes on Wayland

Status in QEMU:
  Fix Released

Bug description:
  steps to reproduce:

  1. run a Wayland compositor (I use sway, probably the same bug exists for=
 other compositors)
  2. execute qemu -display gtk,gl=3Don

  expected results:

  a GTK window is created that shows SeaBIOS failing to boot

  actual results:

  segmentation fault  qemu-system-x86_64 -display gtk,gl=3Don

  additional information:

  qemu version 2.12.0 from Arch Linux

  looks like qemu is trying to take the Wayland display from GTK and
  initialize EGL but telling EGL it's a X11 display, which is not
  correct. setting GDK_BACKEND=3Dx11 works around the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1775011/+subscriptions

