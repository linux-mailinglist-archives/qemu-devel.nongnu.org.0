Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1E2B5ED0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:04:22 +0100 (CET)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezif-0005WH-8E
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kezgP-0003YK-Hl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:02:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kezgN-0005lc-3z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:02:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kezgJ-0004g0-Fk
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 12:01:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6295A2E81B8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 12:01:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 11:52:41 -0000
From: Thomas Huth <1681688@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jemmy858585 kwolf-redhat th-huth
X-Launchpad-Bug-Reporter: Lidong Chen (jemmy858585)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170411080154.12474.20009.malonedeb@gac.canonical.com>
Message-Id: <160561396152.29047.14691681329062041249.malone@gac.canonical.com>
Subject: [Bug 1681688] Re: qemu live migration failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 9f175018ff730778a15d67ced23dcd1b840379ff
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
Reply-To: Bug 1681688 <1681688@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681688

Title:
  qemu live migration failed

Status in QEMU:
  Incomplete

Bug description:
  qemu live migration failed

  the dest qemu report this error.

  Receiving block device images
  Completed 0 %^Mqemu-system-x86_64: block/io.c:1348: bdrv_aligned_pwritev:=
 Assertion `child->perm & BLK_PERM_WRITE' failed.

  this bug is caused by this patch:
  http://git.qemu-project.org/?p=3Dqemu.git;a=3Dcommit;h=3Dd35ff5e6b3aa3a70=
6b0aa3bcf11400fac945b67a

  rollback this commit, the problem solved.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681688/+subscriptions

