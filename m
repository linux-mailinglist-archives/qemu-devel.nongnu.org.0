Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E673726E2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:05:06 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldq3E-00014W-Rq
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpzT-0007ur-V8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:01:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpzN-0001ca-Be
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:01:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldpzL-0006to-QN
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:01:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C30952E8050
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:01:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 07:55:13 -0000
From: Thomas Huth <1832916@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rth th-huth
X-Launchpad-Bug-Reporter: Richard Henderson (rth)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156055034616.22882.34472617820287855.malonedeb@soybean.canonical.com>
Message-Id: <162011491405.10196.3764615712117863242.malone@gac.canonical.com>
Subject: [Bug 1832916] Re: linux-user does not check PROT_EXEC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 39e3ddffb10f6552c7d6af43567b0f81bcd597f7
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
Reply-To: Bug 1832916 <1832916@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/122


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Changed in: qemu
     Assignee: Richard Henderson (rth) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #122
   https://gitlab.com/qemu-project/qemu/-/issues/122

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832916

Title:
  linux-user does not check PROT_EXEC

Status in QEMU:
  Expired

Bug description:
  At no point do we actually verify that a page is PROT_EXEC before
  translating.  All we end up verifying is that the page is readable.
  Not the same thing, obviously.

  The following test case should work for any architecture, though I've
  only validated it for x86_64 and aarch64.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832916/+subscriptions

