Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0D383D3A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:24:44 +0200 (CEST)
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liir6-0004fQ-0n
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liidy-0007uw-DX
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:11:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:54090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1liidu-0003T0-Nd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:11:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1liidp-0007Sc-Kv
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:11:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A05C12E821F
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 19:10:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 18:58:20 -0000
From: Thomas Huth <1885350@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 rpvrverve453-4tr5t34t5 th-huth
X-Launchpad-Bug-Reporter: Mina Magdy (rpvrverve453-4tr5t34t5)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159323684589.25927.6403829131374464357.malonedeb@gac.canonical.com>
Message-Id: <162127790057.2101.4245540364667007672.malone@wampee.canonical.com>
Subject: [Bug 1885350] Re: RISCV dynamic rounding mode is not behaving
 correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 20e545b25e7eaa406ed515c1030f188fe1efb341
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
Reply-To: Bug 1885350 <1885350@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
Is there still anything left to do here? If so, please provide the test cas=
e and switch the state back to "New" or "Confirmed", or open a new ticket i=
n the new bug tracker here: https://gitlab.com/qemu-project/qemu/-/issues

** Changed in: qemu
     Assignee: Alistair Francis (alistair2323) =3D> (unassigned)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885350

Title:
  RISCV dynamic rounding mode is not behaving correctly

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  I=E2=80=99ve gone through the RISC-V code in latest QEMU release
  (qemu-5.0.0-rc2) and when checking the Floating point encodings I
  found the rounding mode is only updated if the opcode field =E2=80=9Crm=
=E2=80=9D is
  changed =E2=80=9Cctx->frm =3D=3D rm=E2=80=9D. But according to RISC-V Vol=
ume I:
  Unprivileged ISA, there=E2=80=99s a dynamic mode when rm=3D7 where the ro=
unding
  mode is set with frm value.

  So for the same rm value (=3D7) and when changing frm value seeking
  different rounding modes, and according to the below code, the
  rounding mode won=E2=80=99t be updated. Please correct me if I got this
  implementation wrong.

  static void gen_set_rm(DisasContext *ctx, int rm)
  {
      TCGv_i32 t0;
      if (ctx->frm =3D=3D rm) {
          return;
      }
      ctx->frm =3D rm;
      t0 =3D tcg_const_i32(rm);
      gen_helper_set_rounding_mode(cpu_env, t0);
      tcg_temp_free_i32(t0);
  }

  =

  My testcase:
  I set statically the rm field in the instruction to 7 and before this exe=
cution I changed the value of frm field in fcsr register. For the 1st time =
it worked (according to the code above, the rm is updated so the round mode=
 will also be updated). But when changing fcsr register an re-execute the i=
nstruction, there's no difference and the rounding mode is the same like th=
e previous frm value.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885350/+subscriptions

