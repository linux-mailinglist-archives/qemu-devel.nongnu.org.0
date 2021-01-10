Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A251E2F051F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:35:34 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySRx-000469-KQ
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySMy-0005kX-Vu
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:27 -0500
Received: from indium.canonical.com ([91.189.90.7]:41108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySMu-0002Yr-Bl
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:30:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySMs-0000z7-BL
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 54F6A2E8135
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:30:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:26 -0000
From: Launchpad Bug Tracker <1605045@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 3u-mail janitor mutedbytes th-huth
X-Launchpad-Bug-Reporter: mutedbytes (mutedbytes)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160721033517.413.34124.malonedeb@gac.canonical.com>
Message-Id: <161025224651.18863.14459650132835943781.malone@loganberry.canonical.com>
Subject: [Bug 1605045] Re: input-linux enter key stuck and/or broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 6f8fec78c4d036b686136f41ab35e0c881695376
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
Reply-To: Bug 1605045 <1605045@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1605045

Title:
  input-linux enter key stuck and/or broken

Status in QEMU:
  Expired

Bug description:
  Using new input-linux evdev passthrough feature of qemu (qemu 2.6.0)
  causes enter key to be stuck down after executing a shell script to
  launch qemu guest, resulting in repeated new lines in terminal. After
  a certain point of guest boot, the enter key is no longer pressed.
  However, at least under Gnome on Wayland, when pressing both
  left+right Ctrl keys to return keyboard back to the host, the enter
  key no longer functions. The enter key continues to function when
  control is under the guest, but never returns to functionality in the
  host until a reboot is performed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1605045/+subscriptions

