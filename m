Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5637365D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:35:29 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leD0C-0008Ve-5k
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrS-0008E5-6c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrJ-0006Hp-SN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leCrH-0004C8-Ov
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:26:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A9FB92E8186
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 08:26:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:18:14 -0000
From: Thomas Huth <1708551@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: regression usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: direnter kraxel-redhat th-huth
X-Launchpad-Bug-Reporter: Divine E (direnter)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150180124657.25828.11815849760914128130.malonedeb@chaenomeles.canonical.com>
Message-Id: <162020269485.305.15646516610520673273.malone@chaenomeles.canonical.com>
Subject: [Bug 1708551] Re: macOS Guest Reading USB 3.0 Bus as USB 2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0bd4f16e6770ad05ed4c6c5f83087ebca5d6a623
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
Reply-To: Bug 1708551 <1708551@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/146


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #146
   https://gitlab.com/qemu-project/qemu/-/issues/146

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1708551

Title:
  macOS Guest Reading USB 3.0 Bus as USB 2.0

Status in QEMU:
  Expired

Bug description:
  Description:
  I'm having trouble with USB Passthrough. Running `system_profiler SPUSBDa=
taType` on macOS guest confirms that the system "sees" my device, and that =
qemu is passing *something* through. However, the system sees my connection=
 as USB 2.0, even though i'm passing through XHCI controllers (nec-usb-xhci=
/qemu-xhci). I suspect this is the reason why my guest is unable to recogni=
ze my iPhone in XCode & iTunes.

  Parameters:
  QEMU release version: 2.10.0-rc0
  Bios: [patched version of OVMF](https://github.com/gsomlo/edk2/tree/macbo=
ot)]
  Command Line: https://pastebin.com/pBSYbrW1
  Host: Arch Linux
  Guest: macOS v10.12.6
  Guest System Info: https://pastebin.com/U1Tihxei

  Notes:
  1. Observed sometime after late-May-early-June of this year.

  2. Due to [a defect in qemu v2.8 which affected GTK
  users](https://bugs.launchpad.net/qemu/+bug/1578192), and [a recent
  change to macOS' booting process conflicting with qemu
  v2.9](https://lists.nongnu.org/archive/html/qemu-
  devel/2017-03/msg06366.html), i'm forced to use qemu v2.10.0-rc0 (as
  -rc1 fails to load OVMF right now).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1708551/+subscriptions

