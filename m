Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BA371473
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:44:14 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWzl-0007fk-N5
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWvF-0005dc-LY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:39:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:46532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWvB-0002tj-2y
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:39:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldWv9-0004NB-7m
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:39:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 28B7C2E8164
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 11:39:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 11:28:06 -0000
From: Thomas Huth <1128935@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=helenos; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: exception helenos mips tlb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agraf blauwirbel iurcic jakub th-huth
X-Launchpad-Bug-Reporter: Jakub Jermar (jakub)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130218102749.9311.80891.malonedeb@gac.canonical.com>
Message-Id: <162004128705.3909.8924140822444838619.malone@chaenomeles.canonical.com>
Subject: [Bug 1128935] Re: MIPS r4k "TLB modified exception" generated for TLB
 entries that are not visible to the TLBP instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a724797f10a123d3485d742be2fd51fe28ba829a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1128935 <1128935@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/94


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #94
   https://gitlab.com/qemu-project/qemu/-/issues/94

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1128935

Title:
  MIPS r4k "TLB modified exception" generated for TLB entries that are
  not visible to the TLBP instruction

Status in HelenOS branches:
  New
Status in QEMU:
  Expired

Bug description:
  I occasionally see that the TLBP instruction fails to find the
  corresponding TLB entry in the TLB Modified exception handler.  This
  behavior is unexpected, because the invocation of the TLB Modified
  exception suggests there indeed is such an entry in the TLB and only
  requires its dirty bit to be set.

  The operating system which can trigger and is susceptible to this
  behavior is a HelenOS branch located in lp:~jakub/helenos/mips-malta.
  The QEMU version on which this is reproducible is QEMU 1.4.0 and also
  some others.

  When I looked into the QEMU sources, I noticed the following
  discrepancy, which could potentially explain the behavior:

    65  /* MIPS32/MIPS64 R4000-style MMU emulation */
    66 int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
    67                      target_ulong address, int rw, int access_type)
    68 {
    <snip>
    72     for (i =3D 0; i < env->tlb->tlb_in_use; i++) {

  1865 void r4k_helper_tlbp(CPUMIPSState *env)
  1866 {
   <snip>
  1875     for (i =3D 0; i < env->tlb->nb_tlb; i++) {

  From the above it appears as if the the code which searches the TLB
  for a matching entry searched also the QEMU-specific "shadow" TLB
  entries, which is, however, not in line with how the TLBP instruction
  searches the TLB. So if a matching entry is found on index >=3D
  tlb_in_use, the HelenOS exception handler using TLBP to locate the
  entry would hit an assertion on seeing the Index register bit P set.

  I also suspect there is a similar issue with the TLB Invalid
  exception, but thanks to the specifics of the MIPS 4Kc CPU, HelenOS is
  not susceptible in this case.

To manage notifications about this bug go to:
https://bugs.launchpad.net/helenos/+bug/1128935/+subscriptions

