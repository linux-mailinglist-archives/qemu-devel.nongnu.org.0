Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE86381746
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:48:07 +0200 (CEST)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqty-0007S5-6Y
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhqrX-0005cc-JE
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:45:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:46452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhqrV-0003T7-1i
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:45:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhqrS-0006fK-W5
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:45:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BBAF62E8030
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:45:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 09:38:46 -0000
From: Thomas Huth <1879955@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell th-huth
X-Launchpad-Bug-Reporter: Peter Maydell (pmaydell)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159006849314.7162.9087011214859581235.malonedeb@gac.canonical.com>
Message-Id: <162107152673.21341.3233870028283593795.malone@soybean.canonical.com>
Subject: [Bug 1879955] Re: target/i386/seg_helper.c: 16-bit TSS struct format
 wrong?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: e80ea8255afd593d00965e9ac3b40da9a8c15d2b
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
Reply-To: Bug 1879955 <1879955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1879955

Title:
  target/i386/seg_helper.c: 16-bit TSS struct format wrong?

Status in QEMU:
  Incomplete

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

