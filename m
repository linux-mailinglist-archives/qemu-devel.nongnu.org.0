Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61604367AE5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:22 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTdN-0004Rm-Ej
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZV-0007uF-Su
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTZE-0003iQ-2z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:16:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTZC-0004Vx-VY
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:16:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E59692E8157
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:16:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:05:01 -0000
From: Thomas Huth <1835732@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h tristan-vanberkom
X-Launchpad-Bug-Reporter: Tristan Van Berkom (tristan-vanberkom)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156258349508.21433.10621774615794067692.malonedeb@gac.canonical.com>
Message-Id: <161907510413.9818.2081952269958196380.launchpad@wampee.canonical.com>
Subject: [Bug 1835732] Re: GTK display zoom in, zooms infinitely
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 4c31bfaa1fd98bff8d71cf6b2acbb75afc30d2d8
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
Reply-To: Bug 1835732 <1835732@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835732

Title:
  GTK display zoom in, zooms infinitely

Status in QEMU:
  Incomplete

Bug description:
  The zoom in feature in the "View" menu of the gtk frontend (launch
  qemu with -display gtk), seems to be very broken.

  If I hit the zoom in feature, it first zooms in.

  Then, it zooms in again.

  Every subsequent second that passes, it zooms in again, until it
  eventually eats up too much host resources and freezes the host
  desktop.

  I have seen this with 3.1.0 (Debian 1:3.1+dfsg-8~deb10u1), and also
  with a locally built 4.0, My colleague also confirms having seen the
  issue with 3.1.0 (Debian 1:3.1+dfsg-8).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835732/+subscriptions

