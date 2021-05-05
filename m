Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9473739A4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:45:29 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFy4-0003AD-KF
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFu5-0001fS-JI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:54506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFu2-0002HV-Hy
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFu0-0003T9-O3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:41:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B0EF32E818F
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:28:33 -0000
From: Thomas Huth <1829459@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crockabiscuit laurent-vivier th-huth ubi-one-kenubi
X-Launchpad-Bug-Reporter: crocket (crockabiscuit)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155806778498.21734.945063058665872727.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021411375.3126.13355415578678125729.malone@gac.canonical.com>
Subject: [Bug 1829459] Re: qemu seems to lack support for pid namespace.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: d6f5deb6ef5ed4096067c248dd774df81b8588ef
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1829459 <1829459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/172


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #172
   https://gitlab.com/qemu-project/qemu/-/issues/172

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829459

Title:
  qemu seems to lack support for pid namespace.

Status in QEMU:
  Expired

Bug description:
  # Version

  qemu-4.0.0
  glibc-2.28

  # commands used to launch qemu-aarch64 in user mode.

  : ${QEMU_BINFMT_FLAGS:=3DOC}

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}"
  >/proc/sys/fs/binfmt_misc/register

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l

  # host

  Gentoo Linux amd64

  # Guest

  Gentoo Linux aarch64

  # The problem that I have

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.

  # Workaround

  Disable pid-sandbox in emerge.

  # How to reproduce the issue

  Execute

  unshare --pid -- echo hello world

  or

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829459/+subscriptions

