Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE0A2EFDC4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:39:04 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky61n-0007P0-Dq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5qA-0000EF-5u
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:47570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q1-000734-5w
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5po-0007QK-2O
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DA4E52E8176
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:42 -0000
From: Launchpad Bug Tracker <1687578@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h janitor jemmy858585
X-Launchpad-Bug-Reporter: Lidong Chen (jemmy858585)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170502092542.26484.80835.malonedeb@chaenomeles.canonical.com>
Message-Id: <161016586310.8490.1040761481971839151.malone@loganberry.canonical.com>
Subject: [Bug 1687578] Re: when migrate vm, reboot in guest os,
 the guest os sometime hang
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: aecaee7d8c136f633f488cf3852a0f7efdb0c661
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
Reply-To: Bug 1687578 <1687578@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1687578

Title:
  when migrate vm, reboot in guest os, the guest os sometime hang

Status in QEMU:
  Expired

Bug description:
  qemu version:v2.9.0-rc5 release

  1.virsh migrate --live 165cf436-312f-47e7-90f2-f8aa63f34893 --copy-storag=
e-inc qemu+ssh://10.59.163.38/system
  2.run reboot in guest os, add reboot in /etc/rc.local
  3.guest os hang sometime.

  strace output of qemu:

  ppoll([{fd=3D9, events=3DPOLLIN}, {fd=3D8, events=3DPOLLIN}, {fd=3D4, eve=
nts=3DPOLLIN}, {fd=3D6, events=3DPOLLIN}, {fd=3D30, events=3DPOLLIN}, {fd=
=3D31, events=3DPOLLIN}], 6, {0, 0}, NULL, 8) =3D 0 (Timeout)
  ppoll([{fd=3D9, events=3DPOLLIN}, {fd=3D8, events=3DPOLLIN}, {fd=3D4, eve=
nts=3DPOLLIN}, {fd=3D6, events=3DPOLLIN}, {fd=3D30, events=3DPOLLIN}, {fd=
=3D31, events=3DPOLLIN}], 6, {0, 698000000}, NULL, 8) =3D 0 (Timeout)
  poll([{fd=3D20, events=3DPOLLOUT}], 1, 0)   =3D 1 ([{fd=3D20, revents=3DP=
OLLOUT|POLLHUP}])
  ppoll([{fd=3D9, events=3DPOLLIN}, {fd=3D8, events=3DPOLLIN}, {fd=3D4, eve=
nts=3DPOLLIN}, {fd=3D6, events=3DPOLLIN}, {fd=3D30, events=3DPOLLIN}, {fd=
=3D31, events=3DPOLLIN}], 6, {0, 999000000}, NULL, 8^C <unfinished ...>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1687578/+subscriptions

