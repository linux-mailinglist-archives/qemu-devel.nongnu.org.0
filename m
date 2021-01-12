Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883E2F271C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:34:14 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBNl-0001Lu-7j
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFv-0008F6-VO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:52450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFt-0000u7-7b
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:26:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFg-0004TZ-J3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8F18F2E813A
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1780815@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sdl
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: enverex janitor th-huth
X-Launchpad-Bug-Reporter: Benjamin Hodgetts (enverex)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153115141921.29497.8768235999219760846.malonedeb@wampee.canonical.com>
Message-Id: <161042504986.10246.7262178854839463307.malone@loganberry.canonical.com>
Subject: [Bug 1780815] Re: SDL Doesn't Rescale Image on Resolution Change
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 0398209c006f10cc87ef0ecacdd2592654deee40
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
Reply-To: Bug 1780815 <1780815@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1780815

Title:
  SDL Doesn't Rescale Image on Resolution Change

Status in QEMU:
  Expired

Bug description:
  Whilst in fullscreen mode, if the guest changes resolution for
  whatever reason, the screen doesn't update the scaling so you end up
  looking at only part of the screen, e.g. if the guest changes from
  640x480 to 1024x768, the image will still be fullscreen, but what
  you're actually looking at will be the top-left most 640x480 segment
  of the screen stretched out.

  Manually going out of fullscreen mode and then back in fixes the
  scaling, but you have to do that every time the guest changes
  resolution.

  QEmu 2.12.0 using qemu-system-x86_64 with Arch Linux host.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1780815/+subscriptions

