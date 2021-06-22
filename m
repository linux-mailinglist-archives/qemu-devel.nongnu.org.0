Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F43AFC39
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:50:39 +0200 (CEST)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYMw-0007py-8b
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4h-0003kx-7c
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:59884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4e-0000ka-SV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4R-0004V3-1P
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 65B4A2E8169
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:22 -0000
From: Launchpad Bug Tracker <690776@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jwm th-huth
X-Launchpad-Bug-Reporter: John Morrissey (jwm)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20101215181600.22832.16013.malonedeb@gandwana.canonical.com>
Message-Id: <162433544283.20423.17253638881850832754.malone@loganberry.canonical.com>
Subject: [Bug 690776] Re: Overwrite argv to set process title,
 eliminating 16-character prctl() limit.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 8e1755a053d9df83138e2efa1e7170832c693a40
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
Reply-To: Bug 690776 <690776@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/690776

Title:
  Overwrite argv to set process title, eliminating 16-character prctl()
  limit.

Status in QEMU:
  Expired

Bug description:
  I've modified qemu to overwrite its arguments to set the process
  title, since its current prctl() method has a 16-character limit.

  I posted the original patch to qemu-devel, made the changes others
  suggested, then re-posted to qemu-devel. I flailed around a bit with
  the patch submission process and think I finally got it right, but
  haven't been able to gain the notice of a committer to have this
  pushed. Maybe this will get more attention when reported in the BTS.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/690776/+subscriptions

