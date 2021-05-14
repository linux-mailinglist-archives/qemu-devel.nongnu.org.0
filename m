Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE167381104
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 21:40:02 +0200 (CEST)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhdfF-0006Um-Uk
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 15:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdav-00073m-Nr
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdas-0000dG-NS
 for qemu-devel@nongnu.org; Fri, 14 May 2021 15:35:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdar-0003Kf-95
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3BCB12E8192
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 19:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:28:44 -0000
From: Thomas Huth <1912107@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5 th-huth
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161090862069.30717.14713485848942415507.malonedeb@chaenomeles.canonical.com>
Message-Id: <162102052431.7511.5702613657445277287.malone@gac.canonical.com>
Subject: [Bug 1912107] Re: Option to constrain linux-user exec() to emulated
 CPU only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 29816d97c4e568f892759fde5df2a97488f4f454
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1912107 <1912107@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/306


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #306
   https://gitlab.com/qemu-project/qemu/-/issues/306

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912107

Title:
  Option to constrain linux-user exec() to emulated CPU only

Status in QEMU:
  Expired

Bug description:
  When trying to reproduce a bug someone reported on an actual AMD K10[1], =
=E2=80=8BI tried to directly throw `qemu_x86-64 -cpu =

  =E2=80=8Bphenom path/to/wrongly-labelled-instruction-set/gcc 1.c` at the =
problem, but failed to get an "illegal instruction" as expected. A quick in=
vestigation reveals that the error is actually caused by one of gcc's child=
 processess, and that the said process is being ran directly on the host. A=
 similar problem happens with trying to call stuff with /usr/bin/env.

   =E2=80=8B[1]: https://github.com/Homebrew/brew/issues/1034

  Since both the host and the guest are x86_64, I deemed binfmt
  inapplicable to my case. I believe that QEMU should offer a way to
  modify exec() and other spawning syscalls so that execution remains on
  an emulated CPU in such a case. Call it an extra layer of binfmt, if
  you must.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912107/+subscriptions

