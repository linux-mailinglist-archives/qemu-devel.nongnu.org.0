Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFA381831
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:22:42 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsNV-0004VV-RA
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsLf-0002LY-Ep
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:56476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsLc-0004OQ-9v
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:20:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsLZ-0001GE-Qg
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C8D892E813A
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:12:53 -0000
From: Thomas Huth <1926521@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier th-huth vitalybuka
X-Launchpad-Bug-Reporter: Vitaly Buka (vitalybuka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161964685051.14413.3981056017382622620.malonedeb@wampee.canonical.com>
Message-Id: <162107717352.21152.3117472905347794440.malone@soybean.canonical.com>
Subject: [Bug 1926521] Re: QEMU-user ignores MADV_DONTNEED
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 4a6ce62a5fa255411956981044b46082ebd23956
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
Reply-To: Bug 1926521 <1926521@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1926521

Title:
  QEMU-user ignores MADV_DONTNEED

Status in QEMU:
  Incomplete

Bug description:
  There is comment int the code "This is a hint, so ignoring and returning =
success is ok"
  https://github.com/qemu/qemu/blob/b1cffefa1b163bce9aebc3416f562c1d3886eea=
a/linux-user/syscall.c#L11941

  But it seems incorrect with the current state of Linux

  "man madvise" or https://man7.org/linux/man-pages/man2/madvise.2.html
  says the following:
  >>  These advice values do not influence the semantics
  >>       of the application (except in the case of MADV_DONTNEED)

  >> After a successful MADV_DONTNEED operation, the semantics
  >> of memory access in the specified region are changed:
  >> subsequent accesses of pages in the range will succeed,
  >> but will result in either repopulating the memory contents
  >> from the up-to-date contents of the underlying mapped file
  >> (for shared file mappings, shared anonymous mappings, and
  >> shmem-based techniques such as System V shared memory
  >> segments) or zero-fill-on-demand pages for anonymous
  >> private mappings.

  Some applications use this behavior clear memory and it
  would be nice to be able to run them on QEMU without
  workarounds.

  Reproducer on "Debian 5.10.24 x86_64 GNU/Linux" as a host.

  =

  ```
  #include "assert.h"
  #include "stdio.h"
  #include <sys/mman.h>
  #include <errno.h>

  int main() {
    char *P =3D (char *)mmap(0, 4096, PROT_READ | PROT_WRITE,
                           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    assert(P);
    *P =3D 'A';
    while (madvise(P, 4096, MADV_DONTNEED) =3D=3D -1 && errno =3D=3D EAGAIN=
) {
    }
    assert(*P =3D=3D 0);

    printf("OK\n");
  }

  /*
  gcc /tmp/madvice.c -o /tmp/madvice

  qemu-x86_64 /tmp/madvice
  madvice: /tmp/madvice.c:13: main: Assertion `*P =3D=3D 0' failed.
  qemu: uncaught target signal 6 (Aborted) - core dumped
  Aborted

  /tmp/madvice
  OK

  =

  */

  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926521/+subscriptions

