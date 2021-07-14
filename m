Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639E3C7D94
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:33:32 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WaR-0006ij-3Y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUc-00048Z-OC
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:51886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUa-0003kr-4p
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUW-0006pH-NT
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6DF562E8366
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1921082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth yaoaili
X-Launchpad-Bug-Reporter: Yao Aili (yaoaili)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161657493730.24559.14872462058003243751.malonedeb@chaenomeles.canonical.com>
Message-Id: <162623624572.32682.11107984860151743716.malone@loganberry.canonical.com>
Subject: [Bug 1921082] Re: VM crash when process broadcast MCE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: ad14d74e29334605da0cb63bd836a6faa3eb921e
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1921082 <1921082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921082

Title:
  VM crash when process broadcast MCE

Status in QEMU:
  Expired

Bug description:
  When i do memory SRAR test for VM, I meet the following issue:

  My VM has 16 vCPU, I will inject one UE error to memory which is accessed=
 by VM, Then host MCE is raised and SIGBUS is send to VM, and qemu take con=
trol.
  Qemu will check the broadcast attribute by following  cpu_x86_support_mca=
_broadcast(); =20

  Then Qemu may inject MCE to all vCPU, as vCPU is just one process for
  HOST, we can't guarantee all the vCPUs will enter MCE hander in 1S
  sync time, and the VM may panic.

  This issue will be easily fixed by expand monarch_timeout
  configuration, but the exact monarch_timeout can't be easily got, as
  it will depand on the num of vCPUs and current system schedule status.

  I am wondering why VM need broadcast attribute for MCE, When qeme
  process MCE event form host, it will always be signaled for one vCPU?
  If so, why does qemu need boradcast the MCE event to all vCPUs?

  Can weu just deliver LMCE to one specifc vCPU and make this behavior
  default?

  If anything wrong, Please point out.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921082/+subscriptions


