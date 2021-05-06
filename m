Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A29B375158
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:16:56 +0200 (CEST)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea7Z-0002yc-WE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyb-0002bs-Ch
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:58746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZyX-0003BL-BP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:07:21 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZyS-0001JA-D9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC36F2E81C0
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 09:07:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:58:52 -0000
From: Thomas Huth <1860575@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange lemonboy th-huth
X-Launchpad-Bug-Reporter: The Lemon Man (lemonboy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157970748795.4848.1694391096642821939.malonedeb@chaenomeles.canonical.com>
Message-Id: <162029153289.6519.14085419891793338471.malone@wampee.canonical.com>
Subject: [Bug 1860575] Re: qemu64 CPU model is incorrect
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 6df3d95dec504abb049e26ab22a0f18b862aea63
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
Reply-To: Bug 1860575 <1860575@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/191


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #191
   https://gitlab.com/qemu-project/qemu/-/issues/191

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860575

Title:
  qemu64 CPU model is incorrect

Status in QEMU:
  Expired

Bug description:
  At the moment the "qemu64" CPU is defined as follows:

  ```
          .vendor =3D CPUID_VENDOR_AMD,
          .family =3D 6,
          .model =3D 6,
          .stepping =3D 3,
  ```

  According to Wikipedia [1] this means the CPU is defined as part of the
  K7 family while the AMD64 ISA was only introduced with the K8 series!

  This causes some software such as LLVM to notice the problem (32-bit cpu
  with 64-bit capability reported in the cpuid flag) and produce various
  error messages.

  The simple solution would be to upgrade this definition to use the Sledge=
hammer
  family (15) instead. =


  [1] https://en.wikipedia.org/wiki/List_of_AMD_CPU_microarchitectures

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860575/+subscriptions

