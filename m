Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14C1D72E0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 10:22:46 +0200 (CEST)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jab2r-0006cV-PM
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 04:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jab1w-0005ki-Sy
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:21:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jab1u-000387-G7
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:21:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jab1q-00043s-Qq
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 08:21:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 391572E824D
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 08:21:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2020 08:14:41 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1837094@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: slirp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd samuel-thibault
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156347205992.30489.16276823737610194084.malonedeb@soybean.canonical.com>
Message-Id: <158978968163.22954.295445845100130972.malone@gac.canonical.com>
Subject: [Bug 1837094] Re: UndefinedBehaviorSanitizer crash around
 slirp::ip_reass()
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 68616629ce8390fa3dcaa37b4063bcffc944c7b9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 04:21:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1837094 <1837094@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed in QEMU release v5.0.0

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1837094

Title:
  UndefinedBehaviorSanitizer crash around slirp::ip_reass()

Status in QEMU:
  Fix Released

Bug description:
  tag: v4.1.0-rc1

  ./configure --enable-sanitizers --extra-cflags=3D-O1

  =3D=3D26130=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown addre=
ss 0x000000000008 (pc 0x0000561ad346d588 bp 0x7fff6ee9f940 sp 0x7fff6ee9f8e=
8 T26130)
  =3D=3D26130=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D26130=3D=3DHint: address points to the zero page.
  =C2=A0=C2=A0=C2=A0=C2=A0#0 0x0000561ad346d587 in ip_deq() at slirp/src/ip=
_input.c:411:55
  =C2=A0=C2=A0=C2=A0=C2=A0#1 0x0000561ad346cffb in ip_reass() at slirp/src/=
ip_input.c:304:9
  =C2=A0=C2=A0=C2=A0=C2=A0#2 0x0000561ad346cb6f in ip_input() at slirp/src/=
ip_input.c:184:18

  I only had access to the last packet which isn't the culprit, I'm now
  seeing how to log the network traffic of the guest to provide more
  useful information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1837094/+subscriptions

