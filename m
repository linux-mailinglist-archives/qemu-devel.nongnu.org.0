Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E262F0BCB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:27:51 +0100 (CET)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyoo2-0006Mt-2M
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomI-00056f-S5
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyomG-0003PN-2J
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kyomC-00079I-T3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28CC72E8143
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1777236@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gersner janitor th-huth
X-Launchpad-Bug-Reporter: Shimi Gersner (gersner)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152915040560.6976.16916534721422810737.malonedeb@wampee.canonical.com>
Message-Id: <161033863866.29318.16622803077686876534.malone@loganberry.canonical.com>
Subject: [Bug 1777236] Re: NVME is missing support for mandatory features
 through "Get/Set Feature" command
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 0bcfb22a07703c71d4e28fb3238510a278b2483f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1777236 <1777236@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1777236

Title:
  NVME is missing support for mandatory features through "Get/Set
  Feature" command

Status in QEMU:
  Expired

Bug description:
  The following are features which are marked as mandatory by the 1.2 speci=
fication (NVMe 1.2, Section 5.14.1, Figure 108) as currently not implemented
   - 0x1 Arbitration
   - 0x2 Power Management
   - 0x4 Temperature Threshold
   - 0x5 Error Recovery
   - 0x6 Interrupt Coalescing
   - 0x7 Interrupt Vector Configuration
   - 0x8 Write Atomicity Normal
   - 0x9 Asynchronous Event Configuration

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777236/+subscriptions

