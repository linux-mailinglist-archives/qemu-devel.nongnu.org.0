Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C84623412E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 10:27:03 +0200 (CEST)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1QNZ-00017Q-TM
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 04:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k1QMn-0000hc-MM
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 04:26:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:56746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k1QMl-0004v2-Ku
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 04:26:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k1QMi-0000XR-8h
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 08:26:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AB77F2E8203
 for <qemu-devel@nongnu.org>; Fri, 31 Jul 2020 08:26:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2020 08:19:32 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1781211@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hax haxm windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fsmoke philmd
X-Launchpad-Bug-Reporter: Dmitriy (fsmoke)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <153131507336.32554.286859961070270937.malonedeb@wampee.canonical.com>
Message-Id: <159618357265.10894.18108481603949702898.malone@chaenomeles.canonical.com>
Subject: [Bug 1781211] Re: HAXM acceleration does not work at all.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 91b3a8889f2c1ea2622bdcabb5fe1982a740cae0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 02:41:21
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
Reply-To: Bug 1781211 <1781211@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This issue has been fixed in HAXM, see:
"save/restore FPU registers in VM entry/exit"
https://github.com/intel/haxm/commit/6c2cd4d79d

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1781211

Title:
  HAXM acceleration does not work at all.

Status in QEMU:
  Invalid

Bug description:
  I have qemu windows build 2.12.90, haxm 7.2.0. Ubuntu, nor arch linux doe=
s not works when i turn on hax acceleration. Permanent kernel panics, black=
 screen freezing and other crashes happens when i run qemu.
  Qemu crashed with hax - when i ran it from iso. It crashed on already ins=
talled system - it's not matters. =


  Versions:
  archlinux-2018.07.01-x86_64
  ubuntu-18.04-live-server-amd64.iso

  I run qemu-system-x86_64.exe binary.

  My CPU:
  core i7 2600k

  See screenshot

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1781211/+subscriptions

