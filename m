Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27333AFC75
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:10:05 +0200 (CEST)
Received: from localhost ([::1]:45530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYfk-00082O-NM
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4b-0003Sm-Up
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:59220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4X-0000Z1-Ef
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4H-0003rh-BL
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4EB5B2E808D
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:31 -0000
From: Launchpad Bug Tracker <1453612@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor krichter722 th-huth
X-Launchpad-Bug-Reporter: Karl-Philipp Richter (krichter722)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20150510212609.29118.3935.malonedeb@wampee.canonical.com>
Message-Id: <162433545155.20423.6823240591662510060.malone@loganberry.canonical.com>
Subject: [Bug 1453612] Re: set_password command of monitor has poor feedback
 on failure
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 5b4b0d328287b85575e1ecbd9a5f81fbefe9b265
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
Reply-To: Bug 1453612 <1453612@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1453612

Title:
  set_password command of monitor has poor feedback on failure

Status in QEMU:
  Expired

Bug description:
  running `set_password vnc NkkmEz5icvTAGo6MECzBVEUxP` in qemu monitor
  (which is the appropriate way to set a vnc password according to `man
  qemu-system-x86_64`) started with `-monitor stdio` gives feedback
  `Could not set password` which is unhelpful because it doesn't specify
  the reason of the failure.

  experienced with 2.3.0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1453612/+subscriptions

