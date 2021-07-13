Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D43C6958
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:27:23 +0200 (CEST)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A0w-0000Pg-7c
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zZ-000674-7J
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zV-0008Po-BD
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zR-0003eK-7u
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 626F12E819C
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1916506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acceptance avocado tests
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu janitor th-huth
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161400927228.11180.7056675088982661405.malonedeb@chaenomeles.canonical.com>
Message-Id: <162614984202.15811.14182137206086652883.malone@loganberry.canonical.com>
Subject: [Bug 1916506] Re: make check-venv may leave stale and incomplete
 tests/venv directory directory
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: e599de74f6e5513e4929a275070acc4994e85fdb
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
Reply-To: Bug 1916506 <1916506@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916506

Title:
  make check-venv may leave stale and incomplete tests/venv directory
  directory

Status in QEMU:
  Expired

Bug description:
  As reported by "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>, a "make
  check-venv" can be run and fail to properly create a suitable virtual
  environment, leaving the tests/venv directory which is the target for
  "make check-venv" itself.

  This means that on a subsequent run:

  > $ make check-venv
  >   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
  > tests/fp/berkeley-softfloat-3 dtc capstone slirp
  > make: Nothing to be done for 'check-venv'.

  And the venv will still be incomplete.  The causes of such failures to
  create a suitable virtual environment are too many (in the reported
  case it was because of missing *required* Python packages).  Some more
  evolved virtual environments + Python packaging systems exist that
  could probably be used here (Pipenv) but would add further core
  requirements.

  The current mitigation is to run "make check-clean" when the venv
  appears to be incomplete.

  The goal of this bug is to attempt to make the venv setup atomic and
  more reliable.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916506/+subscriptions

