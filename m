Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6F3F70A4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:47:03 +0200 (CEST)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInca-0000QL-Sy
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInbU-00083K-M3
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:45:44 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInbS-0004by-Qe
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:45:44 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 0FB223F73E
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629877541;
 bh=lX8ZphutMwupRV84N1ytXqbqG2mFGQ5fIrmFbhIE1Hc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=lLJts8wLjONHvuRFG6QXhcGaveFYU77qM8j3yPrHY2MxKKrs2VlIg2DkJ3pzYA3st
 K8/wOnVW5NCN4rwR4B0VgZ6yTTPtPMTrJOeQn/XbK+EVigPcU1eG3M/YD3ElJYTsZF
 8KtyPXRK3TS793gVQjdKRJjRvpQg/AjPlyqnkWD2hV1xwIa92XFiKhbTlyHcN750BH
 SPkug1ePPUq9oW68ybwKq4KW8Y84WBtdHuW038wmkDYrBKaNKnqgtVpJ4Hh3J4ABIk
 qe9/JjB559OODfzni+No1iGzAvtU0V9Wn3Y6908lDZz23BJFa+DJ50rs0O2kU9Lu7W
 CbJ0hdU75jo2Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 823022E8135
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:40:18 -0000
From: Thomas Huth <1884982@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: documentation net
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5 pmaydell th-huth
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159301155950.13634.250500637103712065.malonedeb@wampee.canonical.com>
Message-Id: <162987721885.2465.12649808117155984135.malone@wampee.canonical.com>
Subject: [Bug 1884982] Re: User-emu documentation mentions inexistent
 "runtime" downloads
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 0d2fcd1a4838dc1fb23554bc9ac278ef29ac51b0
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1884982 <1884982@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/560


** Tags added: net

** Changed in: qemu
       Status: In Progress =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #560
   https://gitlab.com/qemu-project/qemu/-/issues/560

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884982

Title:
  User-emu documentation mentions inexistent "runtime" downloads

Status in QEMU:
  Expired

Bug description:
  The official documentation for the user-space emulator[1] contains
  many references to binary blobs no longer provided by  QEMU.org for
  download. The parts mentioning them should be rephrased to avoid
  confusion and instructions for building these components should be
  provided (maybe as a reference to the LFS book with some scripts,
  or... cut a deal with some super slim Linux distros). The specific
  parts are:

  * qemu-XXX-i386-wine.tar.gz, a wine build under the prefix /wine.
  * qemu-runtime-i386-XXX-.tar.gz, a glibc build.

  =C2=A0=C2=A0[1]: https://www.qemu.org/docs/master/user/main.html

  In addition, the documentation contains many other instances of
  inexistent "tar.gz" files, such as in "Network emulation". Most of
  these are inherited from the days of texi documentation more than 10
  years ago, and they are so old that GitHub's blame have become
  unreliable. Someone really should run `fgrep -r 'tar.gz' doc' on the
  QEMU source tree.

  The issue was previously reported as [2], but nobody bother enough to
  google the filename to find out where the confused user got the idea
  from.

  =C2=A0=C2=A0[2]: https://www.mail-archive.com/qemu-
  devel@nongnu.org/msg569174.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884982/+subscriptions


