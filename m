Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7B3AFC69
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:06:34 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYcL-0007pW-Iy
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4T-0003MV-Cb
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:59050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4Q-0000WU-PD
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4E-0003kg-En
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6582F2E80AB
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1556372@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cocoa mac osx ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth zhiayang
X-Launchpad-Bug-Reporter: Ng Zhia Yang (zhiayang)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160312064016.26623.56434.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433545465.20423.6842391330947531864.malone@loganberry.canonical.com>
Subject: [Bug 1556372] Re: Superfluous popup on Cocoa to verify quit,
 cannot be disabled.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 3d087a9b0f1f12af4d0ed6fcb5c9c2321b813bca
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
Reply-To: Bug 1556372 <1556372@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1556372

Title:
  Superfluous popup on Cocoa to verify quit, cannot be disabled.

Status in QEMU:
  Expired

Bug description:
  This patch severely reduces the quality of life for developers using QEMU=
 in a rapid Edit-Compile-Test cycle.
  Any method of quitting QEMU via the UI triggers this dialogue, whose defa=
ult option is "cancel" -- necessitating the use of the mouse to click "Conf=
irm".

  This dialogue cannot be disabled by any flag, and is highly annoying.
  Recommend a flag to disable this confirmation, or in fact disable it
  by default and enable it with a flag.

  Patch in question:

  https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg05031.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1556372/+subscriptions

