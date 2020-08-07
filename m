Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210D23F2E6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 20:48:27 +0200 (CEST)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k47Pm-0001Hu-A3
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 14:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k47N5-0007MD-Ns
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 14:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:34402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k47N2-0000kK-3m
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 14:45:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k47Mv-0005EH-U4
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 18:45:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DE9F22E8081
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 18:45:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 18:31:26 -0000
From: Thomas Huth <1503031@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrewoates th-huth
X-Launchpad-Bug-Reporter: Andrew Oates (andrewoates)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151005203328.1986.66361.malonedeb@wampee.canonical.com>
Message-Id: <159682508643.26498.4252052376498889849.malone@gac.canonical.com>
Subject: [Bug 1503031] Re: 32-to-64-bit call gate unsupported in IA32e mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4d362a8e1e2709349b73d9f806bb468c61e21075
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1503031 <1503031@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1503031

Title:
  32-to-64-bit call gate unsupported in IA32e mode

Status in QEMU:
  Incomplete

Bug description:
  In particular, the lcall implementation doesn't support the 64-bit
  TSS.

  helper_lcall_protected (target-i386/seg_helper.c:1884) calls
  get_ss_esp_from_tss() on a call gate to a lower privilege level, which
  tries to extract a 32-bit ESP and 16-bit SS from the TSS.  In IA32e
  mode (64-bit or compatibility mode), this instead grabs the lower
  32-bits of the target RSP, and 16 of the upper bits as the SS.
  Additionally, several of the subsequent checks are incorrect (even if
  the correct stack pointer were extracted).

  This isn't a problem for interrupts since the interrupts are given
  their own implementation entirely, that uses get_rsp_from_tss() rather
  than get_ss_esp_from_tss().

  I believe the missing logic is from the branch starting "ELSE (*
  current TSS is 64-bit *)" in the CALL pseudocode in the Intel manual
  (page 3-124 of the PDF I have).

  Reproduced at master (c0b520dfb8890294a9f8879f4759172900585995), and
  also as of a qemu built a year ago.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1503031/+subscriptions

