Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FD2279D5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 09:51:42 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxn3s-0007XA-Jo
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 03:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxn38-000768-Kk
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:50:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jxn36-0000Vq-MI
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 03:50:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jxn34-00029y-4L
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 07:50:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1FC192E80F0
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 07:50:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2020 07:37:44 -0000
From: Bug Watch Updater <1886811@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=Laurent@vivier.eu; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: emojifreak laurent-vivier
X-Launchpad-Bug-Reporter: Ryutaroh Matsumoto (emojifreak)
X-Launchpad-Bug-Modifier: Bug Watch Updater (bug-watch-updater)
References: <159420830935.32230.13858618076699173558.malonedeb@gac.canonical.com>
Message-Id: <159531706591.17801.15664508169107079713.launchpad@loganberry.canonical.com>
Subject: [Bug 1886811] Re: systemd complains Failed to enqueue loopback
 interface start request: Operation not supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fca99296394d1eb0ed5cdd596e3d65abb2ef6649
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 03:50:50
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
Reply-To: Bug 1886811 <1886811@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu (Debian)
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886811

Title:
  systemd complains Failed to enqueue loopback interface start request:
  Operation not supported

Status in QEMU:
  Fix Committed
Status in qemu package in Ubuntu:
  New
Status in qemu package in Debian:
  Fix Released

Bug description:
  This symptom seems similar to
  https://bugs.launchpad.net/qemu/+bug/1823790

  Host Linux: Debian 11 Bullseye (testing) on x84-64 architecture
  qemu version: latest git of git commit hash eb2c66b10efd2b914b56b20ae9065=
5914310c925
  compiled with "./configure --static --disable-system" =


  Down stream bug report at https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D964289
  Bug report (closed) to systemd: https://github.com/systemd/systemd/issues=
/16359

  systemd in armhf and armel (both little endian 32-bit) containers fail to=
 start with
  Failed to enqueue loopback interface start request: Operation not support=
ed

  How to reproduce on Debian (and probably Ubuntu):
  mmdebstrap --components=3D"main contrib non-free" --architectures=3Darmhf=
 --variant=3Dimportant bullseye /var/lib/machines/armhf-bullseye
  systemd-nspawn -D /var/lib/machines/armhf-bullseye -b

  When "armhf" architecture is replaced with "mips" (32-bit big endian) or =
"ppc64"
  (64-bit big endian), the container starts up fine.

  The same symptom is also observed with "powerpc" (32-bit big endian)
  architecture.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886811/+subscriptions

