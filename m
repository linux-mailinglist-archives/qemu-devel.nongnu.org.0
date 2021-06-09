Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223A3A1D68
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:03:21 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3U0-0001je-E7
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lr3Rj-0000N6-HI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:01:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lr3Rd-0002ey-Gp
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:00:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lr3Ra-0001EM-3j
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 19:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F05A82E8167
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 19:00:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Jun 2021 18:53:23 -0000
From: John Snow <1921061@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 6-u3untu-h jnsnow th-huth
X-Launchpad-Bug-Reporter: Russell Morris (6-u3untu-h)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <161654808841.23607.13822796780403513821.malonedeb@chaenomeles.canonical.com>
Message-Id: <162326480351.14242.16653021273358572796.malone@gac.canonical.com>
Subject: [Bug 1921061] Re: Corsair iCUE Install Fails, qemu VM Reboots
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: c37bc2a1f59e61d19139530c0031a5ad81a8c940
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
Reply-To: Bug 1921061 <1921061@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Russel, this bug has been migrated to the new GitLab issue tracker;
can you provide me with some extra information over on the new tracker,
please?

(I am *very* likely to miss updates here.)

1. What is your QEMU command line? (A full, working command-line, but the s=
mallest one you can reproduce the problem with is helpful.)
2. What is your host environment? (distro/linux kernel version, CPU model)
3. What happens *exactly* when you try to install iCUE? Windows reboots -- =
in what way? Does it bluescreen, or does it just reboot immediately and the=
n continue on as if nothing happened? Are there any errors/warnings/output =
from QEMU at all? Does QEMU crash?

Some other information that might be helpful if you have it:

4. Is there a version of QEMU where this works correctly for you still? Do =
you know when the problem appeared?
5. Depending on exactly how the VM reboots, you *may* have information in y=
our windows event viewer logs -- do you see any warnings or errors in there=
 that might be relevant?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921061

Title:
  Corsair iCUE Install Fails, qemu VM Reboots

Status in QEMU:
  Expired

Bug description:
  Hi,

  I had this working before, but in the latest version of QEMU (built
  from master), when I try to install Corsair iCUE, and it gets to the
  driver install point =3D> my Windows 10 VM just reboots! I would be
  happy to capture logs, but ... what logs exist for an uncontrolled
  reboot? Thinking they are lost in the reboot :-(.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921061/+subscriptions

