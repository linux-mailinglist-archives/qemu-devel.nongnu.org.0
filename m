Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F6240D24
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 20:46:41 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Coh-0007hV-TM
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 14:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5Cnp-0007Gs-8h
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 14:45:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5Cnn-0006Fz-23
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 14:45:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k5Cnj-0006sz-Hx
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 18:45:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 83FE42E8082
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 18:45:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2020 18:37:46 -0000
From: Andreas Schwab <1793539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anarchetic schwab-linux-m68k
X-Launchpad-Bug-Reporter: Andreas Schwab (schwab-linux-m68k)
X-Launchpad-Bug-Modifier: Andreas Schwab (schwab-linux-m68k)
References: <153745238166.24916.6273048340249119390.malonedeb@gac.canonical.com>
Message-Id: <159708466681.9290.15120981847318833844.malone@wampee.canonical.com>
Subject: [Bug 1793539] Re: qemu:handle_cpu_signal received signal outside vCPU
 context @ pc=0x6003ddc5
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f3ea7e592890ed34cff6061a8c7ffdf7c8d22ede
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 14:45:39
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
Reply-To: Bug 1793539 <1793539@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As you can see in the build log the package builds sucessfully.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793539

Title:
  qemu:handle_cpu_signal received signal outside vCPU context @
  pc=3D0x6003ddc5

Status in QEMU:
  Fix Released

Bug description:
  During the build of gedit for RISC-V this error occurs:

  $ qemu-riscv64 -E LD_LIBRARY_PATH=3Dgedit/.libs ./gedit/.libs/gedit
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x6003=
ddc5
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x6000=
09e4

  https://build.opensuse.org/package/live_build_log/openSUSE:Factory:RISCV/=
gedit/standard/riscv64

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793539/+subscriptions

