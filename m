Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5DD2C94DF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 02:52:41 +0100 (CET)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjuqN-0003sc-PV
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 20:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjuoc-00033O-RW
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 20:50:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjuoa-0007Bh-8K
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 20:50:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjuoY-0002or-Ah
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 01:50:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F6242E813E
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 01:50:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Dec 2020 01:38:22 -0000
From: Russell Morris <1906156@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h th-huth
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: Russell Morris (6-u3untu-h)
References: <160665259684.21842.16670509730009461748.malonedeb@gac.canonical.com>
Message-Id: <160678670288.19231.8430921952062484735.malone@wampee.canonical.com>
Subject: [Bug 1906156] Re: Host OS Reboot Required,
 for Guest kext to Load (Fully)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: b3a7a6298f035338bd108dfd9d1179a521fe948a
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
Reply-To: Bug 1906156 <1906156@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sure, will do (upstream version). Is there a preferred way to do it?
Meaning ... build locally, or install from some repository?

Thanks!

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906156

Title:
  Host OS Reboot Required, for Guest kext to Load (Fully)

Status in QEMU:
  Incomplete

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

