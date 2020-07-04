Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80521487A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 21:46:45 +0200 (CEST)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jro7X-0006YD-8h
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 15:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jro6W-00064V-UJ
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:45:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:46568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jro6T-0000Gv-FV
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:45:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jro6P-0007iZ-Gc
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 19:45:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B1352E8112
 for <qemu-devel@nongnu.org>; Sat,  4 Jul 2020 19:45:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2020 19:38:40 -0000
From: Dustin Spicuzza <1886285@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dustin-virtualroadside
X-Launchpad-Bug-Reporter: Dustin Spicuzza (dustin-virtualroadside)
X-Launchpad-Bug-Modifier: Dustin Spicuzza (dustin-virtualroadside)
Message-Id: <159389152128.1124.17936242072997160308.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1886285] [NEW] Provide SMB option to support Windows 2000
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1182d49db314ffbac6d213470f474322733ae55c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 15:45:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1886285 <1886285@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

As of SAMBA 4.11
(https://www.samba.org/samba/history/samba-4.11.0.html), SMB1 is
disabled by default (and may be removed in the future). This breaks SMB
shares with Windows 2000 guests.

Adding the following line to smb.conf fixes this:

min protocol =3D NT1

I would propose that an option be added to add this line to smb.conf to
support these legacy operating systems.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886285

Title:
  Provide SMB option to support Windows 2000

Status in QEMU:
  New

Bug description:
  As of SAMBA 4.11
  (https://www.samba.org/samba/history/samba-4.11.0.html), SMB1 is
  disabled by default (and may be removed in the future). This breaks
  SMB shares with Windows 2000 guests.

  Adding the following line to smb.conf fixes this:

  min protocol =3D NT1

  I would propose that an option be added to add this line to smb.conf
  to support these legacy operating systems.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886285/+subscriptions

