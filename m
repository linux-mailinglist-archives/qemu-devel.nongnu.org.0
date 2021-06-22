Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED03AFC11
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:37:32 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYAF-0006lt-A3
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXze-00079c-Vf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:56476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvXzb-00052i-1u
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:26:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvXzM-00014I-Ho
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0162F2E81BF
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:26:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:31 -0000
From: Launchpad Bug Tracker <1843852@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee janitor jnsnow th-huth
X-Launchpad-Bug-Reporter: John Snow (jnsnow)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <156833045171.17307.14707838609727225916.malonedeb@gac.canonical.com>
Message-Id: <162433551180.20423.15688798921305934008.malone@loganberry.canonical.com>
Subject: [Bug 1843852] Re: QEMU does not express a dependency on
 perl-Test-Harness
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 10a48cb5b4e25721d8b610f3e3841f6127581012
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
Reply-To: Bug 1843852 <1843852@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843852

Title:
  QEMU does not express a dependency on perl-Test-Harness

Status in QEMU:
  Expired

Bug description:
  This is a minor thing; in Fedora you can install most of the developer
  dependencies by issuing something like `dnf builddep qemu-kvm` and
  this takes care of just about everything such that you can run
  ./configure and make.

  For "make check" though, configure doesn't catch that you'll need
  perl-Test-Harness; so it fails halfway through the check routine, and
  you'll see this:

  ```
  Can't locate TAP/Parser.pm in @INC (you may need to install the TAP::Pars=
er module) (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /u=
sr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /u=
sr/share/perl5) at ./scripts/tap-driver.pl line 30.
  BEGIN failed--compilation aborted at ./scripts/tap-driver.pl line 30.
  make: *** [/home/jhuston/src/qemu/tests/Makefile.include:905: check-unit]=
 Error 2
  ```

  I'm not sure how we should express this dependency; it shouldn't be a
  requirement for building, but it IS a dependency for testing. We
  probably ought not let users skip the qapi tests just because they
  don't have the perl requirement met.

  (And, separately, the Fedora package should list this as a builddep,
  but that's not an issue for here.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843852/+subscriptions

