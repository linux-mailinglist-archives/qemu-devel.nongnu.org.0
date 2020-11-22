Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC342BC2D1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 01:11:47 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcyo-0002kz-EW
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 19:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcxt-0002KE-Af
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 19:10:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:57426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcxo-00070r-Hy
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 19:10:49 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgcxl-0002yr-8c
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 00:10:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3CEEF2E804A
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 00:10:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2020 00:03:12 -0000
From: Peter Maydell <1884982@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: documentation
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5 pmaydell
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <159301155950.13634.250500637103712065.malonedeb@wampee.canonical.com>
Message-Id: <160600339250.28892.16606441781628310159.malone@chaenomeles.canonical.com>
Subject: [Bug 1884982] Re: User-emu documentation mentions inexistent
 "runtime" downloads
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: c20d0f29a9281939f26f2a339a0994ca53de5ba3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1884982 <1884982@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch removes the whole 'quick start' section from the user mode
manual, including the references to the outdated tarballs:
https://patchew.org/QEMU/20201122000131.18487-1-peter.maydell@linaro.org/


** Changed in: qemu
       Status: New =3D> In Progress

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

