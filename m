Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C927377B52
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 06:52:47 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfxuQ-0004bt-M6
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 00:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsS-0001xD-HX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:51812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfxsP-0002sH-9u
 for qemu-devel@nongnu.org; Mon, 10 May 2021 00:50:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfxsN-00017Z-B5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 069382E8187
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 04:43:27 -0000
From: Thomas Huth <1905651@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dje th-huth
X-Launchpad-Bug-Reporter: Doug Evans (dje)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160635886967.28413.180075874214780604.malonedeb@chaenomeles.canonical.com>
Message-Id: <162062180710.10558.3403377326222577814.malone@chaenomeles.canonical.com>
Subject: [Bug 1905651] Re: Tests cannot call g_error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: ef2977448748bac411eb5dfc70023c709d4256a4
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
Reply-To: Bug 1905651 <1905651@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1905651

Title:
  Tests cannot call g_error

Status in QEMU:
  Incomplete

Bug description:
  I stumbled on this writing a new test, using tests/qtest/e1000e-test.c
  as a template.

  g_error() causes SIGTRAP, not SIGABRT, and thus the abort handler doesn't=
 get run.
  This in turn means qemu is not killed, which hangs the test because the t=
ap-driver.pl script hangs waiting for more input.
  There are a few tests that call g_error().

  The SIGABRT handler explicitly kills qemu, e.g.:

  qos-test.c:
      qtest_add_abrt_handler(kill_qemu_hook_func, s);

  ref:
  https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtests/qtest/libqtest.c;h=
=3De49f3a1e45f4cd96279241fdb2bbe231029ab922;hb=3DHEAD#l272

  But not unexpectedly there's no such handler for SIGTRAP.

  Apply this patch to trigger a repro:

  diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
  index fc226fdfeb..e83ace1b5c 100644
  --- a/tests/qtest/e1000e-test.c
  +++ b/tests/qtest/e1000e-test.c
  @@ -87,6 +87,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_so=
ckets, QGuestAllocator *a
       /* Wait for TX WB interrupt */
       e1000e_wait_isr(d, E1000E_TX0_MSG_ID);

  +    g_message("Test g_error hang ...");
  +    g_error("Pretend something timed out");
  +
       /* Check DD bit */
       g_assert_cmphex(le32_to_cpu(descr.upper.data) & dsta_dd, =3D=3D, dst=
a_dd);

  Then:

  configure
  make
  make check-qtest-i386

  check-qtest-i386 will take awhile. To repro faster:

  $ grep qtest-i386/qos-test Makefile.mtest
  .test.name.229 :=3D qtest-i386/qos-test
  $ make run-test-229
  Running test qtest-i386/qos-test
  ** Message: 18:40:49.821: Test g_error hang ...

  ** (tests/qtest/qos-test:3820728): ERROR **: 18:40:49.821: Pretend someth=
ing timed out
  ERROR qtest-i386/qos-test - Bail out! FATAL-ERROR: Pretend something time=
d out

  At this point things are hung because tap-driver.pl is still waiting
  for input because qemu is still running.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905651/+subscriptions

