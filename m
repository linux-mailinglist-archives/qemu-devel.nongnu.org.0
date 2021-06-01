Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FF3971BA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:42:17 +0200 (CEST)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1qi-0003BG-QB
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lo1ps-0002Vd-6U
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:41:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:39152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lo1pn-0005pu-Gt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:41:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lo1pk-0004IK-EB
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 10:41:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3B8102E8194
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 10:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Jun 2021 10:33:35 -0000
From: Thomas Huth <1879955@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell th-huth
X-Launchpad-Bug-Reporter: Peter Maydell (pmaydell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159006849314.7162.9087011214859581235.malonedeb@gac.canonical.com>
Message-Id: <162254361588.1249.13324027477364113823.malone@gac.canonical.com>
Subject: [Bug 1879955] Re: target/i386/seg_helper.c: 16-bit TSS struct format
 wrong?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="925b661396f90467a0d31fdfb13d4990b7239925"; Instance="production"
X-Launchpad-Hash: 4d678c10d18ca6b75ed59e2093f6d51eb436c70f
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
Reply-To: Bug 1879955 <1879955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/382


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #382
   https://gitlab.com/qemu-project/qemu/-/issues/382

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879955

Title:
  target/i386/seg_helper.c: 16-bit TSS struct format wrong?

Status in QEMU:
  Expired

Bug description:
  In target/i386/seg_helper.c:switch_tss_ra() we have the following code
  to load registers from a 16-bit TSS struct:

          /* 16 bit */
          new_cr3 =3D 0;
          new_eip =3D cpu_lduw_kernel_ra(env, tss_base + 0x0e, retaddr);
          new_eflags =3D cpu_lduw_kernel_ra(env, tss_base + 0x10, retaddr);
          for (i =3D 0; i < 8; i++) {
              new_regs[i] =3D cpu_lduw_kernel_ra(env, tss_base + (0x12 + i =
* 2),
                                               retaddr) | 0xffff0000;
          }
          for (i =3D 0; i < 4; i++) {
              new_segs[i] =3D cpu_lduw_kernel_ra(env, tss_base + (0x22 + i =
* 4),
                                               retaddr);
          }
          new_ldt =3D cpu_lduw_kernel_ra(env, tss_base + 0x2a, retaddr);

  This doesn't match up with the structure described here:
  https://www.sandpile.org/x86/tss.htm -- which has only 2-byte slots
  for the segment registers. It also makes the 3rd segreg use the same
  offset as the LDTR, which is very suspicious. I suspect that this
  should use "(0x22 + i * 2)".

  The code later in the same function that stores the segment registers
  to the struct has the same bug.

  Found by code inspection; I don't have a test case to check this. As a
  non-x86-expert I'm just going to file a bug report in case somebody
  else feels like confirming the issue and sending a patch.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1879955/+subscriptions

