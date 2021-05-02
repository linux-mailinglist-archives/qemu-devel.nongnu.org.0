Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DF370E66
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:13:46 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGbB-0001Ty-61
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGYS-0000e2-H7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:10:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldGYP-0001xR-Hj
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:10:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldGYN-0008HW-9d
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4338E2E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 18:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 18:00:06 -0000
From: Thomas Huth <1884982@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: documentation
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5 pmaydell th-huth
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159301155950.13634.250500637103712065.malonedeb@wampee.canonical.com>
Message-Id: <161997840704.4935.990312762592824240.malone@chaenomeles.canonical.com>
Subject: [Bug 1884982] Re: User-emu documentation mentions inexistent
 "runtime" downloads
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 3c23450363a630a1eeaab466deb27cbd1d845b3a
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
Reply-To: Bug 1884982 <1884982@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW, seems like Peter's patch got included here:
https://gitlab.com/qemu-project/qemu/-/commit/5b30c53041d8f4c26ed3cf
... but I guess we still need a patch for the Networking section?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884982

Title:
  User-emu documentation mentions inexistent "runtime" downloads

Status in QEMU:
  In Progress

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

