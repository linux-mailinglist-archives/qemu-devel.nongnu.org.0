Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00573BC5A3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:39:55 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0csE-00020q-RY
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfa-0000G4-Q3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:52324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfZ-0003N6-AY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfK-0004xb-EC
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 53B422E83EE
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1874904@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jbytibidi th-huth
X-Launchpad-Bug-Reporter: Jean-Yves BAUDY (jbytibidi)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158776006238.17831.1947739599630021875.malonedeb@wampee.canonical.com>
Message-Id: <162554505695.7821.9941358536563634660.malone@loganberry.canonical.com>
Subject: [Bug 1874904] Re: qemu windows with gtk and french keypad not working
 as expected
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: ad48ef3aa51fe9cd9166694f94980195b74bf889
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
Reply-To: Bug 1874904 <1874904@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1874904

Title:
  qemu windows with gtk and french keypad not working as expected

Status in QEMU:
  Expired

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

