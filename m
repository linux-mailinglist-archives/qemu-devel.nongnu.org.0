Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18E3375030
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:31:01 +0200 (CEST)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYTM-0004Oj-S1
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOW-0008JY-A4
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:54828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leYOS-0006P1-Lm
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:26:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leYOR-0000SU-Bw
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 528EA2E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 07:11:17 -0000
From: Thomas Huth <1866577@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158371718383.12217.15072587639340612485.malonedeb@wampee.canonical.com>
Message-Id: <162028507796.3176.2485328986654640937.malone@gac.canonical.com>
Subject: [Bug 1866577] Re: powerpc-none-eabi-gdb.exe GDB 9.1 with QEMU 4.2
 gdb-stub comes with Reply contains invalid hex digit 79
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 23d0689e17b2bd3354e92b4657aab57468d86aff
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
Reply-To: Bug 1866577 <1866577@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which parameters do you use to run QEMU?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1866577

Title:
  powerpc-none-eabi-gdb.exe GDB 9.1 with QEMU 4.2 gdb-stub comes with
  Reply contains invalid hex digit 79

Status in QEMU:
  Incomplete

Bug description:
  I am using powerpc-none-eabi-gdb with qemu 4.2, but it comes with =

  the following error:

  undefinedC:\CI-Tools\msys64\powerpc-none-eabi\usr\local\bin\powerpc-
  none-eabi-gdb.exe: warning: Couldn't determine a path for the index
  cache directory.

  ```Not implemented stop reason (assuming exception): undefined```
  The target architecture is assumed to be powerpc:603

  ```
  Reply contains invalid hex digit 79
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1866577/+subscriptions

