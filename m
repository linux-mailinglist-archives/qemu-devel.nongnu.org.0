Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1A3432D8
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 15:02:06 +0100 (CET)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNyeb-00087Z-5i
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 10:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNydV-0007eZ-7S
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 10:00:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:47420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNydP-0006tu-6W
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 10:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lNydL-0003B5-Lv
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 14:00:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8C8CD2E815D
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 14:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Mar 2021 13:53:14 -0000
From: Betim <1920672@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: betim
X-Launchpad-Bug-Reporter: Betim (betim)
X-Launchpad-Bug-Modifier: Betim (betim)
Message-Id: <161633479458.23431.12957243006449145143.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1920672] [NEW] Compilation fails silently
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 59df1de451ff0d2150fe93406815eb86012442f8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1920672 <1920672@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

It compiles until the end and then just:
[6102/6103] Linking target qemu-system-alpha
[6103/6103] Linking target qemu-system-aarch64
make[1]: Leaving directory '/home/t/.cache/kiss/proc/32129/build/qemu/build'
make: *** [GNUmakefile:11: all] Error 2

Attached is the complete log including configure. I can't find why this
is happening maybe I have a wrong version of a required library?

Any ideas?

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "make log"
   https://bugs.launchpad.net/bugs/1920672/+attachment/5478697/+files/qemu.=
log

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920672

Title:
  Compilation fails silently

Status in QEMU:
  New

Bug description:
  It compiles until the end and then just:
  [6102/6103] Linking target qemu-system-alpha
  [6103/6103] Linking target qemu-system-aarch64
  make[1]: Leaving directory '/home/t/.cache/kiss/proc/32129/build/qemu/bui=
ld'
  make: *** [GNUmakefile:11: all] Error 2

  Attached is the complete log including configure. I can't find why
  this is happening maybe I have a wrong version of a required library?

  Any ideas?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920672/+subscriptions

