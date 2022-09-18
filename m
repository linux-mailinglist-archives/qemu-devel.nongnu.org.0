Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F65BBF96
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:50:01 +0200 (CEST)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0Ii-00046l-L1
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ez-000732-7I
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:56043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Es-0007bS-V8
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530356;
 bh=J6TpzNYIKC9//fCLfiY4BZdyvKb50TjTbjXgU2lhjaw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BsyL3IcYbmQak5C6yd2TuQO5yprFUBkM50iGpbth++lrjHuvlx6gQ+WEAFcEdZSze
 Mu2ZT01zFejo92LX1aMYdcwmTbKli5U6lK8+b6XveudBgZcfQQxLS91m1MTD5qUMEC
 3RRSBSN26jRnYXLWZDet+pfD002ZgD0KrqBhXeHQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgesG-1pEpEO0vFM-00h5i7; Sun, 18
 Sep 2022 21:45:56 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 00/12] linux-user: Add more syscalls,
 enhance tracing & logging enhancements
Date: Sun, 18 Sep 2022 21:45:43 +0200
Message-Id: <20220918194555.83535-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G5hFi7oW85MCYUpScEBvGJIq28d/MGWMDB00qpBM8M9zameo4MS
 w5Ppux4ZZ2Ryz2dvxTNC4wffYR81nKMRf92qTKmhVEOYJZRqVMEMFplokUmXvtYAMo6i0zi
 mIPDGBJiwQ65cJYNxVA3WA1oCiftFxoJlZGG1T1W3tic/dch/gbQjzScWogcGKflBIoT1UT
 CvJ7GfLj6+4uI63V1d8tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iE9Vmhdoyhg=:Yf9KZmc9Kun1wjgI5XTXW2
 eVpMHUfQPfYkCO7lwXNbVYYAWzhxwWGj4pzqyki28hkRHRKxL+eA+SqgQSq29rEL2taRF/VjV
 ysvMaRykZQI6NA9Izbcl+V/GIqB/hFC4C+mgXs+2hxdcPL+X+SxtrPEylPGTNWTo2GMH2sqMW
 1kzzSnk7Y62m3PSZSXxbXFIGK25MvFbm080uR+obOnSJN3OcmoQuJ4wSXoy+tU6ImCHeHgfmi
 UKxuZFP6Wh31AREM+dtwmgX574/yx1/IUEHTnsudmdWrawrUiSG9Kew/ty4KnKndH8UIbT0tT
 bv/8JKmLfE8/7xaMuUhw+fI/YcPpukJbs46BWlus1lE2DZZorKLf7eiQNckHdKML7aMBY76Qb
 VZ09cUi6SMDhTnkkO5TEcsEQkhEvCBc66LvulJ3r452PlTHCdJ4Q8+WhCjRaAk/WaGEZO4DPN
 l+VQ1mhNaQm9td6Jy6TBOIZv80XJVGK2VgRzqXJZuX0qUD16MEqTmAbrCF/lFJ+hH/L7mNPE2
 P21w6ObosFF/5Hp62vPR+U04Wv0oiacj5rq2oh2tplSV3NfiAvDytMF0ND8JEIm/icAKUT9D2
 b57KTdH0zvAKSrZB31+LSNcxc6UT+fBU7LL23mkRQ89103uQJeZHc1rzXW4jm5eDwqUsGhc0H
 en6Kd92otT+3Gmplw13ZSj4WujNGjPXlLOMWfqLh3zjl5tlxStpH/MwGj6OCU7D7JxtdLM1on
 Q9MTy4iB9F7QJB0B5anScQuRrS2zjoHWI5LCEGnwrC+Ppst6JU8H1QX5A0+ZqFk+pcGkHYhC7
 elWgIPwvcxXXwHHcjFzumR1YoqZBhLjdR8QcQgDebc5mT4UuVMKLjVM0GB4LIRbjsrilFcKce
 7RmR/RNAnf8FM4LzT75+DpEg/Qxg3XtpfWi5qgr0H7aV66zXv94q/sl5ZBL7NR2TdfJI7Zy4e
 jidq534HmblNvsBhlrjxIUlwvc6JlKIR/GgrXL0U5u52A1gKOLEp5B6pjIoJgj2XLMXxR/IVW
 ocdylaamJpxfv+jIMzZtStBvfYfQKryw+OgqlHmNK64eJQpReagcTC+wVXvWe+6T62vICXk9L
 1g1OogSokVpWRrI8Z5qY7sbWyYfDvT9JwtvErZ2YNkTdHqf9iRzSeA5FBNFIqq++EeTBY6wwD
 wuXbLSWIMme/uMuTY7a19rGCbF
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is a bunch of patches for linux-user.

Most of them add missing syscalls and enhance the tracing/logging.
Some of the patches are target-hppa specific.
I've tested those on productive hppa debian buildd servers (running qemu-u=
ser).

Thanks!
Helge

Changes to v2:
- Fix build of close_range() and pidfd_*() patches on older Linux
  distributions (noticed by Stefan Hajnoczi)

Changes to v1:
- Dropped the faccessat2() syscall patch in favour of Richard's patch
- Various changes to the "missing signals in strace output" patch based on
  Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build =
when
  TARGET_SIGIOT does not exist
- Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
  unconditionally and turn into a switch statement - as suggested by Richa=
rd

Helge Deller (12):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace
  linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
    syscalls
  linux-user: Log failing executable in EXCP_DUMP()
  linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
  linux-user/hppa: Dump IIR on register dump
  linux-user: Fix strace of chmod() if mode =3D=3D 0
  linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
  linux-user: Add strace for clock_nanosleep()
  linux-user: Show timespec on strace for futex()
  linux-user: Add close_range() syscall
  linux-user: Add parameters of getrandom() syscall for strace

 linux-user/cpu_loop-common.h |   2 +
 linux-user/hppa/cpu_loop.c   |   6 +-
 linux-user/mmap.c            |   4 +
 linux-user/signal-common.h   |  46 ++++++++++++
 linux-user/signal.c          |  37 +--------
 linux-user/strace.c          | 142 ++++++++++++++++++++++++++++++-----
 linux-user/strace.list       |  21 +++++-
 linux-user/syscall.c         |  50 ++++++++++++
 target/hppa/helper.c         |   6 +-
 9 files changed, 255 insertions(+), 59 deletions(-)

=2D-
2.37.3


