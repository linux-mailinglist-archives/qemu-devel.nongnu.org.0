Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2441D367E15
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:46:58 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVvF-00045h-8j
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVu7-0003Zh-MW
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:45:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:49526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVu5-0002Yq-Rm
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:45:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVu4-00061u-KC
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:45:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CFC62E8041
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:45:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:35:33 -0000
From: Thomas Huth <1574346@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luto-mit th-huth
X-Launchpad-Bug-Reporter: Andy Lutomirski (luto-mit)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160424174546.5288.30510.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908413358.22647.14472123329698015967.malone@gac.canonical.com>
Subject: [Bug 1574346] Re: TCG: mov to segment register is incorrectly
 emulated for AMD CPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 06a8109ba05918c303601d511826e5a9de984b98
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
Reply-To: Bug 1574346 <1574346@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1574346

Title:
  TCG: mov to segment register is incorrectly emulated for AMD CPUs

Status in QEMU:
  Incomplete

Bug description:
  In TCG mode, the effect of:

  xorl %eax, %eax
  movl %eax, %gs

  is to mark the GS segment unusable and set its base to zero.  After
  doing this, reading MSR_GS_BASE will return zero and using a GS prefix
  in long mode will treat the GS base as zero.

  This is correct for Intel CPUs but is incorrect for AMD CPUs.  On an
  AMD CPU, writing 0 to %gs using mov, pop, or (I think) lgs will leave
  the base unchanged.

  To make it easier to use TCG to validate behavior on different CPUs,
  please consider changing the TCG behavior to match actual CPU behavior
  when emulating an AMD CPU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1574346/+subscriptions

