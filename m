Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A13430D3
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 05:29:14 +0100 (CET)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNpiD-0001LQ-9Q
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 00:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfa-0000SO-Su
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:48456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfF-0002ci-Lc
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lNpfB-0003iy-7k
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:26:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B1BA2E8225
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Mar 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1811916@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hotkey sdl
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor msl0000023508 th-huth
X-Launchpad-Bug-Reporter: WHR (msl0000023508)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154760979078.8671.12129737571280605477.malonedeb@chaenomeles.canonical.com>
Message-Id: <161630023694.2150.6187306475101691627.malone@loganberry.canonical.com>
Subject: [Bug 1811916] Re: SDL2 interface didn't follow the current X11
 keyboard layout for hotkeys
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 050746315669270c18266da82d22dd0fdab84195
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
Reply-To: Bug 1811916 <1811916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811916

Title:
  SDL2 interface didn't follow the current X11 keyboard layout for
  hotkeys

Status in QEMU:
  Expired

Bug description:
  My X11 was configured to use Dvorak keyboard layout, with
  setxkbmap(1). Despite the window title said 'Press Ctrl-Alt-G to exit
  grab' after it grabbed the mouse, pressing this hotkey don't have any
  effects, and I has to switch to a virtual terminal to kill(1) that
  qemu process. By debugging the program I found it is using the raw key
  code to handle the key events, so I must use CTRL-ALT-I to exit the
  grab, in my keyboard.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811916/+subscriptions

