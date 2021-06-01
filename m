Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41727391AB5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:48:57 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluq8-0001pL-1e
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llunD-0007IK-4y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:45:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:48414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llun5-0002ND-T9
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:45:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llun4-0000ln-BX
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:45:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 404322E8075
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:45:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 14:36:23 -0000
From: Thomas Huth <1887306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: izbyshev th-huth
X-Launchpad-Bug-Reporter: Alexey Izbyshev (izbyshev)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159458406053.7310.1285869489559583574.malonedeb@wampee.canonical.com>
Message-Id: <162203978387.31909.11605692406802046131.malone@wampee.canonical.com>
Subject: [Bug 1887306] Re: qemu-user deadlocks when forked in a multithreaded
 process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 2c637c55bec5ad8467f3c656f67b2189029279ea
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/358


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #358
   https://gitlab.com/qemu-project/qemu/-/issues/358

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1887306

Title:
  qemu-user deadlocks when forked in a multithreaded process

Status in QEMU:
  Expired

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

