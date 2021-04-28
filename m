Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFF36D9FC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:03:59 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbljJ-0004gU-Tf
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lblgi-0003KE-7w
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:01:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:41462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lblgf-0004Vp-S0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:01:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lblga-0003YX-Vu
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 15:01:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB42B2E8144
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 15:01:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Apr 2021 14:54:38 -0000
From: Thomas Huth <1822798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jayshreephulare1 th-huth
X-Launchpad-Bug-Reporter: Jayshree Phulare (jayshreephulare1)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155421416733.11748.993612847677239700.malonedeb@soybean.canonical.com>
Message-Id: <161962167887.11021.5167796019846355346.malone@soybean.canonical.com>
Subject: [Bug 1822798] Re: The hover of " Full list of releases " is not
 effective even not visible.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: fd8123aa4fc43eec8f920eab6000a3c8b5bc9c08
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
Reply-To: Bug 1822798 <1822798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/48


** Changed in: qemu
       Status: New =3D> Expired

** Changed in: qemu
     Assignee: Jayshree Phulare (jayshreephulare1) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #48
   https://gitlab.com/qemu-project/qemu/-/issues/48

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1822798

Title:
  The hover of " Full list of releases " is not effective even not
  visible.

Status in QEMU:
  Expired

Bug description:
  The hover effect of "Full list of releases " on QEMU website that is
  https://www.qemu.org/ is not visible and hence effective so made it
  the issue on git hub and even committed it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1822798/+subscriptions

