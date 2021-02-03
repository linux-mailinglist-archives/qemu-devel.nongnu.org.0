Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43630D2A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 05:27:15 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l79l4-0002Pk-21
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 23:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l79jm-0001r2-5b
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:25:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:52848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l79jk-0001Cd-2S
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:25:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l79jg-0007Eo-PG
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 04:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 13D912E814F
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1906156@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h janitor th-huth
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160665259684.21842.16670509730009461748.malonedeb@gac.canonical.com>
Message-Id: <161232584470.9329.14902159727544091323.malone@loganberry.canonical.com>
Subject: [Bug 1906156] Re: Host OS Reboot Required,
 for Guest kext to Load (Fully)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: a744f79c984f662c9cef56a4d449fa0fc4848a5a
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
Reply-To: Bug 1906156 <1906156@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906156

Title:
  Host OS Reboot Required, for Guest kext to Load (Fully)

Status in QEMU:
  Expired

Bug description:
  Hi,

  Finding this one a bit odd, but I am loading a driver (kext) in a
  macOS guest ... and it works, on the first VM (domain) startup after a
  full / clean host OS boot (or reboot). However, if I even reboot the
  guest OS, then the driver load fails =3D> can be "corrected" by a full
  host OS reboot (which seems very extreme).

  Is this a known issue, and/or is there a workaround?

  FYI, running,
  QEMU emulator version 5.0.0 (Debian 1:5.0-5ubuntu9.1)
  Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

  This is for a macOS guest, on a Linux host.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906156/+subscriptions

