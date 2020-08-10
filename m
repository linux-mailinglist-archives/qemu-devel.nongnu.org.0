Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47D240953
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 17:32:07 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k59mQ-0001Eh-7r
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 11:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k59lJ-0000Mg-Be
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:30:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k59lF-0007Z0-Tq
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:30:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k59lC-0004Vc-BD
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 15:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 617272E8127
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 15:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2020 15:25:13 -0000
From: Steve Dodd <1793539@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anarchetic schwab-linux-m68k
X-Launchpad-Bug-Reporter: Andreas Schwab (schwab-linux-m68k)
X-Launchpad-Bug-Modifier: Steve Dodd (anarchetic)
References: <153745238166.24916.6273048340249119390.malonedeb@gac.canonical.com>
Message-Id: <159707311336.5370.18359742352314244188.malone@soybean.canonical.com>
Subject: [Bug 1793539] Re: qemu:handle_cpu_signal received signal outside vCPU
 context @ pc=0x6003ddc5
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8d4482a4e3020fd16513f46f92f61c66ea99d37f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:25:02
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

Actually more likely https://github.com/vivier/qemu-m68k/issues/33, in
which case it's also fixed..

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793539

Title:
  qemu:handle_cpu_signal received signal outside vCPU context @
  pc=3D0x6003ddc5

Status in QEMU:
  New

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

