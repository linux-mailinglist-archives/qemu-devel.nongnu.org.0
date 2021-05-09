Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44E377792
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:27:44 +0200 (CEST)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfmHP-0008AX-Kd
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfmFO-0006f4-4E
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:25:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:60394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfmFL-00071q-Kr
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:25:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfmFK-0006vH-0r
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 16:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EBCC72E8010
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 16:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 16:16:21 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1926277@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: dvpe evpe mips mt
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hansni philmd
X-Launchpad-Bug-Reporter: Hansni Bu (hansni)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161951518027.9817.15696784713381088226.malonedeb@soybean.canonical.com>
Message-Id: <162057698151.16081.8909716252694469134.malone@soybean.canonical.com>
Subject: [Bug 1926277] Re: MIPS MT dvpe does not regard VPEConf0.MVP  
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: d1709a7d8b16252c2c37842dc2968e2d50fed0cb
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1926277 <1926277@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/244


** Changed in: qemu
       Status: Confirmed =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #244
   https://gitlab.com/qemu-project/qemu/-/issues/244

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926277

Title:
  MIPS MT dvpe does not regard VPEConf0.MVP

Status in QEMU:
  Invalid

Bug description:
  Hi,

  According to MIPS32=C2=AE Architecture for Programmers VolumeIV-f: The
  MIPS=C2=AE MT Application-Speci=EF=AC=81c Extension to the MIPS32=C2=AE A=
rchitecture,
  for instruction: dvpe, evpe:

  If the VPE executing the instruction is not a Master VPE, with the MVP
  bit of the VPEConf0 register set, the EVP bit is unchanged by the
  instruction.

  The pseudo code is:

  data =E2=86=90  MVPControl
  GPR[rt] =E2=86=90  data
  if(VPEConf0.MVP =3D 1) then
    MVPControl.EVP =E2=86=90  sc
  endif

  However the helper functions of dvpe, evpe does not regard the
  VPEConf0.MVP bit, namely, it does not check if the VPE is a master
  VPE. Code is copied below as:

  target_ulong helper_dvpe(CPUMIPSState *env)
  {
      CPUState *other_cs =3D first_cpu;
      target_ulong prev =3D env->mvp->CP0_MVPControl;

      CPU_FOREACH(other_cs) {
          MIPSCPU *other_cpu =3D MIPS_CPU(other_cs);
          /* Turn off all VPEs except the one executing the dvpe.  */
          if (&other_cpu->env !=3D env) {
              other_cpu->env.mvp->CP0_MVPControl &=3D ~(1 << CP0MVPCo_EVP);
              mips_vpe_sleep(other_cpu);
          }
      }
      return prev;
  }

  Is this a bug?

  QEMU head commit: 0cef06d18762374c94eb4d511717a4735d668a24 is checked.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926277/+subscriptions

