Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D2375F93
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 06:52:22 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lesTN-0007PD-Lk
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 00:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesRi-00063m-5h
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:37342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesRg-0005Lb-CF
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:50:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lesRf-00058m-1b
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 04:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 06A062E813A
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 04:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 04:41:15 -0000
From: Thomas Huth <1887306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: izbyshev th-huth
X-Launchpad-Bug-Reporter: Alexey Izbyshev (izbyshev)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159458406053.7310.1285869489559583574.malonedeb@wampee.canonical.com>
Message-Id: <162036247580.14776.9218620078622173874.malone@soybean.canonical.com>
Subject: [Bug 1887306] Re: qemu-user deadlocks when forked in a multithreaded
 process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 5869e333f160a31d59512585b544f07eb69f9a67
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
Reply-To: Bug 1887306 <1887306@bugs.launchpad.net>
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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1887306

Title:
  qemu-user deadlocks when forked in a multithreaded process

Status in QEMU:
  Incomplete

Bug description:
  The following program (also attached) deadlocks when run under QEMU
  user on Linux.

  #include <pthread.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <sys/types.h>
  #include <sys/wait.h>
  #include <unistd.h>

  #define NUM_THREADS 100
  #define NUM_FORKS 10

  pthread_barrier_t barrier;

  void *t(void *arg) {
      for (int i =3D 0; i < NUM_FORKS; i++) {
          pid_t pid =3D fork();
          if (pid < 0)
              abort();
          if (!pid)
              _exit(0);
          if (waitpid(pid, NULL, 0) < 0)
              abort();
      }
      //pthread_barrier_wait(&barrier);
      return NULL;
  }

  int main(void) {
      pthread_barrier_init(&barrier, NULL, NUM_THREADS);
      pthread_t ts[NUM_THREADS];
      for (size_t i =3D 0; i < NUM_THREADS; i++) {
          if (pthread_create(&ts[i], NULL, t, NULL))
              abort();
      }
      for (size_t i =3D 0; i < NUM_THREADS; i++) {
          pthread_join(ts[i], NULL);
      }
      printf("Done: %d\n", getpid());
      return 0;
  }

  To reproduce:
  $ gcc test.c -pthread
  $ while qemu-x86_64 ./a.out; do :; done

  (Be careful, Ctrl-C/SIGINT doesn't kill the deadlocked child).

  Larger values of NUM_THREADS/NUM_FORKS lead to more often deadlocks.
  With the values above it often deadlocks on the first try on my
  machine. When it deadlocks, there is a child qemu process with two
  threads which is waited upon by one of the worker threads of the
  parent.

  I tried to avoid the deadlock by serializing fork() with a mutex, but
  it didn't help. However, ensuring that no thread exits until all forks
  are done (by adding a barrier to t()) does seem to help, at least, the
  program above could run for a half an hour until I terminated it.

  Tested on QEMU 5.0.0, 4.2.0 and 2.11.1, with x86_64 and AArch64 linux-
  user targets.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1887306/+subscriptions

