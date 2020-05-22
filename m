Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4E1DF010
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 21:37:37 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jcDU8-0005iM-VY
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 15:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jcDSB-0003bc-N9
 for qemu-devel@nongnu.org; Fri, 22 May 2020 15:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jcDSA-0002G4-V8
 for qemu-devel@nongnu.org; Fri, 22 May 2020 15:35:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jcDS9-0000cP-GU
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 19:35:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F4AF2E8076
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 19:35:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2020 19:25:55 -0000
From: Thomas Huth <1693649@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paul-whooppee th-huth
X-Launchpad-Bug-Reporter: Paul Goyette (paul-whooppee)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149575946555.18286.18117412791023512529.malonedeb@chaenomeles.canonical.com>
Message-Id: <159017555604.7915.4013692688620158864.malone@gac.canonical.com>
Subject: [Bug 1693649] Re: x86 pause misbehaves with -cpu haswell
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1f7bc749b40714a4cc10f5e4d787118a78037035";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fb8fd90c195c3a8c6787cdd234be4799385c8706
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 14:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1693649 <1693649@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for checking again! So I'm closing this ticket now.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1693649

Title:
  x86 pause misbehaves with -cpu haswell

Status in QEMU:
  Fix Released

Bug description:
  Using qemu-2.9.0

  When booting NetBSD using '-cpu haswell -smp 4', the system fails to
  initialize the additional CPUs.  It appears as though the "application
  processor" enters routine x86_pause() but never returns.

  x86_pause() is simply two assembler instructions: 'pause; ret;'

  Replacing the routine with 'nop; nop; ret;' allows the system to
  proceed, of course without the benefit of the pause instruction on
  spin-loops!

  Additionally, booting with '-cpu phenom -smp 4' also works, although
  the system does seem confused about the type of CPU being used.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1693649/+subscriptions

