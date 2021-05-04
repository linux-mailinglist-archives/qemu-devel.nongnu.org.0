Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1437269E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:38:04 +0200 (CEST)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpd5-0004LP-K3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZw-0002DM-5Q
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:38024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldpZu-0002Z0-GQ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:34:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldpZs-0004SC-Ip
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:34:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3512C2E8194
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 07:34:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 07:23:01 -0000
From: Thomas Huth <1500265@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: d-haid metux-its schoenebeck th-huth
X-Launchpad-Bug-Reporter: Daniel Haid (d-haid)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150927211256.29032.14479.malonedeb@chaenomeles.canonical.com>
Message-Id: <162011298218.13763.4464850284769876229.malone@wampee.canonical.com>
Subject: [Bug 1500265] Re: nested 9p filesystem with
 security_model=mapped-xattr
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 0a610237b183ffefa0ee87c2f2bdc16d672571bf
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
Reply-To: Bug 1500265 <1500265@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/117


** Changed in: qemu
       Status: Triaged =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #117
   https://gitlab.com/qemu-project/qemu/-/issues/117

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1500265

Title:
  nested 9p filesystem with security_model=3Dmapped-xattr

Status in QEMU:
  Expired

Bug description:
  I do not know whether this is a bug or a feature request, but on a 9p
  virtfs with security_model=3Dmapped-xattr, access to extended attributes
  starting with "user.virtfs" coming from the guest seem to be silently
  ignored. Would it not be more correct to use some sort of "escaping",
  say map to "user.virtfs.x" on guest to "user.virtfs.virtfs.x" on host
  or something like that, so that the guest can use arbitrary
  attributes.

  In particular, this would allow nested virtual machines to use nested
  9p virtfs with security_model=3Dmapped-xattr.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1500265/+subscriptions

