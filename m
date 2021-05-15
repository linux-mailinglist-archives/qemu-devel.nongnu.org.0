Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8838194E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 16:18:19 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhv7T-0004qH-1X
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 10:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhv4r-0000Qx-Kv
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:15:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:43166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhv4q-0004MS-1F
 for qemu-devel@nongnu.org; Sat, 15 May 2021 10:15:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhv4o-0003EA-Jk
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 14:15:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8D6602E8135
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 14:15:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 14:06:06 -0000
From: Thomas Huth <1923692@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: magicaltux th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Mark_Karpel=C3=A8s_=28magicaltux=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161836656207.30780.15144646849156877353.malonedeb@gac.canonical.com>
Message-Id: <162108756653.2324.1343007695764622637.malone@wampee.canonical.com>
Subject: [Bug 1923692] Re: qemu 5.2.0: Add reconnect option support for netdev
 socket
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 42c4eb90be13844dc6bd660ba32a45fbe35723b6
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
Reply-To: Bug 1923692 <1923692@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/323


** Tags added: feature-request

** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #323
   https://gitlab.com/qemu-project/qemu/-/issues/323

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923692

Title:
  qemu 5.2.0: Add reconnect option support for netdev socket

Status in QEMU:
  Expired

Bug description:
  Most of qemu socket accepting options (such as chardev) accept among
  other things a "reconnect" option.

  netdev socket however returns: Invalid parameter 'reconnect'

  It would make sense that available options for socket links be at
  least partially normalized (also see issue
  https://bugs.launchpad.net/qemu/+bug/1903470 which was closed without
  resolution).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923692/+subscriptions

