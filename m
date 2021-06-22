Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C93AFC3E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:52:43 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYOw-0003rb-77
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzm-0007gJ-UQ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:57134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzk-0005DC-SH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzW-00015Q-OE
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 419D62E81DD
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:17 -0000
From: Launchpad Bug Tracker <1835732@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h janitor tristan-vanberkom
X-Launchpad-Bug-Reporter: Tristan Van Berkom (tristan-vanberkom)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156258349508.21433.10621774615794067692.malonedeb@gac.canonical.com>
Message-Id: <162433549754.20423.9367980713682770235.malone@loganberry.canonical.com>
Subject: [Bug 1835732] Re: GTK display zoom in, zooms infinitely
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: a33b5672050beb38bd21c743175f0cf36a300b03
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
Reply-To: Bug 1835732 <1835732@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835732

Title:
  GTK display zoom in, zooms infinitely

Status in QEMU:
  Expired

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

