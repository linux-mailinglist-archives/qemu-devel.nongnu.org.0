Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F44376FF4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:06:54 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfG73-0005Vv-Ri
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfG5x-0004AT-VM
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:05:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:53930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfG5s-0005wn-60
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:05:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfG5p-0006h6-2A
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 06AB02E800F
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 05:58:37 -0000
From: Thomas Huth <1892684@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rvem th-huth
X-Launchpad-Bug-Reporter: Roman Melnikov (rvem)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159825430524.881.7496481108113681693.malonedeb@wampee.canonical.com>
Message-Id: <162045351723.16316.3735145078525201192.malone@soybean.canonical.com>
Subject: [Bug 1892684] Re: curl and wget segfaults when link has redirects
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: b00bcdeadb4223116af9ea18e26b04ec56127c9b
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
Reply-To: Bug 1892684 <1892684@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892684

Title:
  curl and wget segfaults when link has redirects

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  I've been using qemu-user-static with aarch64 docker images and faced the=
 problem
  using binares from the following release: https://github.com/multiarch/qe=
mu-user-static/releases/tag/v5.0.0-2.

  curl and wget fails with segmentation fault when trying to fetch somethin=
g from the link
  that has some redirects.

  In order to reproduce you can run the following:

  1) Register qemu on x86_64 machine
     docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  2) Run arm64v8 docker image and try to run wget or curl
     docker run --rm -it arm64v8/ubuntu bash
     $ apt update
     $ apt install curl wget
     $ curl -L http://erratique.ch/software/astring/releases/astring-0.8.3.=
tbz
     $ wget  http://erratique.ch/software/astring/releases/astring-0.8.3.tbz

  This error cannot be reproduced with binaries from eariler release https:=
//github.com/multiarch/qemu-user-static/releases/tag/v4.2.0-7.
  curl and wget work fine with the given link and don't fail with segfault =
when using
  older qemu-user-static binaries

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892684/+subscriptions

