Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1502B1F59
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:57:39 +0100 (CET)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbSE-0005MF-RV
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQV-00045C-5h
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:43238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQT-0000QF-6Q
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbQS-0003CU-2W
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 11E312E811E
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 15:48:38 -0000
From: Thomas Huth <1791763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sandra.codesourcery th-huth
X-Launchpad-Bug-Reporter: Sandra Loosemore (sandra.codesourcery)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153659924985.31926.8442483749515675177.malonedeb@soybean.canonical.com>
Message-Id: <160528251891.32656.3677196929779671167.malone@chaenomeles.canonical.com>
Subject: [Bug 1791763] Re: broken signal handling in nios2 user-mode emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: a3011f85d62891546778049fc37eb7865fbbc2d4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1791763 <1791763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1791763

Title:
  broken signal handling in nios2 user-mode emulation

Status in QEMU:
  Incomplete

Bug description:
  This bug is against the 3.0 release.

  It appears that the signal handling parts of the nios2 user-mode
  emulation have never really been completed or tested.  Some examples
  of failing tests from the GCC testsuite are gcc.dg/pr78185.c and
  gcc.dg/cleanup-10.c.

  Some problems I've identified and tried to fix with the attached patch
  are:

  - Code copied from the Linux kernel wasn't adjusted to differentiate
  between host and target data types and address spaces.

  - The sigaltstack() system call returns EINVAL because fields are
  listed in the wrong order in struct target_sigaltstack.

  With this patch, the system calls to set up the signal handler are
  returning successfully, but the handler isn't being invoked, so
  something is still wrong.  I think I need another pair of eyes to look
  over this code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1791763/+subscriptions

