Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82C2B5E11
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:13:28 +0100 (CET)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyvP-0007mM-PZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keytm-0006uz-Ee
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:11:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:54564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keytk-00049D-Ef
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:11:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keyth-0005We-25
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:11:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E541C2E8131
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:11:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 11:05:31 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1858461@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aladjev-andrew amarkovic pmaydell
X-Launchpad-Bug-Reporter: puchuu (aladjev-andrew)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <157833123209.15024.12557979334447840996.malonedeb@wampee.canonical.com>
Message-Id: <160561113163.27496.2313775571214855752.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1858461] Re: Please refactor linux-user/mips/cpu_loop.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 3b32e504b96c725ea97789cdaf398fbf38fbebe2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 04:35:40
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
Reply-To: Bug 1858461 <1858461@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: linux-user mips

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858461

Title:
  Please refactor linux-user/mips/cpu_loop.c

Status in QEMU:
  New

Bug description:
  Hello. I am working with qemu on test images. I've added a new syscall
  (436) to qemu but received ENOSYS from mips application.

  Please open "linux-user/mips/cpu_loop.c". I've added at the end of
  "mips_syscall_args" the following:

  ```
  MIPS_SYS(sys_getdents64_x32, 3)
  ```

  But

  ```
  syscall_num =3D env->active_tc.gpr[2] - 4000;
  if (syscall_num >=3D sizeof(mips_syscall_args)) {
    ret =3D -TARGET_ENOSYS;
  ```

  returns -TARGET_ENOSYS

  We can see that "linux-user/mips/cpu_loop.c" differs a lot from
  "linux-user/arm/cpu_loop.c". Arm has it's own "ARM_NR_BASE" and etc.

  Can you please refactor mips cpu loop in the same way as arm? Thank
  you.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858461/+subscriptions

