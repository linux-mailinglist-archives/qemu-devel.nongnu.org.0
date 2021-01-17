Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F062F9071
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 05:28:39 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0zg6-000714-82
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 23:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0ze0-0005fn-6E
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 23:26:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0zdw-0005RE-Ai
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 23:26:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0zdr-0001f1-Ik
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 04:26:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CA5B2E8175
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 04:26:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 Jan 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1757363@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mips
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dantachen janitor philmd
X-Launchpad-Bug-Reporter: dantachen (dantachen)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152162151775.22331.14638507477656772309.malonedeb@soybean.canonical.com>
Message-Id: <161085703961.5995.17811348886037775649.malone@loganberry.canonical.com>
Subject: [Bug 1757363] Re: infinite loop due to improper deal with "eret" on
 mips32
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 18f0b345db1dba2544491ee3f6aee98d0528cd6e
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
Reply-To: Bug 1757363 <1757363@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1757363

Title:
  infinite loop due to improper deal with "eret" on mips32

Status in QEMU:
  Expired

Bug description:
  1.qemu 2.9.1 release on the official web build with tcg
  2.cmd: qemu-system-mips -kernel kernelfile
  3. host: ubuntu 16.04.1 with linux kernel 4.6.2 x86_64
     guest: mips bigendian 32bit (tplink firmware)

  =

  detail:

  static inline void exception_return(CPUMIPSState *env)
  {
      debug_pre_eret(env);
      if (env->CP0_Status & (1 << CP0St_ERL)) {
          set_pc(env, env->CP0_ErrorEPC);
          env->CP0_Status &=3D ~(1 << CP0St_ERL);
      } else {
          set_pc(env, env->CP0_EPC);
          env->CP0_Status &=3D ~(1 << CP0St_EXL);=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> ISSUE????
      }
      compute_hflags(env);
      debug_post_eret(env);
  }

  void helper_eret(CPUMIPSState *env)
  {
      exception_return(env);
      env->lladdr =3D 1;
  }

  =

  In the Issue Line, there is no check CP0_Status whether int is disabled (=
should not enter int routine),
  that result in the cpu can not jump out the int routine.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1757363/+subscriptions

