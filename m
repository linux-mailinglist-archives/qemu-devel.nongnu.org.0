Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FB379F07
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:13:29 +0200 (CEST)
Received: from localhost ([::1]:34028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgKi0-0006lS-P2
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKfR-0004ZE-00
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:10:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKfO-0002xI-QJ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:10:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKfM-0007rS-CX
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:10:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CD2E2E8030
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:10:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:03:45 -0000
From: Thomas Huth <1878501@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: husseydevin laurent-vivier rth th-huth
X-Launchpad-Bug-Reporter: easyaspi314 (husseydevin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158941344748.31408.6066832909673515633.malonedeb@chaenomeles.canonical.com>
Message-Id: <162070942570.6707.17748030357064385858.malone@gac.canonical.com>
Subject: [Bug 1878501] Re: qemu-i386 does not define AT_SYSINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4b47ab6a414f4fe21d327452b06c011e0da6f36b
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
Reply-To: Bug 1878501 <1878501@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1878501

Title:
  qemu-i386 does not define AT_SYSINFO

Status in QEMU:
  Incomplete

Bug description:
  qemu-i386 does not define the AT_SYSINFO auxval when running i386
  Linux binaries.

  On most libcs, this is properly handled, but this is mandatory for the
  i686 Bionic (Android) libc or it will segfault.

  This is due to a blind assumption that getauxval(AT_SYSINFO) will
  return a valid function pointer:

  The code varies from version to version, but it looks like this:

  void *__libc_sysinfo;
  // mangled as _Z19__libc_init_sysinfov
  void __libc_init_sysinfo() {
    bool dummy;
    // __bionic_getauxval =3D getauxval
    __libc_sysinfo =3D reinterpret_cast<void *>(__bionic_getauxval(AT_SYSIN=
FO, dummy));
  }

  A simple way to reproduce is to compile a basic C program against the
  NDK:

  int main(void) { return 0; }

  $ i686-linux-android-clang -static empty.c -o empty
  $ qemu-i386 -cpu max ./empty
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault

  The place where it segfaults is misleading: It will, at least on the
  current NDK, crash on __set_thread_area, this is due to it calling a
  function pointer to __libc_sysinfo returned by __kernel_syscall.

  QEMU 4.1.1 (aarch64)
  Pixel 2 XL via Termux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878501/+subscriptions

