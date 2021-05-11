Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A1379F71
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:58:49 +0200 (CEST)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLPs-0007Y9-Nz
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDP-0006i5-7u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDN-0006RH-7I
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgLDL-0004Gh-Cr
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C8512E818D
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:36:52 -0000
From: Thomas Huth <1824344@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: amd64 i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mhodog th-huth zsojka
X-Launchpad-Bug-Reporter: =?utf-8?q?Zden=C4=9Bk_Sojka_=28zsojka=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155498568620.8246.6921870539036246816.malonedeb@wampee.canonical.com>
Message-Id: <162071141211.6558.2175089457205565623.malone@gac.canonical.com>
Subject: [Bug 1824344] Re: x86: retf or iret pagefault sets wrong error code
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: e256306c4b81ecab002aeefe8e2530170318db54
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
Reply-To: Bug 1824344 <1824344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/265


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #265
   https://gitlab.com/qemu-project/qemu/-/issues/265

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1824344

Title:
  x86: retf or iret pagefault sets wrong error code

Status in QEMU:
  Expired

Bug description:
  With a x86_64 or i386 guest, non-KVM, when trying to execute a
  "iret/iretq/retf" instruction in userspace with invalid stack pointer
  (under a protected mode OS, like Linux), wrong bits are set in the
  pushed error code; bit 2 is not set, indicating the error comes from
  kernel space.

  If the guest OS is using this flag to decide whether this was a kernel
  or user page fault, it will mistakenly decide a kernel has irrecoverably
  faulted, possibly causing guest OS panic.

  =

  How to reproduce the problem a guest (non-KVM) Linux:
  Note, on recent Linux kernel version, this needs a CPU with SMAP support
  (eg. -cpu max)

  $ cat tst.c
  int main()
  {
  __asm__ volatile (
  "mov $0,%esp\n"
  "retf"
  );
  return 0;
  }

  $ gcc tst.c
  $ ./a.out
  Killed

  =

  "dmesg" shows the kernel has in fact triggered a "BUG: unable to handle
  kernel NULL pointer dereference...", but it has "recovered" by killing
  the faulting process (see attached screenshot).

  =

  Using self-compiled qemu from git:
  commit 532cc6da74ec25b5ba6893b5757c977d54582949 (HEAD -> master, tag: v4.=
0.0-rc3, origin/master, origin/HEAD)
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Wed Apr 10 15:38:59 2019 +0100

      Update version for v4.0.0-rc3 release
      =

      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1824344/+subscriptions

