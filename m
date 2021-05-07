Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AA375F13
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:16:59 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqz4-0006sT-Rb
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqxs-0006LM-K4
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:15:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:59728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqxq-0006Te-Qy
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:15:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqxo-00041w-GK
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 03:15:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A3422E8192
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 03:15:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 03:06:39 -0000
From: Thomas Huth <1885247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aleksandar-markovic philmd pmaydell th-huth
X-Launchpad-Bug-Reporter: Aleksandar Markovic (aleksandar-markovic)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159315507826.13901.17398620572438937429.malonedeb@wampee.canonical.com>
Message-Id: <162035680000.3420.17272834455985401477.malone@gac.canonical.com>
Subject: [Bug 1885247] Re: Build error in Intel 32-bit hosts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 5914c6c12f22922fea2e7db8595d0903614b79f4
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
Reply-To: Bug 1885247 <1885247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix had been included here:
https://gitlab.com/qemu-project/qemu/-/commit/8b39aa90e90
... thus closing this ticket now.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885247

Title:
  Build error in Intel 32-bit hosts

Status in QEMU:
  Fix Released

Bug description:
  The code base is on master, checked out on Thursday June25th 2020,
  0250c595c9d. The build procedure:

  $ mkdir build-gcc
  $ cd build-gcc
  $ ../configure
  $ make

  The build error message is:

    CC      x86_64-softmmu/hw/hyperv/hyperv.o
    CC      x86_64-softmmu/hw/hyperv/hyperv_testdev.o
    CC      x86_64-softmmu/hw/hyperv/vmbus.o
  /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c: In function =E2=80=98gpad=
l_iter_io=E2=80=99:
  /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c:386:13: error: cast to poi=
nter from integer of different size [-Werror=3Dint-to-pointer-cast]
           p =3D (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_i=
n_page);
               ^
  cc1: all warnings being treated as errors
  make[1]: *** [/home/rtrk/Build/qemu-master/rules.mak:69: hw/hyperv/vmbus.=
o] Error 1
  make: *** [Makefile:527: x86_64-softmmu/all] Error 2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885247/+subscriptions

