Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31637C3C3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:28:12 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqmR-00070s-LK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgqk2-0004gu-1n
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:25:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:52982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgqk0-0004tQ-2y
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:25:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgqjy-0001D6-Bv
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5941E2E813A
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 15:16:52 -0000
From: Thomas Huth <1907969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier lemonboy th-huth
X-Launchpad-Bug-Reporter: The Lemon Man (lemonboy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160787658999.4842.1029995879259485885.malonedeb@gac.canonical.com>
Message-Id: <162083261325.7727.7256803851030012966.malone@wampee.canonical.com>
Subject: [Bug 1907969] Re: linux-user/i386: Segfault when mixing threads and
 signals
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 5b4dc96f5707304e334e0424763351f5b69ef9d5
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
Reply-To: Bug 1907969 <1907969@bugs.launchpad.net>
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


** Tags added: i386 linux-user

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907969

Title:
  linux-user/i386: Segfault when mixing threads and signals

Status in QEMU:
  Incomplete

Bug description:
  Given the following C program, qemu-i386 will surely and certainly segfau=
lt when executing it.
  The problem is only noticeable if the program is statically linked to mus=
l's libc and, as written
  in the title, it only manifests when targeting i386.

  Removing the pthread calls or the second raise() makes it not
  segfault.

  The crash is in some part of the TCG-generated code, right when it tries =
to perform a
  %gs-relative access.

  If you want a quick way of cross-compiling this binary:

  * Download a copy of the Zig compiler from https://ziglang.org/download/
  * Compile it with
    `zig cc -target i386-linux-musl <C-FILE> -o <OUT>`

  ```
  #include <pthread.h>
  #include <signal.h>
  #include <stdio.h>
  #include <string.h>
  #include <sys/types.h>
  #include <unistd.h>
  #include <asm/prctl.h>
  #include <sys/syscall.h>

  void sig_func(int sig)
  {
      write(1, "hi!\n", strlen("hi!\n"));
  }

  void func(void *p) { }

  typedef void *(*F)(void *);

  int main()
  {
      pthread_t tid;

      struct sigaction action;
      action.sa_flags =3D 0;
      action.sa_handler =3D sig_func;

      if (sigaction(SIGUSR1, &action, NULL) =3D=3D -1) {
          return 1;
      }

      // This works.
      raise(SIGUSR1);

      pthread_create(&tid, NULL, (F)func, NULL);
      pthread_join(tid, NULL);

      // This makes qemu segfault.
      raise(SIGUSR1);
  }
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907969/+subscriptions

