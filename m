Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5F215397
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 09:56:44 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsLzX-0004Cq-Ll
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 03:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jsLyV-0003FY-8a
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:55:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:60434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jsLyR-0000os-Pg
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jsLyP-00082Q-SY
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 07:55:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BDD412E8107
 for <qemu-devel@nongnu.org>; Mon,  6 Jul 2020 07:55:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2020 07:46:44 -0000
From: Thomas Huth <1886343@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth wilson-q
X-Launchpad-Bug-Reporter: Wilson-q (wilson-q)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159397709821.1977.12730820791239292652.malonedeb@wampee.canonical.com>
Message-Id: <159402160467.32564.3865274530063796626.malone@chaenomeles.canonical.com>
Subject: [Bug 1886343] Re: configure has non-posix bash syntax
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1f0321d9d5bde8522005d5933bd53619390fcec1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 03:55:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1886343 <1886343@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for reporting! Seems like others ran into this problem, too - a patc=
h is already on the list:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg08967.html

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886343

Title:
  configure has non-posix bash syntax

Status in QEMU:
  Confirmed

Bug description:
  which gives an error when run on a system that uses dash for /bin/sh.

  The problem is at line 6464 which has
      if test "$have_keyring" =3D=3D "yes"
  the double equal sign is non-posix bash syntax that isn't accepted by pos=
ix shells like dash.  This was added 2020-05-25 according to git blame so l=
ooks like a recent problem.

  On an Ubuntu 20.04 system with top of tree sources I get
  gondor:2027$ ../qemu/configure --prefix=3D/home/wilson/FOSS/qemu/install-=
qemu-tmp --target-list=3Driscv64-linux-user,riscv64-softmmu,riscv32-linux-u=
ser,riscv32-softmmu
  ../qemu/configure: 6464: test: yes: unexpected operator
  ...

  configure completes OK, so this is a minor problem.  It is just one
  configure test that is failing to work properly.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886343/+subscriptions

